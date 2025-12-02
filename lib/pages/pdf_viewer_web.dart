import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWeb extends StatelessWidget {
  final String url;
  const PdfViewerWeb({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Viewer Web")),
      body: SfPdfViewer.network(url),
    );
  }
}
