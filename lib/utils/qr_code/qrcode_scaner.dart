import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:suja_shoie_app/pages/home_page/main_screen.dart';
import 'package:suja_shoie_app/pages/login_page.dart';

import 'package:suja_shoie_app/utils/qr_code/qrcode_overley.dart';

import '../font_styles.dart';
import '../theme_styles.dart';

class QrScanner extends StatefulWidget {
  QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isScanCompleted = false;

  void handleBarcodeDetection(String barcodes) {
    if (!isScanCompleted) {
      setState(() {
        isScanCompleted = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Headings(heading: 'Place the camera on QR code'),
            Headings(
              text: 'for scanning',
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) => handleBarcodeDetection(code!),
                  ),
                  const QRScannerOverlay(overlayColour: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding * 3),
            const Expanded(
              child: Column(
                children: [
                  SizedBox(height: defaultPadding * 2),
                  Headings(
                    subHeading: 'Functionality comes here',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
