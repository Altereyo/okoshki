import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/internal/ui/app_assets.dart';

extension SocialNetworkExternal on SocialNetwork {
  
  SocialNetwork copyWith({
    String? url,
    bool? isActive,
  }) =>
      SocialNetwork(
        id: id,
        salon: salon,
        url: url ?? this.url,
        title: title,
        isActive: isActive ?? this.isActive,
      );

  String get icon => switch (title) {
        'Instagram' => AppAssets.iconInstagram,
        'Vk' => AppAssets.iconVk,
        'Facebook' => AppAssets.iconFacebook,
        'Youtube' => AppAssets.iconYoutube,
        'Tiktok' => AppAssets.iconTiktok,
        _ => "null"
      };
  String get prefix=> '${url.split('https://').last.split('/').first}/';
  
  String get sufix => url.split('.com/').last;
}
