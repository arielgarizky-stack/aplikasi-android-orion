import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWeb extends StatelessWidget {
  final String assetPath;

  const PdfViewerWeb({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    // ganti 'assets/pdf/Layout.pdf' ke path web
    final webPath = '/${assetPath}';

    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer (Web)")),
      body: SfPdfViewer.network(webPath),
    );
  }
}
