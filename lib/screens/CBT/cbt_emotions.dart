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
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //Navigator.push(
            //  context,
           //   MaterialPageRoute(builder: (context) => CBTSituation()),
          //  );
          },
          label: const Text('Next')),
    );
  }
}

class EmotionBody extends StatefulWidget
{
  const EmotionBody({Key? key}) : super(key: key);

  @override
  _EmotionBodyState createState() => _EmotionBodyState();
}

class _EmotionBodyState extends State<EmotionBody>{
  final List<String> emotionNames = [
    'Fear',
    'Sadness',
    'Anger',
    'Guilt',
    'Irritation',
    'Disgust',
    'Embarrassment',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, -0.5),
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Text('What unpleasant emotion(s) are you feeling?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Flexible(
          child: ListView(children: buildEmotions(emotionNames)),
        ),
        Text('Rate the intensity of each emotion (1-10)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Flexible(
          child: ListView(children: []),
        ),
      ]),
    );
  }

  List<Widget> buildEmotions(List<String> emotionNames) {
    List<Widget> emotions = [];
    for (String name in emotionNames) {
      emotions.add(Emotion(name));
    }
    emotions.add(OtherEmotion());
    return emotions;
  }
}

class Emotion extends StatefulWidget {
  final String name;
  const Emotion(this.name, {Key? key}) : super(key: key);

  @override
  _EmotionState createState() => _EmotionState(name);
}

class _EmotionState extends State<Emotion> {
  String name;
  bool isChecked = false;
  double _currentEmotionValue = 5;
  _EmotionState(this.name);
  List<String> checkedEmotions = [];

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(name),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          if (isChecked)
            checkedEmotions.add(name);
          else
            checkedEmotions.remove(name);
          updateSliders();
        });
      },
    );
  }

  List<Widget> updateSliders()
  {
    return[];
  }

}

class OtherEmotion extends StatefulWidget {
  const OtherEmotion({Key? key}) : super(key: key);

  @override
  _OtherEmotionState createState() => _OtherEmotionState();
}

class _OtherEmotionState extends State<OtherEmotion> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Row(children: [Text('Other: '), Expanded(child: TextField())]),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}