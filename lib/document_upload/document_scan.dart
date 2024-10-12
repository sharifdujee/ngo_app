import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DocumentScan extends StatefulWidget {
  const DocumentScan({super.key});

  @override
  State<DocumentScan> createState() => _DocumentScanState();
}

class _DocumentScanState extends State<DocumentScan> {
  List<String> _pictures = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {}

  void onPressed() async {
    setState(() {
      _isLoading = true;
    });

    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (e) {
      // Handle error here
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Background color
      appBar: AppBar(
        title: const Text('Document Upload'),
        backgroundColor:
            Colors.blue.shade900, // Darker blue for a more professional look
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isLoading
                ? const SpinKitCircle(
              color: Colors.green,
              size: 50,
              duration: Duration(seconds: 60),

            )
                : _pictures.isEmpty
                    ? Center(
                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              size: 100,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'No documents uploaded yet',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 16),
                            ),
                          ],
                        ),
                    )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: _pictures.length,
                        itemBuilder: (context, index) {
                          return Card(
                            semanticContainer: true,
                            shadowColor: Colors.red,
                            color: Colors.green,
                            elevation: 6,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.file(
                              File(_pictures[index]),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
            const SizedBox(height: 20), // Space between the grid and button
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(
                Icons.upload_file,
                size: 24,
                color: Colors.white,
              ),
              label: const Text(
                'Upload Document',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue.shade900, // Matching button with app bar
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20), // Additional spacing below the button
          ],
        ),
      ),
    );
  }
}
