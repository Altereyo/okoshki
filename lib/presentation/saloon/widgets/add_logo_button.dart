import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

//pathAvatar -> Принимает путь к лого
//ValueChanged<File?> onFile - > кроп лого, если null то удалить

class AddLogoButton extends StatefulWidget {
  const AddLogoButton.circle({
    super.key,
    this.logo,
    required this.onPatchLogo,
  }) : isCircle = true;
  const AddLogoButton.square({
    super.key,
    this.logo,
    required this.onPatchLogo,
  }) : isCircle = false;
  final String? logo; // Лого с сервера
  final ValueChanged<String?> onPatchLogo; // Изменение лого
  final bool isCircle;

  @override
  State<AddLogoButton> createState() => _AddLogoButtonState();
}

class _AddLogoButtonState extends State<AddLogoButton> {
  File? logo;
  CroppedFile? croppedLogo;
  @override
  void initState() {
    if (widget.logo != null) {
      logo = File(widget.logo!);
    }
    super.initState();
  }

  void onTapDeletLogo() {
    setState(() {
      croppedLogo = null;
      logo = null;
      widget.onPatchLogo(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleBlocPageProfileInfo(
          title: 'Логотип (необязательно)',
          subTitle: 'png, jpg, svg до 2 Мб',
        ),
        _body(),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _body() {
    if (croppedLogo != null) {
      return _logoCroped();
    } else if (logo != null) {
      return _logoNetwork();
    } else {
      return _logoButton();
    }
  }

  Widget _logoButton() {
    return InkWell(
      onTap: _croppedLogo,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.isCircle
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.hex696969,
                )
              : Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.hex696969,
                  ),
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
          borderRadius: BorderRadius.circular(widget.isCircle ? 50 : 12),
          child: ImageNetworkIndicator(
            src: widget.logo!,
            height: 100,
            width: 100,
          ),
        ),
        InkWell(
          onTap: onTapDeletLogo,
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

  Widget _logoCroped() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.isCircle ? 50 : 12),
          child: Image.file(
            File(croppedLogo!.path),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: onTapDeletLogo,
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
        cropStyle: widget.isCircle ? CropStyle.circle : CropStyle.rectangle,
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
        setState(() {
          croppedLogo = croppedFile;
          logo = null;
        });

        widget.onPatchLogo(croppedFile.path);
      }
    }
  }
}
