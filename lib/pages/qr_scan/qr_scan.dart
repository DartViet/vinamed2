import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ltdmed/appbar/appbar.dart';
import 'package:ltdmed/goodies/citizen_info_service.dart';
import 'package:ltdmed/l10n/language_service.dart';
import 'package:ltdmed/models/user/user_profile_model.dart';
import 'package:ltdmed/named_routes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Implementation of Mobile Scanner example with simple configuration
class MobileScannerSimple extends StatefulWidget {
  /// Constructor for simple Mobile Scanner example
  const MobileScannerSimple({super.key});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  Barcode? _barcode;

  Widget _barcodePreview(Barcode? value) {
    if (value == null || value.displayValue == null) {
      return Text(LanguageService.instance.qrscanScanning, overflow: TextOverflow.fade, style: TextStyle(color: Colors.white));
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      CitizenCardInfo.fromBarcodeString(value.displayValue!);
      UserProfileModel.clear();
      Navigator.pushNamed(context, NamedRoutes.userInfo);
    });

    return Text(value.displayValue ?? 'No display value.', overflow: TextOverflow.fade, style: const TextStyle(color: Colors.white));
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppbar(),
      backgroundColor: Colors.black,
      body: ListenableBuilder(
        listenable: LanguageService.instance,
        builder: (context, widget) {
          return Stack(
            children: [
              MobileScanner(onDetect: _handleBarcode),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Expanded(child: Center(child: _barcodePreview(_barcode)))]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
