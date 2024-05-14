import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/intro_slide.dart';

part 'intro_slide.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IntroSlideModel extends IntroSlide {
  
  const IntroSlideModel({
    required super.id,
    required super.title,
    required super.text,
    required super.slide,
    required super.order,
  }) ;

  factory IntroSlideModel.fromJson(Map<String, dynamic> json) =>
      _$IntroSlideModelFromJson(json);
}
