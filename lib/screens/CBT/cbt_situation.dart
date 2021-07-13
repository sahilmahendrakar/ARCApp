import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import '../../size_config.dart';
import 'cbt_thoughts.dart';

class CBTSituation extends StatelessWidget {
  final String dataKey;
  CBTSituation(this.dataKey, {Key? key}) : super(key: key);

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
    'Nausea',
    'Headache',
    'Insomnia',
    'Fatigue',
    'Shortness of breath',
    'Sweating',
    'Chest pain',
    'Trembling/Shaking',
    'Other:    ',
  ];
  Set<Sensation> checkedSensations = {};
  Set<Sensation> sensations = {};
  final String dataKey;
  final formKey = GlobalKey<FormState>();

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
              new Container(
                child: Text(
                    'What event, daydream, or recollection led to the unpleasant emotion?',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
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
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                  child: Text(
                    'What (if any) distressing physical sensations did you have?',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: darkestBlue),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(0))),
              Column(children: buildSensations()),
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
          ),
        ))
      ]);
    return Text(s.name,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: primary,
            fontWeight: FontWeight.w600));
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
                          builder: (context) => CBTThoughts(dataKey)));
              },
              color: tertiary)
        ])
      ]),
    );
  }
}

class Sensation {
  String name;
  bool isChecked = false;
  Sensation(this.name);
}

/*
class CBTSituation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Container(


          child:SafeArea(
          child: Column(
            children: [
            new Container(
               child: Text('What event,daydream, or recollection led to the unpleasant emotion?',
                                  style: TextStyle( color:darkestBlue,fontSize: 24)),),
            new Container(
               child: Padding(
                 padding:EdgeInsets.all(8.0),
                 child:TextField(
                    autocorrect:true,
                    textAlign:TextAlign.start,
                    decoration:InputDecoration(
                     enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color:darkestBlue,width:3),),
                      hintText:'Please enter here...',
                      contentPadding: new EdgeInsets.symmetric(vertical: 50.0),
                      ),)


                 ),
                 ),
              new Container (
                child:SensationBody(),

            )
                 ],
                 ),
                 ),
       ),
     );
     }
     }

class SensationBody extends StatefulWidget{
          SensationBody({Key? key}):super(key:key);


          @override
          _SensationBody createState()=>_SensationBody();
}

class _SensationBody extends State<SensationBody>{
       final  List<String> sensationNames=[
                'Nausea',
                'Headache',
                'Insomnia',
                'Fatigue',
                'Shortness of breath',
                'Sweating',
                'Chest pain',
                'Trembling/Shaking',
                'Other:       ',
        ];
        Set<Sensation> checkedSensations = {};
        Set<Sensation> sensations = {};
        final TextEditingController otherController = TextEditingController();

        _SensationBody() {
            for (String name in sensationNames) sensations.add(Sensation(name));
          }


        @override
        Widget build(BuildContext context){
           return SafeArea(
               child:Container (
                   alignment:Alignment(0,-0.5),
                   padding:EdgeInsets.all(16),
                   child:Column(children: [
                       Container(
                                    child: Text(
                                      'What (if any) distressing physical sensations did you have?',
                                      style: TextStyle(
                                          fontSize: getProportionateScreenWidth(18),
                                          fontWeight: FontWeight.w600,
                                          color: darkestBlue),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: getProportionateScreenHeight(0))),
                      Column( children: buildSensations()
                      ),

                   ]),
               ),
         );
        }

        List<Widget> buildSensations(){
           List<Widget> sensationCheckboxes=[];
           for(Sensation s in sensations){
              sensationCheckboxes.add(CheckboxListTile(
               title: checkboxText(s),
               value:s.isChecked,
               dense:true,
               onChanged:(bool? value){
                 setState((){
                   s.isChecked=value!;
                   if(s.isChecked)
                       checkedSensations.add(s);
                   else
                       checkedSensations.remove(s);
                 });
               },));
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
                    controller: otherController,
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
                  ),
                ))
              ]);
            return Text(s.name,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    color: primary,
                    fontWeight: FontWeight.w600));
          }
}

class Sensation {
      String name;
      bool isChecked=false;
      Sensation(this.name);
}

*/

/*   return Scaffold(
      appBar:AppBar(
        title: Text('What event,daydream, or recollection led to the unpleasant emotion?',
            style: TextStyle( color:darkestBlue,fontSize: 18)),
        leadingWidth:0,
        backgroundColor:pureWhite,
        elevation:0,
        centerTitle:false,
     ),
     body:
     Padding(
       padding:EdgeInsets.all(32),
       child:TextField(
          autocorrect:true,
          textAlign:TextAlign.start,
          decoration:InputDecoration(
           enabledBorder:OutlineInputBorder(
            borderSide:BorderSide(color:darkestBlue,width:3),),
            hintText:'Please enter here...',
            contentPadding: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),),)


       )
    );
  }
} */
/*
class Textfield extends StatefulWidget{
     @override
     TextfieldState createState() {
          return TextfieldState(); }
}
class TextfieldState extends State<Textfield>{
      @override
      Widget build(BuildContext context){
           return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:8, vertical:16),
                  child:TextField(
                     decoration:InputDecoration(
                       border:OutlineInputBorder(
                         borderSide:BorderSide(color:darkestBlue),),

                       hintText: 'Please type here',
                       ),),
               ),
                ],
                );

      }


} */
/*
class SecondRoute extends StatelessWidget{
  @override
  Widget build(buildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("Second Route")
      ),
      body:Center(
        child:ElevatedButton(
          onPressed:(){
            Navigator.pop(context);
          },
          child:Text('Go back!'),
        ),
      ),
    );
  }
}  */
