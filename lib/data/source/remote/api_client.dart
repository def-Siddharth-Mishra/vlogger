import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vlogger/core/constants.dart';
import 'package:vlogger/data/source/remote/response/response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(AppConstants.users)
  Future<UserResponse> getUsers({
    @Query('limit') int? limit,
    @Query('skip') int? skip,
  });

  @GET(AppConstants.posts)
  Future<UserPostsResponse> getPostByUserId({
    @Path('userId') required int userId,
    @Query('limit') int? limit,
    @Query('skip') int? skip,
  });

  @GET(AppConstants.todos)
  Future<TodosResponse> getTodos({
    @Query('userId') required int userId,
    @Query('limit') int? limit,
    @Query('skip') int? skip,
  });
}

// class ResultAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
//   @override
//   Future<Result<T>> adapt(Future<T> Function() call) async {
//     try {
//       final response = await call();
//       return Result<T>.ok(response);
//     } on DioException catch (e) {
//       return Result<T>.error(e.message ?? 'Unknown error');
//     } catch (e) {
//       return Result<T>.error(e.toString());
//     }
//   }
// }
