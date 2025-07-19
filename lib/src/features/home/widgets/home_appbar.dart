import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_editor/src/core/widgets/appbar.dart';
import 'package:pdf_editor/src/features/files/logic/pdf_view_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/constants.dart';
import '../bloc/home_bloc.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ScaffoldSliverAppBar(
          actions: switch (state) {
            HomeFiles() => [
                IconButton(
                    onPressed: () {
                      PDFFileManager.savePDFToAppDirectory();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.red,
                    ))
              ],
            _ => null
          },
          title: switch (state) {
            HomeInitial() => 'PDF',
            HomeFiles() => 'Files',
            HomeFavourites() => 'Favourites',
            HomeSettings() => 'Settings',
          },
        );
      },
    );
  }
}
