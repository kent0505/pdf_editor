import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/switch_button.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../bloc/settings_bloc.dart';
import 'settings_divider.dart';

class SettingsAccount extends StatelessWidget {
  const SettingsAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _Tile(
            color: const Color(0xffFFCC00),
            asset: Assets.settings1,
            title: 'License',
            isPremium: true,
          ),
          const SettingsDivider(),
          _Tile(
            color: const Color(0xff30D158),
            asset: Assets.settings2,
            title: 'Face ID lock',
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.color,
    required this.asset,
    required this.title,
    this.isPremium = false,
  });

  final Color color;
  final String asset;
  final String title;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: SvgWidget(asset),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: AppFonts.w400,
              ),
            ),
          ),
          isPremium
              ? BlocBuilder<VipBloc, Vip>(
                  builder: (context, state) {
                    return Text(
                      state.isVip ? 'Premium' : 'Free',
                      style: const TextStyle(
                        color: Color(0xffE12426),
                        fontSize: 14,
                        fontFamily: AppFonts.w400,
                      ),
                    );
                  },
                )
              : BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return SwitchButton(
                      isActive: state.faceID,
                      onPressed: () {
                        context
                            .read<SettingsBloc>()
                            .add(SaveFaceID(value: state.faceID));
                      },
                    );
                  },
                ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
