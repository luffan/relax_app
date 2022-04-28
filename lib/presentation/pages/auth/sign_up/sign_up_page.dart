import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/pages/home/home_page.dart';
import 'package:relax_app/presentation/resource/app_vector_asset.dart';
import 'package:relax_app/presentation/widgets/app_button.dart';
import 'package:relax_app/presentation/widgets/app_text_field.dart';

import 'sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpCubit _cubit = locator<SignUpCubit>();

  void _goToHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
      (_) => false,
    );
  }

  void _register() async {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      currentState.save();
      await _cubit.signUp();
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
                ..._buttonSection(),
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
        'Sign up',
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
        hintText: 'Name',
        onSaved: _cubit.updateName,
      ),
      const SizedBox(height: 40),
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

  List<Widget> _buttonSection() {
    return [
      AppButton(
        text: 'Register',
        margin: 0,
        onTap: _register,
      ),
    ];
  }
}
