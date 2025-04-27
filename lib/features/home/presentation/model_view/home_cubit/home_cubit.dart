import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  XFile? pickedImage;

  void cancelImage() {
    pickedImage = null;
    emit(PickImageDone());
  }

  Future pickImageFromGallery() async {
    pickedImage = await _pickImage(source: ImageSource.gallery);
    pickedImage != null ? emit(PickImageDone()) : null;
  }

  Future pickImageFromCamera() async {
    pickedImage = await _pickImage(source: ImageSource.camera);
    pickedImage != null ? emit(PickImageDone()) : null;
  }

  Future<XFile?> _pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    return pickedImage; // no need for manual null check
  }
}
