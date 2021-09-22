import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CBTHistory extends StatelessWidget {
  final ref = FirebaseDatabase.instance.reference();
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var cbtData = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('History',
            style: TextStyle(fontSize: getProportionateScreenWidth(20))),
        backgroundColor: darkestBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ref.child(user.uid).child("cbt-data:").once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              cbtData.clear();
              Map<dynamic, dynamic> values = snapshot.data!.value;
              values.forEach((key, values) {
                cbtData.add(values);
              });
              return new ListView.builder(
                  itemCount: cbtData.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = cbtData.length - 1 - index;
                    return entry(cbtData[i]['time'], cbtData[i]['thoughts'],
                        cbtData[i]['responses'], cbtData[i]['distortions']);
                  });
            }
            return Container(
                alignment: Alignment(0, 0),
                child: CircularProgressIndicator(color: pureWhite));
          }),
      backgroundColor: darkestBlue,
    );
  }

  Widget entry(String date, List<Object?> thoughts, List<Object?> responses,
      List<Object?> distortions) {
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8, 10);
    String time = date.substring(10, 16);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(4)),
      child: Card(
          color: pureWhite,
          child: Column(children: [
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(month + '/' + day + '/' + year + time,
                style: TextStyle(
                    color: primary,
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: getProportionateScreenHeight(4)),
            generateThoughts(thoughts, responses),
            generateDistortions(distortions),
            SizedBox(height: getProportionateScreenHeight(8))
          ])),
    );
  }

  Widget generateThoughts(List<Object?> thoughts, List<Object?> responses) {
    List<Widget> temp = [];
    for (int i = 0; i < thoughts.length; i++) {
      temp.add(Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        alignment: Alignment(-1, 0),
        child: Text('THOUGHT ' + (i + 1).toString(),
            style: TextStyle(
                color: Colors.grey, fontSize: getProportionateScreenWidth(14))),
      ));
      temp.add(Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          alignment: Alignment(-1, 0),
          child: Text(thoughts[i].toString(),
              style: TextStyle(
                  color: darkestBlue,
                  fontSize: getProportionateScreenWidth(14)))));
      temp.add(SizedBox(height: getProportionateScreenHeight(4)));
      temp.add(Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        alignment: Alignment(-1, 0),
        child: Text('RESPONSE ' + (i + 1).toString(),
            style: TextStyle(
                color: Colors.grey, fontSize: getProportionateScreenWidth(14))),
      ));
      temp.add(Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          alignment: Alignment(-1, 0),
          child: Text(responses[i].toString(),
              style: TextStyle(
                  color: brightPink,
                  fontSize: getProportionateScreenWidth(14)))));
      temp.add(SizedBox(height: getProportionateScreenHeight(16)));
    }
    return Column(children: temp);
  }

  Widget generateDistortions(List<Object?> distortions) {
    List<Widget> temp = [];
    List<Widget> pairs = [];
    temp.add(
      Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        alignment: Alignment(-1, 0),
        child: Text('DISTORTION(S)',
            style: TextStyle(
                color: Colors.grey, fontSize: getProportionateScreenWidth(14))),
      ),
    );
    for (Object? d in distortions) {
      String name;
      Widget image;
      switch (d.toString()) {
        case "a":
          name = 'All-Or-Nothing';
          image = Image.asset('assets/images/allornoth.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "ca":
          name = 'Catastrophizer';
          image = Image.asset('assets/images/catastroph.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "m":
          name = 'Mind Reader';
          image = Image.asset('assets/images/mindreader.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "fo":
          name = 'Fortune Teller';
          image = Image.asset('assets/images/fortuneteller.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "fi":
          name = 'Filterer';
          image = Image.asset('assets/images/filterer.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "d":
          name = 'Downplayer';
          image = Image.asset('assets/images/downplayer.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "e":
          name = 'Emotional Reasoner';
          image = Image.asset('assets/images/emotionalreas.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "s":
          name = '\"Should\" Stickler';
          image = Image.asset('assets/images/should.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "l":
          name = 'Labeler';
          image = Image.asset('assets/images/labeler.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;
        case "p":
          name = 'Personalization';
          image = Image.asset('assets/images/personal.jpg',
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48));
          break;

        default:
          name = '';
          image = SizedBox();
      }
      pairs.add(Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          alignment: Alignment(-1, 0),
          child: Column(children: [
            image,
            SizedBox(height: getProportionateScreenHeight(2)),
            Text(name,
                style: TextStyle(
                    color: darkestBlue,
                    fontSize: getProportionateScreenWidth(14))),
          ])));
    }
    temp.add(Row(children: pairs));
    return Column(children: temp);
  }
}
