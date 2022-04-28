import 'package:flutter/material.dart';
import 'package:relax_app/presentation/pages/auth/sign_in/sign_in_page.dart';
import 'package:relax_app/presentation/resource/app_image_asset.dart';
import 'package:relax_app/presentation/widgets/app_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  void _goToSignInPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImageAsset.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          _mainContent(context),
        ],
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 90),
        Image.asset(
          AppImageAsset.logo,
          width: 192,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 32),
        ..._partingWords(),
        const SizedBox(height: 94),
        AppButton(
          text: 'Log in to your account',
          onTap: () => _goToSignInPage(context),
        ),
        const SizedBox(height: 16),
        _bottomLabel(),
      ],
    );
  }

  List<Widget> _partingWords() {
    return [
      const Text(
        'Hello',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
      const Text(
        'Enjoy the qualifiers.\nBe careful.\nDo it well.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _bottomLabel() {
    return RichText(
      text: const TextSpan(
        text: 'Don\'t have an account yet?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
