import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:siente_app/app/controllers/imagedetail_controller.dart';

class ImageDetailPage extends GetView<ImageDetailController> {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(controller.image),
      enableRotation: true,
      tightMode: true,
      heroAttributes: PhotoViewHeroAttributes(tag: controller.index.toString()),
    );
  }
}
