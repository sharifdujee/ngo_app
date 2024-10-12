/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({super.key});

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  String _scanBarCode = 'Unknown';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> startBarcodeScanStream() async{
    FlutterBarcodeScanner.getBarcodeStreamReceiver('#ff6666', 'Cancel', true, ScanMode.BARCODE)!.listen((barcode)=> print(barcode));
  }

  Future<void> scanQR() async{
    String barCodeScanRes;
    try{
      barCodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);
      print(barCodeScanRes);

    }
    on PlatformException{
      barCodeScanRes = 'Failed to get platform version';
    }
    if(!mounted) return;

    setState(() {
      _scanBarCode = barCodeScanRes;
    });

  }

  Future<void> scanBarCodeNormal() async{
    String barCodeScanRes;
    try{
      barCodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.BARCODE);
      print(barCodeScanRes);

    }
    on PlatformException{
      barCodeScanRes = 'Failed to get platform version';
    }
    if(!mounted) return;
    setState(() {
      _scanBarCode = barCodeScanRes;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Code Scanning'),
        centerTitle: true,
      ),
      body: Builder(builder: (BuildContext context){
        return Container(
          alignment: Alignment.center,
          child: Flex(direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                scanBarCodeNormal();
              }, child: const Text('Start Bar Code Scanner')),
              ElevatedButton(onPressed: (){
                scanQR();
              }, child: const Text('Start QR Code Scanner')),
              ElevatedButton(onPressed: (){
                startBarcodeScanStream();
              }, child: const Text('Start Bar Code Scanner')),
              Text('Scan Result $_scanBarCode\n', style: const TextStyle(fontSize: 20),)

            ],
          ),

        );
      }),
    );
  }
}

*/
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => scanBarcodeNormal(),
                            child: Text('Start barcode scan')),
                        ElevatedButton(
                            onPressed: () => scanQR(),
                            child: Text('Start QR scan')),
                        ElevatedButton(
                            onPressed: () => startBarcodeScanStream(),
                            child: Text('Start barcode scan stream')),
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}
 */
