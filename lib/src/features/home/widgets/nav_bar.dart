import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/button.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavBarButton(
                  index: 1,
                  title: 'Actions',
                  asset: Assets.tab1,
                  active: state is HomeInitial,
                ),
                _NavBarButton(
                  index: 2,
                  title: 'Files',
                  asset: Assets.tab2,
                  active: state is HomeFiles,
                ),
                _NavBarButton(
                  index: 3,
                  title: 'Favourites',
                  asset: Assets.tab3,
                  active: state is HomeFavourites,
                ),
                _NavBarButton(
                  index: 4,
                  title: 'Settings',
                  asset: Assets.tab5,
                  active: state is HomeSettings,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.index,
    required this.asset,
    required this.title,
    required this.active,
  });

  final String title;
  final String asset;
  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Button(
          onPressed: active
              ? null
              : () {
                  context.read<HomeBloc>().add(ChangePage(index: index));
                },
          child: Column(
            children: [
              const SizedBox(height: 12),
              SvgWidget(
                asset,
                height: 20,
                color:
                    active ? const Color(0xffE12426) : const Color(0xff808080),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  color: active
                      ? const Color(0xffE12426)
                      : const Color(0xff808080),
                  fontSize: 10,
                  fontFamily: AppFonts.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
