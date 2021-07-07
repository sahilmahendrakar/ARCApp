import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
//import 'CBTOutcome.dart';
import 'package:arc_app/constants.dart';
import 'cbt_thoughts.dart';

class CBTResponse extends StatelessWidget {
  final List<Thought> thoughts;
  CBTResponse(this.thoughts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResponseBody(thoughts));
  }
}

class ResponseBody extends StatefulWidget {
  final List<Thought> thoughts;

  const ResponseBody(this.thoughts, {Key? key}) : super(key: key);

  @override
  _ResponseBodyState createState() => _ResponseBodyState(thoughts);
}

class _ResponseBodyState extends State<ResponseBody> {
  final formKey = GlobalKey<FormState>();
  final List<Thought> thoughts;
  final List<Thought> responses = [];

  _ResponseBodyState(this.thoughts) {
    for (Thought t in thoughts) responses.add(Thought());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
          child: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(16)),
          child: ListView(
            children: [
              Container(
                  child: Text(
                    'Compose an alternative response to each automatic thought',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w600,
                        color: darkestBlue),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(0))),
              Column(children: buildThoughts()),
              Container(
                child: sliderInstructions(),
                padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenHeight(32),
                    0,
                    getProportionateScreenHeight(16)),
              ),
              Column(children: buildSliders()),
              Container(height: getProportionateScreenHeight(64))
            ],
            shrinkWrap: true,
          ),
        ),
        navigationArrows(),
      ])),
    );
  }

  List<Widget> buildThoughts() {
    List<Widget> responseBoxes = [];
    int ct = 0;
    for (Thought r in responses) {
      responseBoxes.add(Theme(
        data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
                selectionColor: tertiary, selectionHandleColor: secondary)),
        child: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
          child: Column(children: [
            Container(
                alignment: Alignment(-1, 0),
                child: Text(thoughts[ct++].controller.text,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: secondary,
                      fontWeight: FontWeight.w600,
                    ))),
            TextFormField(
              controller: r.controller,
              decoration: InputDecoration(
                  hintText: 'Enter an alternative response here...',
                  hintStyle: TextStyle(color: tertiary)),
              maxLines: null,
              onEditingComplete: () {
                setState(() {});
              },
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter a response';
                return null;
              },
              enableInteractiveSelection: true,
              cursorColor: secondary,
              style: TextStyle(color: primary),
            ),
          ]),
        ),
      ));
    }
    return responseBoxes;
  }

  List<Widget> buildSliders() {
    List<Widget> sliders = [];
    int ct = 1;
    for (Thought r in responses) {
      sliders.add(Column(children: [
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
          child: Text(
            sliderText(r, ct++),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                0,
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(8)),
            child: ThoughtSlider(r)),
      ]));
    }

    return sliders;
  }

  Widget sliderInstructions() {
    if (thoughts.isEmpty) return Text('');
    return Text(
      'On a scale of 0-10, how much do you believe each response?',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
      textAlign: TextAlign.center,
    );
  }

  String sliderText(Thought r, int num) {
    if (r.controller.text == '') return 'Response $num';
    return r.controller.text;
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
              iconSize: 36,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: tertiary),
          Expanded(
              child: Text('',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.red))),
          IconButton(
              iconSize: 36,
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                //potentially change to handle potential errors on this page, or use text form field for that
                if (formKey.currentState!.validate()) {
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => CBTOutcome()));
                }
              },
              color: tertiary)
        ])
      ]),
    );
  }
}
