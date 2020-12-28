import 'dart:convert';

import 'package:delivery_master/service/apiPath.dart';

import 'package:http/http.dart' as http;

class CompanyList {
  Map<String, Map<String, String>> cList = new Map();

  // Constructor
  CompanyList() {
    getCompanyList();
  }

  Future<void> getCompanyList() async {
    var response = await http.get(APIPath.carrier(), headers: {
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data.forEach((d) => cList[d['name']] = {'id': d['id'], 'tel': d['tel']});
    } else {
      print("Company List API Error");
    }
  }

}