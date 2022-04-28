import 'package:flutter/material.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/resource/app_image_asset.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImageAsset.avatarHolder),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            locator<IAuthClient>().currentUser.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
