import 'package:image_picker/image_picker.dart';

abstract class ImageState {}

class ImageInit extends ImageState {}

class ImageLoading extends ImageState {}

class ImageError extends ImageState {
  final String message;
  ImageError({required this.message});
}

class ImageSuccess extends ImageState {
  final XFile image;
  ImageSuccess({required this.image});
}
