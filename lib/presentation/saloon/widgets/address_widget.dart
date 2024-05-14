import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/street.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/selection_city_saloon/selection_city_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';

/// [address] - текущий адрес
/// [citiesList] - лист доступных городов
/// [onAddress] - обратная функция (выбраный город, улица, дом)
/// [getStreetList], [getStreetList] - получение улиц и домов

class AddressWidget extends StatefulWidget {
  const AddressWidget(
      {super.key,
      required this.address,
      required this.citiesList,
      required this.onAddress,
      required this.getStreetList,
      required this.getHouseList});

  final Address? address;
  final List<City> citiesList;
  final void Function(City, Street, HouseNumber) onAddress;
  final Future<List<Street>> Function(String, String) getStreetList;
  final Future<List<HouseNumber>> Function(String, String, String) getHouseList;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  City? city;
  Street? street;
  HouseNumber? house;

  bool isEnabledEditAddress = false;

  TextEditingController textEditingConStreet = TextEditingController();
  TextEditingController textEditingConHouse = TextEditingController();

  @override
  void initState() {
    if (widget.address != null) {
      city = widget.address!.city;
      street = Street(title: widget.address!.street);
      house = HouseNumber(
        houseNumber: widget.address!.houseNumber,
        lat: widget.address!.lat,
        lon: widget.address!.lon,
      );
    }
    super.initState();
  }

  //Сохранение адреса
  void onSaveAddress() {
    widget.onAddress(city!, street!, house!);
    setState(() {
      isEnabledEditAddress = false;
    });
  }

  //Нажатие редактирвание адреса
  void onPressedEditAddress() {
    setState(() {
      isEnabledEditAddress = true;
    });
  }

  //Выбор города
  void onTapSelectedCity() async {
    final City? selCity = await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => SelectionCitySaloonBottomsheet(
        currentCity: city,
        citiesList: widget.citiesList,
      ),
    );
    if (selCity != null) {
      setState(() {
        city = selCity;
        street = null;
        house = null;
        textEditingConStreet.text = '';
        textEditingConHouse.text = '';
      });
    }
  }

  //Выбор улицы
  void onTapSelectedStreet(Street selStreet) {
    setState(() {
      street = selStreet;
      house = null;
      textEditingConHouse.text = '';
    });
  }

  //Выбор дома
  void onTapSelectedHouse(HouseNumber selHouse) {
    setState(() {
      house = selHouse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isEnabledEditAddress ? _body() : _address();
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _city(),
        city != null ? _streetWidget() : Container(),
        street != null ? _houseWidget() : Container(),
        house != null
            ? ButtonApp.large(
                title: 'Сохранить',
                onPressed: onSaveAddress,
              )
            : Container(),
      ],
    );
  }

  Widget _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Адрес', style: AppTextStyles.s14w400h696969),
        TextFormField(
          readOnly: true,
          controller: TextEditingController(text: widget.address?.toString()),
          decoration: InputDecoration(
            hintText: 'Введите адрес',
            suffixIcon: !isEnabledEditAddress
                ? ButtonIconApp.edit(onPressed: onPressedEditAddress)
                : null,
          ),
        ),
      ],
    );
  }

  Widget _city() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text('Город', style: AppTextStyles.s14w400h696969),
        TextFormField(
          readOnly: true,
          controller: TextEditingController(text: city?.title),
          onTap: onTapSelectedCity,
          decoration: InputDecoration(
            hintText: 'Выберите город',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.expand_more_outlined,
                color: AppColors.hex385EO,
              ),
              onPressed: onTapSelectedCity,
            ),
          ),
        ),
      ],
    );
  }

  Widget _streetWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text('Улица', style: AppTextStyles.s14w400h696969),
        RawAutocomplete<Street>(
          initialValue: TextEditingValue(text: street?.title ?? ''),
          displayStringForOption: (Street street) => street.title,
          optionsBuilder: (TextEditingValue textEditingValue) async {
            return await widget.getStreetList(
                city!.title, textEditingValue.text);
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            textEditingConStreet = textEditingController;
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(hintText: 'Введите улицу'),
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<Street> onSelected,
              Iterable<Street> streetList) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                color: AppColors.hexFFFFFF,
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: streetList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Street selStreet = streetList.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(selStreet);
                          onTapSelectedStreet(selStreet);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Text(
                            selStreet.title,
                            style: AppTextStyles.s16w400h262626,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _houseWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text('Дом', style: AppTextStyles.s14w400h696969),
        RawAutocomplete<HouseNumber>(
          initialValue: TextEditingValue(text: house?.houseNumber ?? ''),
          displayStringForOption: (HouseNumber houseNumber) =>
              houseNumber.houseNumber,
          optionsBuilder: (TextEditingValue textEditingValue) async {
            return await widget.getHouseList(
              city!.title,
              '${street?.title}',
              textEditingValue.text,
            );
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            textEditingConHouse = textEditingController;
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(hintText: 'Введите номер дома'),
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<HouseNumber> onSelected,
              Iterable<HouseNumber> houseNumberList) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                color: AppColors.hexFFFFFF,
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: houseNumberList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final HouseNumber selHouse =
                          houseNumberList.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(selHouse);
                          onTapSelectedHouse(selHouse);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Text(
                            selHouse.houseNumber,
                            style: AppTextStyles.s14w400h262626,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
