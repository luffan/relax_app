import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/pages/home/home_page.dart';
import 'package:relax_app/presentation/pages/onboarding/onboarding_page.dart';

import 'app_cubit.dart';
import 'app_state.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final AppCubit _cubit = locator<AppCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: _cubit,
      builder: (context, state) => MaterialApp(
        home: state.hasUser ? const HomePage() : const OnboardingPage(),
      ),
    );
  }
}
