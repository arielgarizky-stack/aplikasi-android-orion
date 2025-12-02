import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:orionschematic/pages/pdf_viewer_page.dart';
import 'package:orionschematic/pages/pdf_viewer_web.dart';





class PdfViewerRouter extends StatelessWidget {
  final String assetPath;

  const PdfViewerRouter({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      final webPath = "/assets/" + assetPath;  // ini FIX
      return PdfViewerWeb(url: webPath);
    }

    return PdfViewerPage(assetPath: assetPath);
  }
}
