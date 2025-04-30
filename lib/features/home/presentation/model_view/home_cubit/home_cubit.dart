import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  XFile? pickedImage;
  void diagnosisStateEmitter() async {
    emit(CallAIModelLoading());
    final result = await homeRepo.diagnoseCase(pickedImage!);
    result.fold(
      (apiErrorModel) {
        emit(
          CallAIModelFailure(apiErrorModel: apiErrorModel),
        );
      },
      (diagnosis) async {
        final addTestResult = await homeRepo.addTest(diagnosis.first);
        final sendEmailResult = await homeRepo.sendEmail(diagnosis.first);
       
        if (addTestResult.isRight() && sendEmailResult.isRight()) {
          emit(CallAIModelSuccess(diagnosis: diagnosis));
        } else {
          emit(
            CallAIModelFailure(
              apiErrorModel: ApiErrorModel(
                message: 'Failed to add test or send email',
              ),
            ),
          );
        }
      },
    );
  }



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
