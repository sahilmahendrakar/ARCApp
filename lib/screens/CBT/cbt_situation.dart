import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import '../../size_config.dart';
import 'cbt_thoughts.dart';

class CBTSituation extends StatelessWidget {
  final Map<String,double> emotionData;
  CBTSituation(this.emotionData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SituationBody(emotionData),
    );
  }
}

class SituationBody extends StatefulWidget {
  final Map<String,double> emotionData;
  SituationBody(this.emotionData, {Key? key}) : super(key: key);

  @override
  _SituationBody createState() => _SituationBody(emotionData);
}

class _SituationBody extends State<SituationBody> {
  final Map<String,double> emotionData;
  final formKey = GlobalKey<FormState>();

  _SituationBody(this.emotionData);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Stack(children: [
          Container(
            alignment: Alignment(0, -0.5),
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(16), horizontal: getProportionateScreenWidth(16)),
            child: ListView(children: [
              new Container(
                child: Text(
                    'What event, daydream, or recollection led to the unpleasant emotion?',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w600,
                        color: darkestBlue)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              new Container(
                child: Column(children: [
                  //Text('Thought', style: TextStyle(fontSize: getProportionateScreenWidth(16),color: primary,fontWeight: FontWeight.w600,)),
                  TextFormField(
                    decoration: InputDecoration(
                        // labelText: 'Thought 1',
                        labelStyle: TextStyle(
                            color: secondary, fontWeight: FontWeight.w600),
                        hintText: 'Enter here...',
                        hintStyle: TextStyle(color: tertiary)),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter an event/daydream, etc.';
                      return null;
                    },
                    enableInteractiveSelection: true,
                    maxLines: null,
                    onEditingComplete: () {
                      setState(() {});
                    },
                    cursorColor: secondary,
                    style: TextStyle(color: primary),
                  ),
                ]),
              ),
            ]),
          ),
          navigationArrows()
        ]),
      ),
    );
  }

  Widget navigationArrows() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Column(children: [
        Spacer(),
        Row(children: [
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: tertiary),
          Spacer(),
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (formKey.currentState!.validate())
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CBTThoughts(emotionData)));
              },
              color: tertiary)
        ])
      ]),
    );
  }
}
