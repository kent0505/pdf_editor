import 'dart:developer' as developer;

// import 'package:printing/printing.dart';

void logger(Object message) => developer.log(message.toString());

void printPDF() async {
  // await Printing.layoutPdf(
  //   onLayout: (PdfPageFormat format) async => doc.save(),
  // );
}
