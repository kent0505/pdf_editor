import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../widgets/settings_account.dart';
import '../widgets/settings_divider.dart';
import '../widgets/settings_other_apps.dart';
import '../widgets/settings_tile.dart';
import 'faq_screen.dart';
import 'search_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onApp1() {
      launchURL('https://google.com');
    }

    void onApp2() {
      launchURL('https://pub.dev');
    }

    void onReport() {
      launchURL('https://rezka.ag');
    }

    void onSearch() {
      context.push(SearchScreen.routePath);
    }

    void onFaq() {
      context.push(FaqScreen.routePath);
    }

    void onContact() {
      launchURL('https://google.com');
    }

    void onReview() {}

    void onShare() {}

    void onPrivacy() {
      launchURL('https://google.com');
    }

    void onTerms() {
      launchURL('https://pub.dev');
    }

    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        SettingsOtherApps(
          onPressed1: onApp1,
          onPressed2: onApp2,
        ),
        const _Title(title: 'ACCOUNT'),
        const SettingsAccount(),
        const _Title(title: 'REPORT BUGS'),
        SettingsTile(
          title: 'Report Bug',
          asset: Assets.settings3,
          color: const Color(0xffFFCC00),
          onPressed: onReport,
        ),
        const SizedBox(height: 14),
        Text(
          'Help us improve the app by reporting any bugs or issues you encounter. Your feedback is invaluable in making the app better for everyone. Share your findings with us and contribute to enhancing performance and stability.',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.5),
            fontSize: 10,
            fontFamily: AppFonts.w400,
          ),
        ),
        const _Title(title: 'GENERAL'),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SettingsTile(
                title: 'Search',
                asset: Assets.settings5,
                onPressed: onSearch,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'FAQ',
                asset: Assets.settings6,
                onPressed: onFaq,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'Contact Support',
                asset: Assets.settings7,
                onPressed: onContact,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'Review us',
                asset: Assets.settings8,
                onPressed: onReview,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'Share our app',
                asset: Assets.settings9,
                onPressed: onShare,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'Privacy Policy',
                asset: Assets.settings10,
                onPressed: onPrivacy,
              ),
              const SettingsDivider(),
              SettingsTile(
                title: 'Terms of Usage',
                asset: Assets.settings10,
                onPressed: onTerms,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 6,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black.withValues(alpha: 0.5),
          fontSize: 12,
          fontFamily: AppFonts.w400,
        ),
      ),
    );
  }
}
