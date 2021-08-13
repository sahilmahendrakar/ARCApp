import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:arc_app/screens/CBT/cbt_response.dart';
import 'cbt_thoughts.dart';

class ThoughtDistortions extends StatelessWidget {
  final List<String> thoughts;
  final String dataKey;
  ThoughtDistortions(this.thoughts, this.dataKey,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ThoughtDistortion(thoughts,dataKey),

    );
  }
}
class ThoughtDistortion extends StatefulWidget{
  final List<String> thoughts;
  final String dataKey;

  const ThoughtDistortion(this.thoughts,this.dataKey, {Key? key}) : super(key: key);

  @override
  _Distortions createState()=>_Distortions(thoughts,dataKey);
}
class _Distortions extends State<ThoughtDistortion>{
  /*Map<String, bool?> distortions= {
    'allornoth':false,
    "downplayer":false,
    "conclusionjump":false,
    "mindreader":false,
    "fortuneteller":false,
    "emotionalreas":false,
    "shoul":false,
    "labeler":false,
    "blamer":false,
    "catastroph":false,
    "personal":false,
    "right":false };  */
  final List<String> thoughts;
  final List<Thought> responses = [];
  final String dataKey;

  _Distortions(this.thoughts,this.dataKey) {
    for (String t in thoughts) responses.add(Thought(t));
  }


  String error = '';

  Set<String> checkedDistortions = {};
  /* Set<Distortion> checkedDistortions = {};
  Set<Distortion> dist = {};
  final TextEditingController otherController = TextEditingController(); */



  bool? allornoth=false;
  bool? catastroph=false;
  bool? mindreader=false;
  bool? fortuneteller=false;
  bool? filterer=false;
  bool? downplayer=false;
  bool? emotionalreas=false;
  bool? should=false;
  bool? labeler=false;
  bool? personal=false;




  Widget checkbox(String title, bool? boolValue){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children:<Widget>[
        //Text(title),
        Checkbox(
          value:boolValue,

          onChanged:(bool? value) {
            setState((){
              if(value==true){
                checkedDistortions.add(title); }
              else{
                checkedDistortions.remove(title);
              }
              switch (title) {
                case "a":
                  allornoth = value;

                  break;
                case "ca":
                  catastroph = value;
                  break;
                case "m":
                  mindreader= value;
                  break;
                case "fo":
                  fortuneteller = value;
                  break;
                case "fi":
                  filterer = value;
                  break;
                case "d":
                  downplayer = value;
                  break;
                case "e":
                  emotionalreas = value;
                  break;
                case "s":
                  should = value;
                  break;
                case "l":
                  labeler = value;
                  break;
                case "p":
                  personal = value;
                  break;


              }

            });
          },
        ),

      ],
    );

  }
  /*
   createAlertDialog(BuildContext context){
     //TextEditingController customController=new TextEditingController();

     return showDialog(context: context, builder: (context){
       return AlertDialog(
         title:Text("Mind Reader:"),
       );
     });

   }  */
  @override
  Widget build(BuildContext context){
    return SafeArea(

      child: Stack( children: [
        /* new Scaffold(
           backgroundColor: Colors.blueGrey[800],
         ), */
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(5),
              vertical: getProportionateScreenHeight(5)),
          child:ListView( children: [

            Container(
              child:
              Text(
                'Select Cognitive Distortion(s):',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.w600,
                    color: darkestBlue),
                textAlign: TextAlign.center,
                //color:darkestBlue,

              ),),
            SizedBox(height:getProportionateScreenHeight(4)),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(13)),
              child: Text(
                  "Click on the picture of a cognitive distortion to read its description. "
              "If you think the distortion applies to your current thoughts, mark the box below it with a check mark. "
              "You can select up to two distortions.",
             style: TextStyle(
                  fontSize:getProportionateScreenWidth(14),
                  color: primary),
                 textAlign:TextAlign.center
    ),
              ),

            SizedBox(height:20),
            Container(


              //padding:EdgeInsets.all(50),
              child:Column(
                //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('All Or Nothing'),
                              content: Text("If you’re not perfect, you’re a total loser. If you don’t get everything you want, it feels like you got nothing. If you’re having a good day, the whole rest of your life is perfect and you don’t need therapy anymore.")
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },

                        child: ClipRRect(
                          //borderRadius: BorderRadius.circular(25),
                          child:
                          Image.asset('assets/images/allornoth.jpg', width: getProportionateScreenWidth(80),
                              height: getProportionateScreenHeight(80)),
                        ),),

                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Catastrophizer'),
                              content: Text('Predict the future negatively without considering other, more likely outcomes. “I’m definitely going to fail my test,” or “If I tell her that, she’ll hate me forever.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/catastroph.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)), ),
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Mind reader'),
                              content:Text('You believe you know what other people are thinking even without asking. “He clearly doesn’t think I will do a good job.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/mindreader.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),

                    ],
                  ),

                  Row(
                    //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:<Widget>[
                      Column( children:<Widget>[

                        Text("All-Or-Nothing", style: TextStyle(fontSize:11,),),
                        checkbox('a',allornoth), ], ),
                      Column( children:<Widget>[
                        Text("Catastrophizer", style: TextStyle(fontSize:11,),),
                        checkbox('ca',catastroph),], ),
                      Column( children:<Widget>[
                        Text("Mind Reader", style: TextStyle(fontSize:11,),),
                        checkbox('m',mindreader), ], ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text("Fortune Teller"),
                              content:Text('You make a sweeping, negative conclusion that goes far beyond the current situation. “Since I felt uncomfortable in my first day of class, I know that I won’t be able to enjoy the rest of the year.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset('assets/images/fortuneteller.jpg', width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Filterer'),
                              content: Text('You develop selective hearing and vision and only hear and see the one negative thing and ignore the many positive things. “Because my supervisor gave me one low rating on my evaluation (that also had many higher ratings), it means I’m doing a terrible job.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/filterer.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Downplayer of positives'),
                              content: Text('You tell yourself that the positive experiences, actions, or qualities do not count. “I did well in that one basketball game because I just got lucky.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;

                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/downplayer.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:<Widget>[
                      Column( children:<Widget>[

                        Text("Fortune Teller", style: TextStyle(fontSize:11,),),checkbox('fo',fortuneteller ),]),
                      Column( children:<Widget>[

                        Text("Filterer", style: TextStyle(fontSize:11,),),checkbox('fi',filterer),]),
                      Column( children:<Widget>[

                        Text("Downplayer", style: TextStyle(fontSize:11,),),checkbox('d',downplayer),]),



                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Emotional Reasoner'),
                              content: Text('You start thinking your emotions are fact. “I feel . . .; therefore, it is. I feel like she hates me; therefore, she does.” “I feel stupid; therefore I am stupid.” “I dread school, so it’s a bad idea to go.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset('assets/images/emotionalreas.jpg', width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('"Should" Statements'),
                              content:Text('You “should” on yourself or someone else by having a fixed idea of how you or others should behave, and you overestimate how bad it will be if these expectations are not met. “It’s terrible that I made a mistake; I should always do my best.” “You shouldn’t be so upset.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/should.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Labeler'),
                              content:Text('Overgeneralization is taken a step further by the use of extreme language to'
                                  'describe things. “I spilled my milk. I am SUCH A LOSER!” “My therapist didn’t call me right'
                                  'back; she is the most uncaring, heartless therapist ever!”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset("assets/images/labeler.jpg", width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:<Widget>[
                      Column( children:<Widget>[

                        Text("Emotional Reasoner", style: TextStyle(fontSize:11,),),checkbox('e',emotionalreas),]),
                      Column( children:<Widget>[

                        Text("\"Should\" Stickler    ", style: TextStyle(fontSize:11,),),checkbox('s',should),]),
                      Column( children:<Widget>[

                        Text("     Labeler     ", style: TextStyle(fontSize:11,),),checkbox('l',labeler),]),



                    ],
                  ),
                  SizedBox(height: 20),


                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,

                    //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          AlertDialog alert=AlertDialog(
                              title:Text('Personalization'),
                              content: Text('You see yourself as the cause for things you have absolutely no'
                                  'control over or the target of stuff that may have absolutely nothing to do with you. “My'
                                  'parents divorced because of me.” “The receptionist was short with me because I did'
                                  ' something wrong.”')
                          );
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return alert;
                            },
                          );
                        },
                        child:
                        Image.asset('assets/images/personal.jpg', width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(80)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:<Widget>[
                      Column( children:<Widget>[

                        Text("Personalization", style: TextStyle(fontSize:11,),),checkbox('p',personal),]),


                    ],
                  ),
                ],
              ),

            ),
          ], ), ),
        navigationArrows(),
      ],

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


                if (checkedDistortions.length>2 || checkedDistortions.isEmpty) {
                  error = 'Please select up to 2 corresponding distortion(s)';
                  setState(() {});
                  return;
                };



                Navigator.push(context, MaterialPageRoute(builder: (context) => CBTResponse(thoughts,dataKey)));
              },
              color: tertiary)
        ])
      ]),
    );
  }
}





/*   @override
    Widget build(BuildContext context){
      return Scaffold(
        body:Container(
          padding:EdgeInsets.all(50),
          child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,


         children:[
            SingleChildScrollView(
            child:Column(
              children: [
                Image.asset('assets/images/allornoth.jpg', width: getProportionateScreenWidth(70),
          height: getProportionateScreenHeight(70)),
                Image.asset("assets/images/mindreader.jpg", width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(70)),

              ],
            ),
            ),

          SingleChildScrollView(
            child:Column(
              children:[
                Image.asset('assets/images/downplayer.jpg', width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(70)),
                Image.asset('assets/images/conclusionjump.jpg', width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(70)),
              ],
            ),
          ),
          ],
         ),
        ),


      );

  }

} */