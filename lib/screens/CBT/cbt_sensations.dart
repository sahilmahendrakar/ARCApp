import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import '../../size_config.dart';
import 'cbt_situation.dart';
import 'package:arc_app/screens/CBT/cbt_TIPP.dart';

class CBTSensation extends StatelessWidget {
  final String dataKey;
  CBTSensation(this.dataKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SensationBody(dataKey),
    );
  }
}

class SensationBody extends StatefulWidget {
  final String dataKey;
  SensationBody(this.dataKey, {Key? key}) : super(key: key);

  @override
  _SensationBody createState() => _SensationBody(dataKey);
}

class _SensationBody extends State<SensationBody> {
  final List<String> sensationNames = [
    'Nausea/Pit in stomach',
    'Shortness of breath',
    'Sweating',
    'Chest pain/Racing heart',
    'Trembling/Shaking',
    'Other:    ',
  ];
  Set<Sensation> checkedSensations = {};
  Set<Sensation> sensations = {};
  final String dataKey;
  final formKey = GlobalKey<FormState>();
  final TextEditingController otherController = TextEditingController();
  String error = '';

  _SensationBody(this.dataKey) {
    for (String name in sensationNames) sensations.add(Sensation(name));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Stack(children: [
          Container(
            alignment: Alignment(0, -0.5),
            padding: EdgeInsets.all(16),
            child: ListView(children: [
              Container(
                  child: Text(
                    'What (if any) distressing physical feelings did you have?',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w600,
                      color: darkestBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(0))),
              Column(children: buildSensations()),
              Container(
                child: dropdownInstructions(),
                padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenHeight(16),
                    0,
                    getProportionateScreenHeight(16)),
              ),
              Column(children: buildDropdowns()),
              Container(height: getProportionateScreenHeight(64))
            ]),
          ),
          navigationArrows()
        ]),
      ),
    );
  }

  List<Widget> buildSensations() {
    List<Widget> sensationCheckboxes = [];
    for (Sensation s in sensations) {
      sensationCheckboxes.add(CheckboxListTile(
        title: checkboxText(s),
        value: s.isChecked,
        dense: true,
        onChanged: (bool? value) {
          setState(() {


            s.isChecked = value!;
            if (s.isChecked)
              checkedSensations.add(s);
            else
              checkedSensations.remove(s);
          });
        },
      ));
    }
    return sensationCheckboxes;
  }

  Widget checkboxText(Sensation s) {
    if (s.name == 'Other:    ')
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
            onTap: () {
              setState(() {
                s.isChecked = true;
                checkedSensations.add(s);
              });
            },
            onChanged: (String value) {
              setState(() {});
            },
            enableInteractiveSelection: true,
            cursorColor: secondary,
            style: TextStyle(color: darkestBlue),
            controller: otherController,
          ),
        ))
      ]);
    return Text(s.name,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: primary,
            fontWeight: FontWeight.w600));
  }

  List<Widget> buildDropdowns() {
    List<Widget> dropdowns = [];
    for (Sensation s in checkedSensations) {
      dropdowns.add(Column(children: [
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
          child: Text(
            dropdownText(s),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(16),
              0,
              getProportionateScreenWidth(0),
              getProportionateScreenHeight(24)),
          child: SensationDropdown(s),)
      ]
      ));
    }

    return dropdowns;
  }



  Widget dropdownInstructions() {
    if (checkedSensations.isEmpty) return Text('');
    return Text(
      'Rate the intensity of each physical feeling',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w600,
          color: darkestBlue),
      textAlign: TextAlign.center,
    );
  }

  String dropdownText(Sensation s) {
    if (s.name == 'Other:    ' && otherController.text != '')
      return otherController.text;
    else if (s.name == 'Other:    ') return 'Other';
    return s.name;
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
                if (checkValues())
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CBTSituation(dataKey)));
              },
              color: tertiary)
        ])
      ]),
    );
  }

  bool checkValues() {
    for (Sensation s in checkedSensations) {
      if (s.dropdownVal == 0) {
        error = 'Please rate every feeling';
        setState(() {});
        return false;
      }
    }
    setState(() {
      error ='';
    });
    for (Sensation s in checkedSensations) {
      if (s.dropdownVal == 4) {
        AlertDialog alert = AlertDialog(
          title: Text(
              'Did you know that it is important to physically calm your body before being able to think clearly?',textAlign: TextAlign.center , style: TextStyle(fontSize: getProportionateScreenWidth(20))),
          content: Text('Since you rated at least one physical feeling as \"highly distressing\", '
              'we recommend that you use something known as TIPP skills to calm yourself physically before continuing.\n\n'
              'Click the button below for help using these skills.'),
          actions: [
            Container(
              alignment: Alignment(0,0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Set<String> sensationNames = {};
                 for(Sensation s in checkedSensations)
                   {
                     if(s.name != 'Other:    ')
                     sensationNames.add(s.name);
                     else
                       {
                         if(otherController.text == '')
                           sensationNames.add('Other');
                         else
                           sensationNames.add(otherController.text);
                       }
                   }
                  Navigator.push( context,MaterialPageRoute(builder: (context) => TIPPSkills(dataKey,sensationNames)));
                },
                  child: Text('TIPP SKILLS', style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              style: TextButton.styleFrom(
                  primary: pureWhite,
                  backgroundColor: primary,
                  shape: StadiumBorder(),
                  fixedSize: Size(getProportionateScreenWidth(130),getProportionateScreenHeight(30))
                  //minimumSize: Size(getProportionateScreenWidth(150),
                     // getProportionateScreenHeight(50))
                  ),
              ),
            ),
            Container(
              alignment: Alignment(0,0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push( context,MaterialPageRoute(builder: (context) => CBTSituation(dataKey)));
                },
                child: Text('SKIP', style: TextStyle(fontSize: getProportionateScreenWidth(16))),
                style: TextButton.styleFrom(
                    primary: primary)
                  //minimumSize: Size(getProportionateScreenWidth(150),
                  // getProportionateScreenHeight(50))
                ),
              ),

          ],
        );
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return alert;
          },
        );
        return false;
      }
    }
    return true;
  }
}

class Sensation {
  String name;
  bool isChecked = false;
  int dropdownVal = 0;
  Sensation(this.name);
}

class SensationDropdown extends StatefulWidget {
  final Sensation s;
  SensationDropdown(this.s,{Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SensationDropdownState(s);
}

class _SensationDropdownState extends State<SensationDropdown> {
  Sensation s;
  _SensationDropdownState(this.s);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        onChanged: (int? newVal) {
          setState(() {
            s.dropdownVal = newVal!;
          });
        },
        value: s.dropdownVal,
        iconEnabledColor: secondary,
        style: TextStyle(color: secondary),
        items: [
          DropdownMenuItem<int>( child: Text(
            'Click to choose',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
              value: 0),
          DropdownMenuItem<int>(
              child: Text('Not at all distressing'), value: 1),
          DropdownMenuItem<int>(child: Text('Mildly distressing'), value: 2),
          DropdownMenuItem<int>(
              child: Text('Moderately distressing'), value: 3),
          DropdownMenuItem<int>(child: Text('Highly distressing'), value: 4)
        ]);
  }
}
