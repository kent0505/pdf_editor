import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../screens/camera_screen.dart';
import '../screens/scanned_screen.dart';
import 'action_card.dart';
import 'section_wrap.dart';

class ScanSection extends StatelessWidget {
  const ScanSection({super.key});

  @override
  Widget build(BuildContext context) {
    void onScan(int id) async {
      await Permission.camera.request();
      if (context.mounted) {
        context.push(CameraScreen.routePath);
      }
    }

    return SectionWrap(
      children: [
        ActionCard(
          title: 'Scan to PDF',
          asset: Assets.action3,
          onPressed: () async {
            await Permission.camera.request();
            try {
              await CunningDocumentScanner.getPictures().then((value) {
                if (value != null && value.isNotEmpty && context.mounted) {
                  context.push(
                    ScannedScreen.routePath,
                    extra: value,
                  );
                }
              });
            } catch (e) {
              logger(e);
            }
          },
        ),
        ActionCard(
          title: 'Scan Book',
          asset: Assets.action4,
          onPressed: () {
            onScan(0);
          },
        ),
        ActionCard(
          title: 'Scan ID card',
          asset: Assets.action5,
          onPressed: () {
            onScan(1);
          },
        ),
        ActionCard(
          title: 'Scan to PDF',
          asset: Assets.action6,
          onPressed: () {
            onScan(2);
          },
        ),
        ActionCard(
          title: 'Scan Book',
          asset: Assets.action7,
          onPressed: () {
            onScan(3);
          },
        ),
        ActionCard(
          title: 'Scan ID card',
          asset: Assets.action8,
          onPressed: () {
            onScan(4);
          },
        ),
      ],
    );
  }
}
