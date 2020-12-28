import 'package:delivery_master/app/animation/transitionAppBar.dart';
import 'package:delivery_master/service/company/companyList.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TransitionAppBar(
            extent: 300,
            avatar: Lottie.asset('assets/del.json', width: 300, height: 300),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Row(
                children: <Widget>[
//                  Container(
//                    padding: EdgeInsets.all(10.0),
//                    child: DropdownButtonHideUnderline(
//                      child: DropdownButton<String>(
//                        items: ,
//                      ),
//                    )
//                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.black,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: "운송장 번호를 적어주세요!",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => print("search"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: new SliverChildListDelegate(_buildList(30)),
          )
        ],
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(
        new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text(
            'Item ${i.toString()}',
            style: new TextStyle(fontSize: 25.0),
          ),
        ),
      );
    }

    return listItems;
  }
}
