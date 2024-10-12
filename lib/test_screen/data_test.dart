import 'package:flutter/material.dart';
import 'package:ngo_app/document_upload/document_scan.dart';
import 'package:ngo_app/firebase_api/firebase_apis.dart';
import 'package:ngo_app/model/district_model.dart';
import 'package:ngo_app/services/Bangladesh.dart';

class DataTestScreen extends StatefulWidget {
  const DataTestScreen({super.key});

  @override
  State<DataTestScreen> createState() => _DataTestScreenState();
}

class _DataTestScreenState extends State<DataTestScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  List<DistrictData> _districtList = [];
  String _selectedDistrict = '';
  final GlobalKey<FormState> _signUpFormKey = GlobalKey();
/// function of storing Data
  Future<void> _testDataSave() async {
    await FirebaseApi.saveData(
      userName: userName.text,
      phoneNumber: password.text,
      district: _selectedDistrict,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDistrict();
  }
/// function of get District Name
  Future<void> getDistrict() async {
    try {
      var response = await BangladeshAPIService.getDistricitList();
      var district = districtFromJson(response.body);
      if (response.statusCode == 200) {
        setState(() {
          _districtList = district.data;

        });

      }
    } catch (e) {}
  }
 /// Email regular expression check
  String? validateUserName(String? value) {
    final RegExp nameValidationRegex = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");

    if (value == null || value.isEmpty) {
      return 'User Name is required';
    } else if (!nameValidationRegex.hasMatch(value)) {
      return 'Enter a valid User Name';
    }

    return null; // Return null if the input is valid
  }

  String? validatePhoneNumber(String? value) {
    final RegExp nameValidationRegex = RegExp(r"^(?:\+88|88)?(01[3-9]\d{8})$");

    if (value == null || value.isEmpty) {
      return 'User Name is required';
    } else if (!nameValidationRegex.hasMatch(value)) {
      return 'Enter a valid User Name';
    }

    return null; // Return null if the input is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Enter Data on Firebase'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: validateUserName,
                        decoration: InputDecoration(
                            labelText: 'User Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: userName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: validatePhoneNumber,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: password,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _divisionDropDown(),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _testDataSave();
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.deepOrange,
                              Colors.yellowAccent
                            ]),
                          ),
                          child: const Center(child: Text('Test')),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DocumentScan()));
                        },
                        child: const Text('Scan Document'),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _divisionDropDown() {
    return DropdownButtonFormField(
      items: _districtList.map((DistrictData district) {
        return DropdownMenuItem(
            value: district.district, child: Text(district.district));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedDistrict = newValue!;
        });
      },
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border:  OutlineInputBorder(),
        labelText: 'District ',
      ),
    );
  }
}
