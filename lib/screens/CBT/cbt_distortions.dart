import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:arc_app/screens/CBT/cbt_response.dart';

class ThoughtDistortions extends StatelessWidget {
  final List<String> thoughts;
  final Map<String, double> emotionData;
  ThoughtDistortions(this.thoughts, this.emotionData, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThoughtDistortion(thoughts, emotionData),
    );
  }
}

class ThoughtDistortion extends StatefulWidget {
  final List<String> thoughts;
  final Map<String, double> emotionData;

  const ThoughtDistortion(this.thoughts, this.emotionData, {Key? key})
      : super(key: key);

  @override
  _Distortions createState() => _Distortions(thoughts, emotionData);
}

class _Distortions extends State<ThoughtDistortion> {
  final List<String> thoughts;
  final Map<String, double> emotionData;
  String error = '';
  Set<String> checkedDistortions = {};
  List<String> distortionNames = [
    'All-Or-Nothing',
    'Catastrophizer',
    'Mind Reader',
    'Fortune Teller',
    'Filterer',
    'Downplayer',
    'Emotional Reasoner',
    '\"Should\" Stickler',
    'Labeler',
    'Personalization'
  ];
  List<String> imagePaths = [
    'assets/images/allornoth.jpg',
    'assets/images/catastroph.jpg',
    'assets/images/mindreader.jpg',
    'assets/images/fortuneteller.jpg',
    'assets/images/filterer.jpg',
    'assets/images/downplayer.jpg',
    'assets/images/emotionalreas.jpg',
    'assets/images/should.jpg',
    'assets/images/labeler.jpg',
    'assets/images/personal.jpg',
  ];

  List<String> alerts = [
    "If you’re not perfect, you’re a total loser. If you don’t get everything you want, it feels like you got nothing. If you’re having a good day, the whole rest of your life is perfect and you don’t need therapy anymore.",
    'Predict the future negatively without considering other, more likely outcomes.\n\nExamples:\n“I’m definitely going to fail my test,”\n“If I tell her that, she’ll hate me forever.”',
    'You believe you know what other people are thinking even without asking.\n\nExample:\n“He clearly doesn’t think I will do a good job.”',
    'You make a sweeping, negative conclusion that goes far beyond the current situation.\n\nExample:\n“Since I felt uncomfortable in my first day of class, I know that I won’t be able to enjoy the rest of the year.”',
    'You develop selective hearing and vision and only hear and see the one negative thing and ignore the many positive things.\n\nExample:\n“Because my supervisor gave me one low rating on my evaluation (that also had many higher ratings), it means I’m doing a terrible job.”',
    'You tell yourself that the positive experiences, actions, or qualities do not count.\n\nExample:\n“I did well in that one basketball game because I just got lucky.”',
    'You start thinking your emotions are fact. \n\nExamples:\n“I feel . . .; therefore, it is. I feel like she hates me; therefore, she does.”\n“I feel stupid; therefore I am stupid.”\n“I dread school, so it’s a bad idea to go.”',
    'You “should” on yourself or someone else by having a fixed idea of how you or others should behave, and you overestimate how bad it will be if these expectations are not met. \n\nExamples:\n“It’s terrible that I made a mistake; I should always do my best.”\n“You shouldn’t be so upset.”',
    'Overgeneralization is taken a step further by the use of extreme language to describe things.\n\nExamples:\n“I spilled my milk. I am SUCH A LOSER!”\n“My therapist didn’t call me right back; she is the most uncaring, heartless therapist ever!”',
    'You see yourself as the cause for things you have absolutely no control over or the target of stuff that may have absolutely nothing to do with you.\n\nExamples:\n“My parents divorced because of me.”\n“The receptionist was short with me because I did something wrong.”'
  ];

  List<String> distortionCodes = [
    "a", "ca", "m", "fo", "fi", "d", "e", "s", "l", "p"
  ];
  final List<Distortion> distortions = [];

  _Distortions(this.thoughts, this.emotionData) {
    for (int i = 0; i < distortionNames.length; i++)
      distortions.add(Distortion(distortionNames[i], imagePaths[i], alerts[i], distortionCodes[i]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(5),
                vertical: getProportionateScreenHeight(5)),
            child: ListView(
              children: [
                Container(
                  child: Text(
                    'Select Cognitive Distortion(s):',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w600,
                        color: darkestBlue),
                    textAlign: TextAlign.center,
                    //color:darkestBlue,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(13)),
                  child: Text(
                      "Click on the picture of a cognitive distortion to read its description. "
                      "If you think the distortion applies to your current thoughts, mark the box below it with a check mark. "
                      "You can select up to two distortions.",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: primary),
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                buildDistortions(),
              ],
            ),
          ),
          navigationArrows(),
        ],
      ),
    );
  }

  Widget distortionCheckbox(Distortion d) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Text(title),
        GestureDetector(
            onTap:(){
              AlertDialog alert=AlertDialog(
                  title:Text(d.name),
                  content:Text(d.alert)
              );
              showDialog(
                context:context,
                builder:(BuildContext context){
                  return alert;
                },
              );
            },
            child: Image.asset(d.imagePath, width: getProportionateScreenWidth(80), height: getProportionateScreenHeight(80))),
        Text(d.name, style: TextStyle(color: darkestBlue, fontSize: getProportionateScreenWidth(getFontSize(36,d.name)))),
        Checkbox(
          value: d.isChecked,
          onChanged: (bool? value) {
            setState(() {
              d.isChecked = value!;
              if (value == true) {
                checkedDistortions.add(d.code);
              } else {
                checkedDistortions.remove(d.code);
              }
            });
          },
        ),
      ],
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
          Expanded(
              child: Text(error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.red))),
          IconButton(
              iconSize: getProportionateScreenHeight(36),
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (checkedDistortions.length > 2 ||
                    checkedDistortions.isEmpty) {
                  error = 'Please select up to 2 corresponding distortion(s)';
                  setState(() {});
                  return;
                }
                ;

                List<String> temp = [];
                for (String s in checkedDistortions) temp.add(s);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CBTResponse(thoughts, emotionData, temp)));
              },
              color: tertiary)
        ])
      ]),
    );
  }

  Widget buildDistortions() {
    int pos = 0;
    List<Widget> temp = [];
    List<Widget> currentRow = [];
    for(int i = 0; i < distortions.length; i++)
      {
        if (pos == 3)
          {
            temp.add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: currentRow));
            temp.add(SizedBox(height: getProportionateScreenHeight(8)));
            pos = 0;
            currentRow = [];
          }
        currentRow.add(distortionCheckbox(distortions[i]));
        if(i == distortions.length - 1)
          temp.add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: currentRow));
        pos++;
      }
    return Column(children: temp);
  }

  double getFontSize(int i, String name) {
    if (name.length < 16)
      return 12;
    return (80/ name.length) * 2;
  }
}

class Distortion {
  String name;
  String imagePath;
  String alert;
  String code;
  bool isChecked = false;

  Distortion(this.name, this.imagePath, this.alert, this.code);
}
