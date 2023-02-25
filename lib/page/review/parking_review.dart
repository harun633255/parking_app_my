// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/styles.dart';
import '../../utils/colors_code.dart';
import '../mobile_sign_in_page.dart';
import 'add_parking_review.dart';

class ParkingReview extends StatefulWidget {
  String id;

  ParkingReview(this.id, {Key? key}) : super(key: key);


  @override
  State<ParkingReview> createState() => _ParkingReviewState();
}

class _ParkingReviewState extends State<ParkingReview> {

  String dataid="";
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    dataid=widget.id;
    setState(() {});
  }

  final currentUser = FirebaseAuth.instance;

  final databaseRef = FirebaseDatabase.instance.ref("ParkingReview");

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
                  builder: (context) => AddParkingReview(widget.id)));
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
                    List<dynamic> list = [];

                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }else{

                        Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
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

                    }



                  })
            ],
          ),
        ),
      ), // Column
    );
  }
}
