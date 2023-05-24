import 'package:atd_app/Screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQr extends StatefulWidget {
  @override
  State<ScanQr> createState() => _ScanQrState();
}

var val;
bool isScanned = true;

class _ScanQrState extends State<ScanQr> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR code scanner",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Place QR in the box to scan ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Scanning is automatically done'),
            ],
          )),
          Expanded(
            flex: 3,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.normal,
                facing: CameraFacing.back,
                detectionTimeoutMs: 1000,
              ),
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;

                for (final barcode in barcodes) {
                  try {
                    if (barcode.rawValue != null) {
                      val = barcode.rawValue.toString();
                      break;
                    } else {
                      throw (barcode);
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Error: $error',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
                print("the val is " + val!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          ResultScreen(userId: val.toString()))),
                );
              },
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Developed by Campus Compass",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          )),
        ]),
      ),
    );
  }
}
