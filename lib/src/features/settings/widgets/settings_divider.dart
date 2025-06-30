import 'package:flutter/widgets.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.only(left: 60),
      color: const Color(0xff373737).withValues(alpha: 0.5),
    );
  }
}
