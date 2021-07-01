import 'package:arc_app/size_config.dart';
import 'package:flutter/material.dart';
//import 'CBTSituation.dart';
import 'package:arc_app/constants.dart';

class CBTEmotions extends StatelessWidget {
  CBTEmotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // title: Text('Emotions'),
      // ),
      body: EmotionBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(100)),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                padding:
                    EdgeInsets.only(left: getProportionateScreenWidth(100)),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                ),
              ),
              label: "")
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class EmotionBody extends StatefulWidget {
  const EmotionBody({Key? key}) : super(key: key);

  @override
  _EmotionBodyState createState() => _EmotionBodyState();
}

class _EmotionBodyState extends State<EmotionBody> {
  final List<String> emotionNames = [
    'Fear',
    'Sadness',
    'Anger',
    'Guilt',
    'Irritation',
    'Disgust',
    'Embarrassment',
    'Other:    '
  ];
  Set<Emotion> checkedEmotions = {};
  Set<Emotion> emotions = {};
  final TextEditingController otherController = TextEditingController();

  _EmotionBodyState() {
    for (String name in emotionNames) emotions.add(Emotion(name));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment(0, -0.5),
        padding: EdgeInsets.all(16),
        child: ListView(children: [
          Container(
              child: Text(
                'What unpleasant emotion(s) are you feeling?',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: darkestBlue),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(0))),
          Column(children: buildEmotions()),
          Container(
            child: sliderInstructions(),
            padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(32), 0,
                getProportionateScreenHeight(16)),
          ),
          Column(children: updateSliders()),
        ]),
      ),
    );
  }

  List<Widget> buildEmotions() {
    List<Widget> emotionCheckboxes = [];
    for (Emotion e in emotions) {
      emotionCheckboxes.add(CheckboxListTile(
        title: checkboxText(e),
        value: e.isChecked,
        dense: true,
        onChanged: (bool? value) {
          setState(() {
            e.isChecked = value!;
            if (e.isChecked)
              checkedEmotions.add(e);
            else
              checkedEmotions.remove(e);
            //updateSliders();
          });
        },
      ));
    }
    return emotionCheckboxes;
  }

  Widget checkboxText(Emotion e) {
    if (e.name == 'Other:    ')
      return Row(children: [
        Text('Other:    ',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: primary,
                fontWeight: FontWeight.w600)),
        Expanded(
            child: Theme(
          data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                  selectionColor: tertiary, selectionHandleColor: secondary)),
          child: TextField(
            controller: otherController,
            onTap: () {
              setState(() {
                e.isChecked = true;
                checkedEmotions.add(e);
              });
            },
            onChanged: (String value) {
              setState(() {});
            },
            enableInteractiveSelection: true,
            cursorColor: secondary,
            style: TextStyle(color: darkestBlue),
          ),
        ))
      ]);
    return Text(e.name,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: primary,
            fontWeight: FontWeight.w600));
  }

  String sliderText(Emotion e) {
    if (e.name == 'Other:    ') return otherController.text;
    return e.name;
  }

  Widget sliderInstructions() {
    if (checkedEmotions.isEmpty) return Text('');
    return Text(
      'Rate the intensity of each emotion (0-10)',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
    );
  }

  //this is one way --> could also create a class with string and boolean
  //and change boolean value according to check and cycle through all
  //the values in this function (if this causes them to go in order
  //of being checked, that might change it so it orders according to
  //box order, but that's really just personal preference)
  List<Widget> updateSliders() {
    List<Widget> sliders = [];
    for (Emotion e in checkedEmotions) {
      sliders.add(Column(children: [
        Text(sliderText(e),
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: primary,
                  fontWeight: FontWeight.bold)),
        EmotionSlider(e),
      ]));
    }

    return sliders;
  }
}

class Emotion {
  String name;
  bool isChecked = false;
  double currentEmotionValue = 5;

  Emotion(this.name);
}

class EmotionSlider extends StatefulWidget {
  final Emotion e;
  EmotionSlider(this.e, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmotionSliderState(e);
}

class _EmotionSliderState extends State<EmotionSlider> {
  Emotion e;
  _EmotionSliderState(this.e);

  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (double value) {
        setState(() {
          e.currentEmotionValue = value;
        });
      },
      value: e.currentEmotionValue,
      min: 0,
      max: 10,
      divisions: 10,
      label: e.currentEmotionValue.round().toString(),
      activeColor: secondary,
      inactiveColor: Colors.grey[350],
    );
  }
}
/**
class EmotionCheckbox extends StatefulWidget{
  final Emotion e;
  EmotionCheckbox(this.e, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmotionCheckboxState(e);

}

class _EmotionCheckboxState extends State<EmotionCheckbox>{
  Emotion e;
  _EmotionCheckboxState(this.e);
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: checkboxText(e),
      value: e.isChecked,
      dense: true,
      onChanged: (bool? value) {
        setState(() {
          e.isChecked = value!;
          if (e.isChecked)
            _EmotionBodyState.checkedEmotions.add(e);
          else
            _EmotionBodyState.checkedEmotions.remove(e);
          //updateSliders();
        });
      },
    );
  }

  Widget checkboxText(Emotion e) {
    if (e.name == 'Other:    ')
      return Row(children: [
        Text('Other:    ',
            style: TextStyle(fontSize: getProportionateScreenWidth(16))),
        Expanded(
            child: TextField(
              onTap: () {
                setState(() {
                  e.isChecked = true;
                });
              },
              enableInteractiveSelection: true,
            ))
      ]);
    return Text(e.name,
        style: TextStyle(fontSize: getProportionateScreenWidth(16)));
  }
}
    */
