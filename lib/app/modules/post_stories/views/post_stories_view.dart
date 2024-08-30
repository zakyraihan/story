import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_stories_controller.dart';

class PostStoriesView extends GetView<PostStoriesController> {
  const PostStoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostStoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PostStoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
