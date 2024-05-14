import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

class AddLogo extends StatelessWidget {
  const AddLogo(
      {super.key,
      this.pathLogo,
      required this.onCreateLogo,
      required this.onRemoveLogo});
  final String? pathLogo; // Лого с сервера
  final ValueChanged<File> onCreateLogo; // Изменение лого
  final void Function() onRemoveLogo; // Удаление лого
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleBlocPageProfileInfo(
          title: 'Логотип (необязательно)',
          subTitle: 'png, jpg, svg до 2 Мб',
        ),
        pathLogo == null ? _logoButton() : _logoNetwork(),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _logoButton() {
    return InkWell(
      onTap: _croppedLogo,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.hex696969,
          ),
          SvgPicture.asset(
            AppAssets.iconAdd,
            height: 30,
            width: 30,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }

  Widget _logoNetwork() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ImageNetworkIndicator(
            src: pathLogo!,
            height: 100,
            width: 100,
          ),
        ),
        InkWell(
          onTap: onRemoveLogo,
          child: SvgPicture.asset(
            AppAssets.iconClose,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Future<void> _croppedLogo() async {
    //Выбрать файл
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //cropped logo
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        cropStyle: CropStyle.circle,
        compressQuality: 20,
        uiSettings: [
          AndroidUiSettings(
            showCropGrid: false,
            hideBottomControls: true,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            cancelButtonTitle: 'Отмена',
            doneButtonTitle: 'Далее',
            aspectRatioPickerButtonHidden: true,
            resetButtonHidden: true,
          ),
        ],
      );
      if (croppedFile != null) {
        onCreateLogo(File(croppedFile.path));
      }
    }
  }
}
