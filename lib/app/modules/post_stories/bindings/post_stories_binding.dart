import 'package:get/get.dart';

import '../controllers/post_stories_controller.dart';

class PostStoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostStoriesController>(
      () => PostStoriesController(),
    );
  }
}
