import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PreliminaryReportPdf {
  static PdfPage? _page;
  static PdfDocument doc = PdfDocument();

  PreliminaryReportPdf() {
    doc = _buildBlankPdf();
  }

  PdfDocument get document => doc;

  set document(PdfDocument document) => doc = document;

  static PdfDocument _buildBlankPdf() {
    doc.pageSettings.size = const Size(612, 792);
    doc.pageSettings.margins.all = 0;
    _createHeader();
    return doc;
  }

  /// Creates the header for a FEMA preliminary report
  static void _createHeader() {
    if (_page == null) {
      doc.pages.add();
      _page = doc.pages[0];
    }
    var i = 0;
    while (i < 80) {
      drawTextBoxField(doc, _page!, 'h_initial_reserves', '', 27, 92, 90);
      i++;
    }
    print("Drew a header");
  }

  /// Draws a TextBoxField
  static void drawTextBoxField(
    PdfDocument document,
    PdfPage page,
    String name,
    String text,
    double x,
    double y,
    double width, [
    bool hasUnderline = true,
    PdfTextAlignment alignment = PdfTextAlignment.center,
    PdfBorderStyle borderStyle = PdfBorderStyle.underline,
  ]) {
    PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 9);
    Size textSize = font.measureString(text,
        format: PdfStringFormat(measureTrailingSpaces: true));
    page.graphics.drawString(
      text,
      font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(x, y, 300, 50),
    );
    document.form.fields.add(
      PdfTextBoxField(
        page,
        name,
        // text: "Test",
        Rect.fromLTWH(
            x + textSize.width + 3, y, width - textSize.width, 12 + 3),
        font: font,
        borderStyle: borderStyle,
        borderWidth: hasUnderline ? 1 : 0,
        alignment: alignment,
        borderColor: PdfColor(210, 210, 210),
      ),
    );
  }
}
