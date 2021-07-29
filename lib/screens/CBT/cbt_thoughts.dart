import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:arc_app/screens/CBT/cbt_thoughtdistortions.dart';
import 'package:arc_app/constants.dart';

class CBTThoughts extends StatelessWidget {
  CBTThoughts(this.dataKey, {Key? key}) : super(key: key);
  final String dataKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ThoughtsBody(dataKey));
  }
}

class ThoughtsBody extends StatefulWidget {
  final String dataKey;

  const ThoughtsBody(this.dataKey, {Key? key}) : super(key: key);

  @override
  _ThoughtsBodyState createState() => _ThoughtsBodyState(dataKey);
}

class _ThoughtsBodyState extends State<ThoughtsBody> {
  final formKey = GlobalKey<FormState>();
  final String dataKey;

  _ThoughtsBodyState(this.dataKey);

  String error = '';
  List<Thought> thoughts = [Thought()];

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
                    'What automatic thought(s) or image(s) went through your mind?',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w600,
                        color: darkestBlue),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(0))),
              Column(children: buildThoughts()),
              plusButton(),
              Container(
                child: sliderInstructions(),
                padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenHeight(16),
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
    if (thoughts.length == 1)
      return [
        Theme(
            data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                    selectionColor: tertiary, selectionHandleColor: secondary)),
            child: Container(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
              child: Column(children: [
                //Text('Thought', style: TextStyle(fontSize: getProportionateScreenWidth(16),color: primary,fontWeight: FontWeight.w600,)),
                TextFormField(
                  controller: thoughts[0].controller,
                  decoration: InputDecoration(
                      labelText: 'Thought 1',
                      labelStyle: TextStyle(
                          color: secondary, fontWeight: FontWeight.w600),
                      hintText: 'Enter here...',
                      hintStyle: TextStyle(color: tertiary)),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter a thought';
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
            ))
      ];

    List<Widget> thoughtBoxes = [];
    int ct = 1;
    for (Thought t in thoughts) {
      thoughtBoxes.add(Theme(
        data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
                selectionColor: tertiary, selectionHandleColor: secondary)),
        child: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: TextFormField(
                  controller: t.controller,
                  decoration: InputDecoration(
                      labelText: 'Thought $ct',
                      labelStyle: TextStyle(
                          color: secondary, fontWeight: FontWeight.w600),
                      hintText: 'Enter here...',
                      hintStyle: TextStyle(color: tertiary)),
                  maxLines: null,
                  onEditingComplete: () {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter a thought (or remove box)';
                    return null;
                  },
                  enableInteractiveSelection: true,
                  cursorColor: secondary,
                  style: TextStyle(color: primary),
                ),
              ),
              IconButton(
                  iconSize: getProportionateScreenHeight(24),
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    thoughts.remove(t);
                    setState(() {});
                  },
                  color: secondary)
            ]),
          ]),
        ),
      ));
      ct++;
    }
    return thoughtBoxes;
  }

  List<Widget> buildSliders() {
    List<Widget> sliders = [];
    int ct = 1;
    for (Thought t in thoughts) {
      sliders.add(Column(children: [
        Container(
          //alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
          child: Text(
            sliderText(t, ct++),
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
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(8)),
            child: ThoughtSlider(t)),
      ]));
    }

    return sliders;
  }

  Widget sliderInstructions() {
    if (thoughts.isEmpty) return Text('');
    return Text(
      'On a scale of 0-10, how much do you believe each thought?',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
      textAlign: TextAlign.center,
    );
  }

  String sliderText(Thought t, int num) {
    if (t.controller.text == '') return 'Thought $num';
    return t.controller.text;
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
                          builder: (context) {
                           List<String> temp = [];
                            for (Thought t in thoughts)
                                temp.add(t.controller.text);
                              return ThoughtDistortions(temp,dataKey);
                         }
                ))
                  ;
                }
              },
              color: tertiary)
        ])
      ]),
    );
  }

  Widget plusButton() {
    if(thoughts.length < 3)
    return Row(children: [
      Spacer(),
      IconButton(
        iconSize: getProportionateScreenHeight(40),
        onPressed: () {
          thoughts.add(Thought());
          setState(() {});
        },
        icon: Icon(Icons.add_circle),
        color: secondary,
      )
    ]);
    return SizedBox(height: getProportionateScreenHeight(16));
  }

  @override
  void dispose()
  {
    for(Thought t in thoughts)
      {
        t.dispose();
      }
    super.dispose();
  }
}

class Thought {
  Thought([this.thought]);
  TextEditingController controller = TextEditingController();
  double currentThoughtValue = 5;
  String? thought;

  void dispose()
  {
    controller.dispose();
}
}

class ThoughtSlider extends StatefulWidget {
  final Thought t;
  ThoughtSlider(this.t, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThoughtSliderState(t);
}

class _ThoughtSliderState extends State<ThoughtSlider> {
  Thought t;
  _ThoughtSliderState(this.t);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text('0', style: TextStyle(fontSize: getProportionateScreenWidth(14), color: darkestBlue)),
          Expanded(
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  t.currentThoughtValue = value;
                });
              },
              value: t.currentThoughtValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: t.currentThoughtValue.round().toString(),
              activeColor: secondary,
              inactiveColor: Colors.grey[350],
            ),
          ),
          Text('10', style: TextStyle(fontSize: getProportionateScreenWidth(14), color: darkestBlue))]
    );
  }
}
