import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

class AddSaloonPhoto extends StatelessWidget {
  const AddSaloonPhoto(
      {super.key,
      required this.saloonPhotosList,
      required this.onCreatePhoto,
      required this.onRemovePhoto});
  final List<SaloonPhoto> saloonPhotosList; //Лист фото с сервера
  final ValueChanged<File> onCreatePhoto; //Изменение фото
  final ValueChanged<SaloonPhoto> onRemovePhoto; //Удаление фото

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleBlocPageProfileInfo(
          title: 'Фото салона (необязательно)',
          subTitle: 'можно добавить не более 5',
        ),
        SingleChildScrollView(
          //controller: ScrollController(initialScrollOffset: 500),
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              Row(
                children: saloonPhotosList
                    .map((saloonPhoto) => _photoNetwork(saloonPhoto))
                    .toList(),
              ),
              saloonPhotosList.length == 5 ? Container() : _addPhoto(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _photoNetwork(SaloonPhoto saloonPhoto) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ImageNetworkIndicator(
              src: saloonPhoto.image,
              height: 100,
              width: 100,
            ),
          ),
          InkWell(
            onTap: () => onRemovePhoto(saloonPhoto),
            child: SvgPicture.asset(
              AppAssets.iconClose,
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addPhoto() {
    return InkWell(
      onTap: _croppedPhoto,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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

  Future<void> _croppedPhoto() async {
    //Фото из галереи
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      //Кроп фото под прямоугольник
      final croppedFile = await ImageCropper().cropImage(
        aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 3),
        sourcePath: pickedFile.path,
        cropStyle: CropStyle.rectangle,
        compressQuality: 20,
        uiSettings: [
          AndroidUiSettings(
            showCropGrid: false,
            hideBottomControls: true,
            initAspectRatio: CropAspectRatioPreset.ratio4x3,
          ),
          IOSUiSettings(
            cancelButtonTitle: 'Отмена',
            doneButtonTitle: 'Далее',
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );
      if (croppedFile != null) {
        onCreatePhoto(File(croppedFile.path));
      }
    }
  }
}
