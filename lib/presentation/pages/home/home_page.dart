import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/pages/app/app_page.dart';
import 'package:relax_app/presentation/pages/main/main_page.dart';
import 'package:relax_app/presentation/pages/onboarding/onboarding_page.dart';
import 'package:relax_app/presentation/pages/profile/profile_page.dart';
import 'package:relax_app/presentation/pages/sound/sound_page.dart';
import 'package:relax_app/presentation/resource/app_image_asset.dart';
import 'package:relax_app/presentation/resource/app_vector_asset.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;

  final List<Widget> _tabs = const [
    MainPage(),
    SoundPage(),
    ProfilePage(),
  ];

  void _goToOnboardingPage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const OnboardingPage(),
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF253334),
      appBar: _appBar(),
      body: _tabs[_currentTab],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF253334),
      leading: const Icon(Icons.menu),
      centerTitle: true,
      title: SvgPicture.asset(
        AppVectorAsset.logo,
        height: 30,
        width: 30,
      ),
      actions: _currentTab != 2 ? _mainAction() : _profileActions(),
    );
  }

  List<Widget> _mainAction() {
    return const [
      Padding(
        padding: EdgeInsets.only(right: 8),
        child: CircleAvatar(
          backgroundImage: AssetImage(AppImageAsset.avatarHolder),
        ),
      ),
    ];
  }

  List<Widget> _profileActions() {
    return [
      TextButton(
        onPressed: () {
          locator<IAuthClient>().signOut();
          _goToOnboardingPage();
        },
        child: const Text(
          'Exit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      IconButton(
        onPressed: _developDialog,
        icon: const Icon(Icons.info),
      ),
    ];
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (int index) => setState(() => _currentTab = index),
      currentIndex: _currentTab,
      selectedItemColor: Colors.white,
      backgroundColor: const Color(0xFF253334),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.man),
        ),
      ],
    );
  }

  void _developDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SimpleDialog(
          title: Text('About the developer'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Group number: 951008'),
            ),
            SimpleDialogOption(
              child: Text('Student\'s last name: Mihalkov'),
            ),
            SimpleDialogOption(
              child: Text('Laboratory work number: 3'),
            ),
          ],
        );
      },
    );
  }
}
