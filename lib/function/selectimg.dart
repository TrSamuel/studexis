import 'package:image_picker/image_picker.dart';
import 'package:studdataapp/presentation/widgets/valuenotifiers.dart';

selectImage() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    imgPreview.value = await image.readAsBytes();
  } else {}
}
