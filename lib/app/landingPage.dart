import 'package:delivery_master/app/pages/homePage.dart';
import 'package:delivery_master/app/pages/loadingPage.dart';
import 'package:delivery_master/service/company/companyList.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  CompanyList companyList = CompanyList();

  _buildLoading() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/loading.json', width: 300, height: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:companyList.getCompanyList(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return LoadingPage();
        } else {
          return HomePage(cList: companyList,);
        }

      },
    );
  }
}
