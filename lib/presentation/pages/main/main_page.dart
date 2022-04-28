import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relax_app/data/model/zodiac_sign.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/model/wellbeing.dart';

import 'main_cubit.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainCubit _cubit = locator<MainCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: _cubit,
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: _mainContent(state),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _mainContent(MainState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ..._alarmMessage(_cubit.name),
          const SizedBox(height: 28),
          SizedBox(
            height: 100,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Wellbeing.values.length,
              itemBuilder: (_, index) => _wellbeing(
                Wellbeing.values[index],
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 24),
            ),
          ),
          const SizedBox(height: 42),
          SizedBox(
            height: double.maxFinite,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.signs.length,
              itemBuilder: (_, index) => _zodiacSignCard(
                state.signs[index],
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _alarmMessage(String name) {
    return [
      Text(
        'Welcome back,$name!',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 30,
        ),
      ),
      const SizedBox(height: 2),
      Text(
        'How do you feel today?',
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    ];
  }

  Widget _wellbeing(Wellbeing wellbeing) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(wellbeing.helpMessage),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.9),
            ),
            child: SvgPicture.asset(wellbeing.icon),
          ),
          const SizedBox(height: 4),
          Text(
            wellbeing.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _zodiacSignCard(ZodiacSign sign) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF7F3F0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sign.sign,
            style: const TextStyle(
                color: Color(0xFF253334),
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
          Text(
            sign.horoscope,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF253334),
            ),
            child: const Text(
              'More',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
