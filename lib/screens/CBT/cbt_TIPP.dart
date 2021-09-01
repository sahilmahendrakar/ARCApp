import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'cbt_situation.dart';
import 'cbt_sensations.dart';

class TIPPSkills extends StatelessWidget {
  Set<String> sensationNames;
  final Map<String,double> emotionData;

  TIPPSkills(this.emotionData, this.sensationNames, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TIPPBody(emotionData, sensationNames));
  }
}

class TIPPBody extends StatefulWidget {
  Set<String> sensationNames;
  final Map<String,double> emotionData;
  TIPPBody(this.emotionData, this.sensationNames, {Key? key}) : super(key: key);

  @override
  _TIPPBodyState createState() => _TIPPBodyState(emotionData, sensationNames);
}

class _TIPPBodyState extends State<TIPPBody> {
  Set<String> sensationNames;
  String error = '';
  Set<Sensation> sensations = {};
  final Map<String,double> emotionData;
  bool canContinue = false;
  List<Sensation> skillOptions = [
    Sensation('Temperature'),
    Sensation('Intense Exercise'),
    Sensation('Paced Breathing'),
    Sensation('Progressive Muscle Relaxation'),
    Sensation('Other/None')
  ];
  Set<String> checkedSkills = {};
  List<TIPPSkill> skills = [
    TIPPSkill(
        'Temperature',
        'Decreasing the temperature of your face in one of these ways helps to calm down fast:',
        '• Holding your breath, put your face in a bowl of cold water (keep water above 50° F)\n'
            '• Hold a cold pack or plastic bag with ice water on your eyes and cheeks\n'
            '• Splash cold water on your face'),
    TIPPSkill(
        'Intense Exercise',
        'Engage in intense anaerobic exercise for a short time (~10-15 min) to expend stored up '
            'emotional energy. You could try:',
        '• Running\n'
            '• Fast walking\n'
            '• Jumping jacks\n'
            '• Playing a sport\n'
            '• Lifting weights\n'
            '• Dancing'),
    TIPPSkill(
        'Paced Breathing',
        'Slow your pace of breathing way down:',
        '• Slow breathing to 5-7 breaths/min\n'
            '• Breathe deeply from the abdomen\n'
            '• Breathe out more slowly than you breathe in\n'
            '• Continue for ~1-2 minutes'),
    TIPPSkill(
        'Progressive Muscle Relaxation',
        'Working head to toe, tense and relax each muscle group:',
        '• Tense for 5 seconds\n'
            '• Then let go and relax the muscle all the way\n'
            '• Notice the tension and the difference when the muscle is relaxed'),
  ];

  _TIPPBodyState(this.emotionData, this.sensationNames) {
    for (String s in sensationNames) sensations.add(Sensation(s));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          alignment: Alignment(0, -0.5),
          padding: EdgeInsets.all(16),
          child: ListView(children: [
            Container(
                child: Text(
                  'Try using one of the following TIPP Skills to calm down:',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.w600,
                    color: darkestBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(0))),
            buildTIPP(),
            Container(
                child: Text(
                  'Once you start to feel more calm, select which skill(s) you used',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.w600,
                    color: darkestBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(16))),
            Column(children: buildSensations()),
            Container(
              child: dropdownInstructions(),
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(16),
                  0, getProportionateScreenHeight(16)),
            ),
            Column(children: buildDropdowns()),
            Container(height: getProportionateScreenHeight(64))
          ]),
        ),
        navigationButton() //make a different method to be the skip/continue button
      ]),
    );
  }

  List<Widget> buildSensations() {
    List<Widget> sensationCheckboxes = [];
    for (Sensation s in skillOptions) {
      sensationCheckboxes.add(CheckboxListTile(
        title: Text(s.name,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: primary,
                fontWeight: FontWeight.w600)),
        value: s.isChecked,
        dense: true,
        onChanged: (bool? value) {
          setState(() {
            s.isChecked = value!;
            if (s.isChecked)
              checkedSkills.add(s.name);
            else
              checkedSkills.remove(s.name);
            if(checkedSkills.isNotEmpty)
              canContinue = true;
            else
              {
                canContinue = false;
                error = '';
              }

          });
        },
      ));
    }
    return sensationCheckboxes;
  }

  List<Widget> buildDropdowns() {
    List<Widget> dropdowns = [];
    if(!canContinue)
      return dropdowns;
    for (Sensation s in sensations) {
      dropdowns.add(Column(children: [
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
          child: Text(
            s.name,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(16), 0,
              getProportionateScreenWidth(0), getProportionateScreenHeight(24)),
          child: SensationDropdown(s),
        )
      ]));
    }
    return dropdowns;
  }

  Widget dropdownInstructions() {
    if (!canContinue) return Text('');
    return Text(
      'Rate the intensity of each physical feeling again',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
      textAlign: TextAlign.center,
    );
  }

  Widget navigationButton() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Column(children: [
        Spacer(),
        Row(children: [
          Expanded(
              child: Text(error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getProportionateScreenWidth(14)))),
          TextButton(
              child: getButtonText(), // make method to choose
              onPressed: () {
                if (!canContinue || checkValues()) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CBTSituation(emotionData)));
                    }
              },
              style: getButtonStyle())
        ])
      ]),
    );
  }

  bool checkValues() {
    for (Sensation s in sensations) {
      if (s.dropdownVal == 0) {
        error = 'Please rate every feeling';
        setState(() {});
        return false;
      }
    }
    return true;
  }

  Text getButtonText() {
    if (canContinue)
      return Text('CONTINUE',
          style: TextStyle(fontSize: getProportionateScreenWidth(20)));
    return Text('SKIP',
        style: TextStyle(fontSize: getProportionateScreenWidth(20)));
  }

  getButtonStyle() {
    if (canContinue)
      return TextButton.styleFrom(
        primary: pureWhite,
        backgroundColor: primary,
        shape: StadiumBorder(),
        fixedSize: Size(getProportionateScreenWidth(140),getProportionateScreenHeight(40))
      );
    return TextButton.styleFrom(
      primary: primary,
      backgroundColor: pureWhite,
      shape: StadiumBorder(),
      // fixedSize: Size(getProportionateScreenWidth(50), getProportionateScreenHeight(20))
    );
    //ButtonStyle(textStyle: MaterialStateProperty<TextStyle>(color: pureWhite),)
  }

  Widget buildTIPP() {
    List<Widget> temp = [];
    for (TIPPSkill s in skills) temp.add(skill(s));
    return Column(children: temp);
  }

  Widget skill(TIPPSkill s) {
    if (s.open) {
      return Column(children: [
        SizedBox(
          height: getProportionateScreenHeight(40),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(s.name,
                style: TextStyle(
                    color: secondary,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold)),
            Spacer(),
            IconButton(
                color: secondary,
                iconSize: (getProportionateScreenHeight(36)),
                onPressed: () {
                  s.open = false;
                  setState(() {});
                },
                icon: Icon(Icons.remove))
          ]),
        ),
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(bottom: getProportionateScreenWidth(4)),
          child: Text(s.bolded,
              style: TextStyle(
                  color: primary,
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
          child: Text(s.bullets,
              style: TextStyle(
                  color: primary, fontSize: getProportionateScreenWidth(16))),
        )
      ]);
    }
    return SizedBox(
        height: getProportionateScreenHeight(40),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(s.name,
              style: TextStyle(
                  color: secondary,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w600)),
          Spacer(),
          IconButton(
              color: secondary,
              iconSize: (getProportionateScreenHeight(36)),
              onPressed: () {
                s.open = true;
                setState(() {});
              },
              icon: Icon(Icons.add_circle))
        ]));
  }
}

class TIPPSkill {
  String name;
  String bolded;
  String bullets;
  bool open = false;

  TIPPSkill(this.name, this.bolded, this.bullets);
}
