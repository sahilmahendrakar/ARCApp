import 'package:arc_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'cbt_outcome.dart';
import 'cbt_thoughts.dart';

class CBTResponse extends StatelessWidget {
  final List<String> thoughts;
  final String dataKey;
  CBTResponse(this.thoughts, this.dataKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResponseBody(thoughts,dataKey));
  }
}

class ResponseBody extends StatefulWidget {
  final List<String> thoughts;
  final String dataKey;

  const ResponseBody(this.thoughts, this.dataKey,{Key? key}) : super(key: key);

  @override
  _ResponseBodyState createState() => _ResponseBodyState(thoughts,dataKey);
}

class _ResponseBodyState extends State<ResponseBody> {
  final formKey = GlobalKey<FormState>();
  final List<String> thoughts;
  final List<Thought> responses = [];
  bool open = false;
  final String dataKey;

  _ResponseBodyState(this.thoughts,this.dataKey) {
    for (String t in thoughts) responses.add(Thought(t));
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
              guidingQuestions(),
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

  Widget guidingQuestions() {
    if (open) {
      return Column(children: [
        SizedBox(
          height: getProportionateScreenHeight(30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Questions to help guide your response(s)',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.w600)),
            IconButton(
                color: Colors.grey,
                iconSize: (getProportionateScreenHeight(24)),
                onPressed: () {
                  open = false;
                  setState(() {});
                },
                icon: Icon(Icons.remove))
          ]),
        ),
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
          child: Text(
              '1) What is the evidence that the automatic thought is true? Not true?\n'
              '2) Is there an alternative explanation?\n'
              '3) What’s the worst that could happen? Could I live through it? What’s the best that could happen? '
                  'What’s the most realistic outcome?\n'
              '4) What’s the effect of my believing the automatic thought? What could be the effect of changing my thinking?\n'
              '5) What should I do about it?\n'
              '6) If ______ (friend’s name) was in the situation and had this thought, what would I tell them?',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(14))),
        )
      ]);
    }
    return SizedBox(
        height: getProportionateScreenHeight(30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('Questions to help guide your response(s)',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w600)),
          IconButton(
              color: Colors.grey,
              iconSize: (getProportionateScreenHeight(24)),
              onPressed: () {
                //AlertDialog alert=AlertDialog( title:Text('Guiding Questions'), content: Text(
                //    '•  Insert question here?\n'
                 //       '•  Insert another question here?\n'
                //        '•  More questions here?')  );
               // showDialog(context:context,builder:(BuildContext context){ return alert;}, );
                open = true;
                setState(() {});
              },
              icon: Icon(Icons.add_circle))
        ]));
  }

  List<Widget> buildThoughts() {
    List<Widget> responseBoxes = [];
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
                child: Text(r.thought!,
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
                //potentially change to handle potential errors on this page, or use text form field for that
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CBTOutcome(thoughts,dataKey)));
                }
              },
              color: tertiary)
        ])
      ]),
    );
  }

  @override
  void dispose()
  {
    for(Thought t in responses)
    {
      t.dispose();
    }
    super.dispose();
  }
}
