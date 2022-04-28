import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:relax_app/presentation/pages/home/home_page.dart';
import 'package:relax_app/presentation/resource/app_vector_asset.dart';
import 'package:relax_app/presentation/widgets/app_button.dart';
import 'package:relax_app/presentation/widgets/app_text_field.dart';

import 'sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInCubit _cubit = locator<SignInCubit>();

  void _goToSignUpPage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      ),
      (_) => false,
    );
  }

  void _goToHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  void _signIn() async {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      currentState.save();
      await _cubit.signIn();
      _goToHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF253334),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                ..._labelSection(),
                const SizedBox(height: 112),
                ..._formFieldsSection(),
                const SizedBox(height: 56),
                ..._buttonSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _labelSection() {
    return [
      SvgPicture.asset(
        AppVectorAsset.logo,
        width: 42,
        height: 48,
      ),
      const SizedBox(height: 32),
      const Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 30,
        ),
      ),
    ];
  }

  List<Widget> _formFieldsSection() {
    return [
      AppTextField(
        hintText: 'Email',
        onSaved: _cubit.updateEmail,
      ),
      const SizedBox(height: 40),
      AppTextField(
        hintText: 'Password',
        obscureText: true,
        onSaved: _cubit.updatePassword,
      ),
    ];
  }

  List<Widget> _buttonSection(BuildContext context) {
    return [
      AppButton(
        text: 'Sign in',
        margin: 0,
        onTap: _signIn,
      ),
      const SizedBox(height: 24),
      const Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      const SizedBox(height: 24),
      AppButton(
        text: 'Profile',
        margin: 0,
        onTap: _goToSignUpPage,
      ),
    ];
  }
}
