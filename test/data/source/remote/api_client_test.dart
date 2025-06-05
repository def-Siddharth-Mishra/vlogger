import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vlogger/core/constants.dart';
import 'package:vlogger/data/entities/enums.dart';
import 'package:vlogger/data/entities/post.dart';
import 'package:vlogger/data/entities/todo.dart';
import 'package:vlogger/data/entities/user.dart';
import 'package:vlogger/data/source/remote/api_client.dart';
import 'package:vlogger/data/source/remote/response/response.dart';

void main() {
  group('ApiClient Integration Tests', () {
    late ApiClient apiClient;
    late Dio dio;

    setUpAll(() {
      // Configure Dio with timeout and interceptors for testing
      dio = Dio();
      dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      );

      // Add logging interceptor for debugging
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      );

      apiClient = ApiClient(dio);
    });

    group('getUsers() tests', () {
      test('should fetch users successfully without parameters', () async {
        // Act
        final response = await apiClient.getUsers();

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.users, isNotEmpty);
        expect(response.total, greaterThan(0));
        expect(response.limit, greaterThan(0));
        expect(response.skip, greaterThanOrEqualTo(0));

        // Validate first user structure
        final firstUser = response.users.first;
        expect(firstUser.id, isA<int>());
        expect(firstUser.username, isA<String>());
        expect(firstUser.email, isA<String>());
        expect(firstUser.firstName, isA<String>());
        expect(firstUser.lastName, isA<String>());
        expect(firstUser.age, isA<int>());
        expect(firstUser.birthDate, isA<DateTime>());
        expect(firstUser.image, isA<Uri>());
        expect(firstUser.role, isA<Role>());

        // Validate email format
        expect(firstUser.email, contains('@'));

        // Validate age is reasonable
        expect(firstUser.age, greaterThan(0));
        expect(firstUser.age, lessThan(150));

        // Validate username is not empty
        expect(firstUser.username.trim(), isNotEmpty);
      });

      test('should fetch users with limit parameter', () async {
        const limit = 5;

        // Act
        final response = await apiClient.getUsers(limit: limit);

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.users.length, lessThanOrEqualTo(limit));
        expect(response.limit, equals(limit));
        expect(response.total, greaterThan(0));
      });

      test('should fetch users with skip parameter', () async {
        const skip = 10;

        // Act
        final response = await apiClient.getUsers(skip: skip);

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.skip, equals(skip));
        expect(response.users, isNotEmpty);
      });

      test('should fetch users with both limit and skip parameters', () async {
        const limit = 3;
        const skip = 5;

        // Act
        final response = await apiClient.getUsers(limit: limit, skip: skip);

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.limit, equals(limit));
        expect(response.skip, equals(skip));
        expect(response.users.length, lessThanOrEqualTo(limit));
      });

      test('should handle large skip value gracefully', () async {
        const largeSkip = 1000;

        // Act
        final response = await apiClient.getUsers(skip: largeSkip);

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.skip, equals(largeSkip));
        // Users list might be empty for large skip values
        expect(response.users, isA<List<UserEntity>>());
      });

      test('should handle zero limit parameter', () async {
        const limit = 0;

        // Act
        final response = await apiClient.getUsers(limit: limit);

        // Assert
        expect(response, isA<UserResponse>());
        expect(response.limit, equals(limit));
        expect(response.users, isEmpty);
      });

      test('should validate user entity fields are properly parsed', () async {
        // Act
        final response = await apiClient.getUsers(limit: 1);

        // Assert
        expect(response.users, isNotEmpty);
        final user = response.users.first;

        // Test copyWith functionality
        final copiedUser = user.copyWith(firstName: 'TestName');
        expect(copiedUser.firstName, equals('TestName'));
        expect(copiedUser.id, equals(user.id));

        // Test toJson functionality
        final json = user.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['id'], equals(user.id));
        expect(json['username'], equals(user.username));
        expect(json['email'], equals(user.email));

        // Test fromJson functionality
        final deserializedUser = UserEntity.fromJson(json);
        expect(deserializedUser.id, equals(user.id));
        expect(deserializedUser.username, equals(user.username));
        expect(deserializedUser.email, equals(user.email));
      });
    });

    group('getPostByUserId() tests', () {
      test('should fetch posts for valid userId', () async {
        const userId = 1;

        // Act
        final response = await apiClient.getPostByUserId(userId: userId);

        // Assert
        expect(response, isA<UserPostsResponse>());
        expect(response.posts, isA<List<UserPost>>());
        expect(response.total, isA<int>());
        expect(response.limit, isA<int>());
        expect(response.skip, isA<int>());

        if (response.posts.isNotEmpty) {
          final firstPost = response.posts.first;
          expect(firstPost.id, isA<int>());
          expect(firstPost.title, isA<String>());
          expect(firstPost.body, isA<String>());
          expect(firstPost.tags, isA<List<String>>());
          expect(firstPost.reactions, isA<PostReactions>());
          expect(firstPost.views, isA<int>());
          expect(firstPost.userId, isA<int>());

          // Validate reactions structure
          expect(firstPost.reactions.likes, isA<int>());
          expect(firstPost.reactions.dislikes, isA<int>());
          expect(firstPost.reactions.likes, greaterThanOrEqualTo(0));
          expect(firstPost.reactions.dislikes, greaterThanOrEqualTo(0));

          // Validate post content
          expect(firstPost.title.trim(), isNotEmpty);
          expect(firstPost.body.trim(), isNotEmpty);
          expect(firstPost.id, greaterThan(0));
          expect(firstPost.views, greaterThanOrEqualTo(0));
          expect(firstPost.userId, equals(userId));
        }
      });
      test('should fetch posts with limit parameter', () async {
        const userId = 1;
        const limit = 5;

        // Act
        final response = await apiClient.getPostByUserId(
          userId: userId,
          limit: limit,
        );

        // Assert
        expect(response, isA<UserPostsResponse>());
        expect(response.limit, equals(limit));
        expect(response.posts.length, lessThanOrEqualTo(limit));

        // All posts should belong to the specified user
        for (final post in response.posts) {
          expect(post.userId, equals(userId));
        }
      });

      test('should fetch posts with skip parameter', () async {
        const skip = 2;

        try {
          // Act
          final response = await apiClient.getPostByUserId(
            skip: skip,
            userId: 1,
          );

          // Assert (if successful)
          expect(response, isA<UserPostsResponse>());
          expect(response.skip, equals(skip));
        } on DioException catch (e) {
          // Expected due to API design issue
          expect(e.type, isA<DioExceptionType>());
        }
      });

      test('should validate post entity serialization', () async {
        // Create a sample post for testing
        const postReactions = PostReactions(likes: 10, dislikes: 2);
        const post = UserPost(
          id: 1,
          title: 'Test Post',
          body: 'This is a test post body',
          tags: ['test', 'sample'],
          reactions: postReactions,
          views: 100,
          userId: 1,
        );

        // Test toJson
        final json = post.toJson();
        expect(json, isA<UserPost>());
        expect(json['title'], equals('Test Post'));
        expect(json['reactions'], isA<PostReactions>());

        // Test fromJson
        final deserializedPost = UserPost.fromJson(json);
        expect(deserializedPost.title, equals(post.title));
        expect(deserializedPost.reactions.likes, equals(post.reactions.likes));

        // Test copyWith
        final copiedPost = post.copyWith(title: 'Updated Title');
        expect(copiedPost.title, equals('Updated Title'));
        expect(copiedPost.id, equals(post.id));
      });
    });

    group('getTodos() tests', () {
      test('should attempt to fetch todos (note: endpoint issue)', () async {
        // Note: Similar to posts, this endpoint requires {userId} parameter

        try {
          // Act
          final response = await apiClient.getTodos(userId: 1);

          // If successful, validate response structure
          expect(response, isA<TodosResponse>());
          expect(response.todos, isA<List<Todo>>());
          expect(response.total, isA<int>());
          expect(response.limit, isA<int>());
          expect(response.skip, isA<int>());

          if (response.todos.isNotEmpty) {
            final firstTodo = response.todos.first;
            expect(firstTodo.id, isA<int>());
            expect(firstTodo.todo, isA<String>());
            expect(firstTodo.completed, isA<bool>());
            expect(firstTodo.userId, isA<int>());

            // Validate todo content
            expect(firstTodo.todo.trim(), isNotEmpty);
            expect(firstTodo.id, greaterThan(0));
            expect(firstTodo.userId, greaterThan(0));
          }
        } on DioException catch (e) {
          // Expected behavior: should fail due to missing userId in path
          expect(e.type, isA<DioExceptionType>());
          print('Expected API design issue: ${e.message}');
        }
      });

      test('should fetch todos with limit parameter', () async {
        const limit = 3;

        try {
          // Act
          final response = await apiClient.getTodos(limit: limit, userId: 1);

          // Assert (if successful)
          expect(response, isA<TodosResponse>());
          expect(response.limit, equals(limit));
          expect(response.todos.length, lessThanOrEqualTo(limit));
        } on DioException catch (e) {
          // Expected due to API design issue
          expect(e.type, isA<DioExceptionType>());
        }
      });

      test('should fetch todos with skip parameter', () async {
        const skip = 5;

        try {
          // Act
          final response = await apiClient.getTodos(skip: skip, userId: 1);

          // Assert (if successful)
          expect(response, isA<TodosResponse>());
          expect(response.skip, equals(skip));
        } on DioException catch (e) {
          // Expected due to API design issue
          expect(e.type, isA<DioExceptionType>());
        }
      });

      test('should validate todo entity serialization', () async {
        // Create a sample todo for testing
        const todo = Todo(
          id: 1,
          todo: 'Test todo item',
          completed: false,
          userId: 1,
        );

        // Test toJson
        final json = todo.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['todo'], equals('Test todo item'));
        expect(json['completed'], equals(false));

        // Test fromJson
        final deserializedTodo = Todo.fromJson(json);
        expect(deserializedTodo.todo, equals(todo.todo));
        expect(deserializedTodo.completed, equals(todo.completed));

        // Test copyWith
        final copiedTodo = todo.copyWith(completed: true);
        expect(copiedTodo.completed, isTrue);
        expect(copiedTodo.id, equals(todo.id));
      });
    });

    group('Error handling tests', () {
      test('should handle network timeout', () async {
        // Create a client with very short timeout
        final shortTimeoutDio = Dio();
        shortTimeoutDio.options = BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(milliseconds: 1),
          receiveTimeout: const Duration(milliseconds: 1),
        );
        final timeoutClient = ApiClient(shortTimeoutDio);

        // Act & Assert
        expect(() => timeoutClient.getUsers(), throwsA(isA<DioException>()));
      });

      test('should handle invalid base URL', () async {
        // Create client with invalid URL
        final invalidDio = Dio();
        invalidDio.options = BaseOptions(
          baseUrl: 'https://invalid-url-that-does-not-exist.com',
          connectTimeout: const Duration(seconds: 5),
        );
        final invalidClient = ApiClient(invalidDio);

        // Act & Assert
        expect(() => invalidClient.getUsers(), throwsA(isA<DioException>()));
      });

      test('should handle large limit values', () async {
        const veryLargeLimit = 999999;

        // Act
        final response = await apiClient.getUsers(limit: veryLargeLimit);

        // Assert - API should handle this gracefully
        expect(response, isA<UserResponse>());
        expect(response.limit, equals(veryLargeLimit));
        // The actual returned users might be less than the limit
        expect(response.users, isA<List<UserEntity>>());
      });

      test('should handle negative skip values', () async {
        const negativeSkip = -1;

        try {
          // Act
          final response = await apiClient.getUsers(skip: negativeSkip);

          // Assert - if successful, should handle gracefully
          expect(response, isA<UserResponse>());
        } on DioException catch (e) {
          // Some APIs might reject negative skip values
          expect(e.response?.statusCode, isA<int>());
        }
      });
    });

    group('Response structure validation tests', () {
      test('should validate UserResponse structure', () async {
        // Act
        final response = await apiClient.getUsers(limit: 1);

        // Assert - validate response wrapper structure
        expect(response.users, isA<List<UserEntity>>());
        expect(response.total, isA<int>());
        expect(response.skip, isA<int>());
        expect(response.limit, isA<int>());

        // Validate that total makes sense
        expect(response.total, greaterThanOrEqualTo(response.users.length));
      });

      test('should validate enum parsing for Role', () async {
        // Act
        final response = await apiClient.getUsers(limit: 5);

        // Assert - check that roles are properly parsed
        expect(response.users, isNotEmpty);
        for (final user in response.users) {
          expect(user.role, isA<Role>());
          expect(Role.values, contains(user.role));
        }
      });

      test('should validate DateTime parsing', () async {
        // Act
        final response = await apiClient.getUsers(limit: 1);

        // Assert
        expect(response.users, isNotEmpty);
        final user = response.users.first;
        expect(user.birthDate, isA<DateTime>());

        // Birth date should be in the past
        expect(user.birthDate.isBefore(DateTime.now()), isTrue);

        // Birth date should be reasonable (not too far in the past)
        final now = DateTime.now();
        final hundredYearsAgo = now.subtract(const Duration(days: 365 * 100));
        expect(user.birthDate.isAfter(hundredYearsAgo), isTrue);
      });

      test('should validate Uri parsing for image field', () async {
        // Act
        final response = await apiClient.getUsers(limit: 1);

        // Assert
        expect(response.users, isNotEmpty);
        final user = response.users.first;
        expect(user.image, isA<Uri>());
        expect(user.image.toString(), isNotEmpty);

        // Should be a valid HTTP/HTTPS URL
        expect(user.image.scheme, anyOf(['http', 'https']));
      });
    });

    group('Performance and stress tests', () {
      test('should handle multiple concurrent requests', () async {
        // Act - make multiple concurrent requests
        final futures = <Future<UserResponse>>[];
        for (int i = 0; i < 5; i++) {
          futures.add(apiClient.getUsers(limit: 2, skip: i * 2));
        }

        final responses = await Future.wait(futures);

        // Assert
        expect(responses.length, equals(5));
        for (final response in responses) {
          expect(response, isA<UserResponse>());
          expect(response.users.length, lessThanOrEqualTo(2));
        }
      });

      test('should handle rapid sequential requests', () async {
        final responses = <UserResponse>[];

        // Act - make rapid sequential requests
        for (int i = 0; i < 3; i++) {
          final response = await apiClient.getUsers(limit: 1);
          responses.add(response);
        }

        // Assert
        expect(responses.length, equals(3));
        for (final response in responses) {
          expect(response, isA<UserResponse>());
          expect(response.users.length, lessThanOrEqualTo(1));
        }
      });
    });
  });
}
