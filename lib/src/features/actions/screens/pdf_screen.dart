import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../core/widgets/appbar.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  static const routePath = '/PdfScreen';

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  void load() async {
    final document = PdfDocument();

    document.dispose();
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'PDF'),
      body: ListView(
        children: [],
      ),
    );
  }
}
