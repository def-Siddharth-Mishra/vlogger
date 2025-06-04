import 'package:flutter/material.dart';

import '../../../../data/entities/post.dart';

class CreatePostScreen extends StatefulWidget {
  final int? userId;

  const CreatePostScreen({this.userId, super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newPost = UserPost(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text,
        body: _bodyController.text,
        tags: [],
        reactions: PostReactions(likes: 0, dislikes: 0),
        views: 0,
        userId: widget.userId ?? -1,
      );

      Navigator.pop(context, newPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator:
                    (val) =>
                        val == null || val.trim().isEmpty
                            ? 'Please enter a title'
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Body'),
                maxLines: 4,
                validator:
                    (val) =>
                        val == null || val.trim().isEmpty
                            ? 'Please enter body text'
                            : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
