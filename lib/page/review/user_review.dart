// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';
import '../../customs/custom_label_for_text_field.dart';
import '../../customs/custom_text_field.dart';
import '../../utils/colors_code.dart';
import '../mobile_sign_in_page.dart';
import 'add_user_review.dart';

class UserReview extends StatefulWidget {
  UserReview(this.id, {Key? key}) : super(key: key);
  var id;

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {

  List<dynamic> list = [];
  final currentUser = FirebaseAuth.instance;

  final databaseRef = FirebaseDatabase.instance.ref("UserParkingReview");




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.page_background_color,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsCode.primary_color,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddUserReview(widget.id)));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MobileSignInView()),
                        (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 0, top: 10, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(
                  stream: databaseRef.child(widget.id).onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }

                    else if(list.isNotEmpty){
                      Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.snapshot.children.length,
                          itemBuilder: (context, index) {

                            return ListTile(
                              title: Text(list[index]["parkingReview"]),
                            );

                          });
                    }else{
                      return Text("");
                    }
                  })
            ],
          ),
        ),
      ), // Column
    );
  }
}
