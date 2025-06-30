import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../home/screens/home_screen.dart';
import '../../onboard/data/onboard_repository.dart';
import '../../onboard/screens/onboard_screen.dart';
import '../../settings/bloc/settings_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void check() {
    context.read<SettingsBloc>().add(CheckBiometric());
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state.granted) {
          Future.delayed(
            Duration(seconds: state.faceID ? 0 : 2),
            () {
              if (context.mounted) {
                if (context.read<OnboardRepository>().isOnboard()) {
                  context.go(OnboardScreen.routePath);
                } else {
                  context.go(HomeScreen.routePath);
                }
              }
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state.loading
              ? const LoadingWidget()
              : Center(
                  child: Button(
                    onPressed: check,
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: AppFonts.w600,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
