import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/profile/presentation/cubit/image_state.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImagePicker _picker = ImagePicker();
  ImageCubit() : super(ImageInit());

  Future<void> pickImage() async {
    emit(ImageLoading());
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        emit(ImageSuccess(image: pickedFile));
      } else {
        emit(ImageError(message: 'Cancelled'));
      }
    } catch (e) {
      emit(ImageError(message: e.toString()));
    }
  }
}
