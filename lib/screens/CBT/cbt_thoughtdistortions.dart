import 'package:flutter/material.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:arc_app/screens/CBT/cbt_response.dart';
import 'cbt_thoughts.dart';

class ThoughtDistortions extends StatelessWidget {
  final List<String> thoughts;
  ThoughtDistortions(this.thoughts, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ThoughtDistortion(thoughts),

    );
  }
}
class ThoughtDistortion extends StatefulWidget{
  final List<String> thoughts;

  const ThoughtDistortion(this.thoughts, {Key? key}) : super(key: key);

    @override
    _Distortions createState()=>_Distortions(thoughts);
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

  _Distortions(this.thoughts) {
    for (String t in thoughts) responses.add(Thought(t));
  }


  String error = '';
  Set<String> checkedDistortions = {};
 /* Set<Distortion> checkedDistortions = {};
  Set<Distortion> dist = {};
  final TextEditingController otherController = TextEditingController(); */



   bool? allornoth=false;
   bool? downplayer=false;
   bool? conclusionjump=false;
   bool? mindreader=false;
   bool? fortuneteller=false;
   bool? emotionalreas=false;
   bool? should=false;
   bool? labeler=false;
   bool? blamer=false;
   bool? catastroph=false;
   bool? personal=false;
   bool? right=false;



   Widget checkbox(String title, bool? boolValue){
     return Column(
       mainAxisAlignment:MainAxisAlignment.center,
       children:<Widget>[
         //Text(title),
         Checkbox(
           value:boolValue,
           onChanged:(bool? value) {
             setState((){
                 checkedDistortions.add(title);
                 switch (title) {
                   case "a":
                     allornoth = value;

                     break;
                   case "d":
                     downplayer = value;
                     break;
                   case "c":
                     conclusionjump = value;
                     break;
                   case "m":
                     mindreader = value;
                     break;
                   case "f":
                     fortuneteller = value;
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
                   case "b":
                     blamer = value;
                     break;
                   case "ca":
                     catastroph = value;
                     break;
                   case "p":
                     personal = value;
                     break;
                   case "r":
                     right = value;
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

         Container(
           padding: EdgeInsets.symmetric(
               horizontal: getProportionateScreenWidth(5),
               vertical: getProportionateScreenHeight(5)),
           child:ListView( children: [
             Container(
           child:
        Text(
           'Select cognitive distortions',
           style: TextStyle(
               fontSize: getProportionateScreenWidth(20),
               fontWeight: FontWeight.w600,
               color: darkestBlue),
           textAlign: TextAlign.center,

         ),),
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
                       title:Text('All Or Nothing: Looking at things in absolute, black-and-white categories'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },

                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                     child:
                  Image.asset('assets/images/allornoth.jpg', width: getProportionateScreenWidth(70),
                 height: getProportionateScreenHeight(70)), ),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('downplayer of positives: Insisting your accomplishments or strengths do not count'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/downplayer.jpg", width: getProportionateScreenWidth(70),
                 height: getProportionateScreenHeight(70)), ),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Conclusion jumper: Concluding that things are bad without good evidence'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/conclusionjump.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),

               ],
                 ),

             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
               children:<Widget>[
                 checkbox('a',allornoth),
                 checkbox('d',downplayer),
                 checkbox('c',conclusionjump),
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
                       title:Text('Mind Reader:Assuming people are reacting negatively to you without evidence'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset('assets/images/mindreader.jpg', width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Fortune Teller:Predicting that thigs will turn out badly without a good basis'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/fortuneteller.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Emotional reasoner: Reasoning from how you feel: "I feel like and idiot, so I must be the one"'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/emotionalreas.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
               ],
             ),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
               children:<Widget>[
                 checkbox('m',mindreader ),
                 checkbox('f',fortuneteller),
                 checkbox('e',emotionalreas),
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
                       title:Text('"Should" Statements: Criticizing yoursel or other people with "shoulds","musts", and "have-tos"),')
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset('assets/images/should.jpg', width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Labeler:Instead of saying, "I made a mistake," telling yourself, "I am a loser"'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/labeler.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Blamer:Blaming yourself for something you were not entirely responsible for, '
                           'or blaming on others and overlooking the ways you contributed to a problem'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/blamer.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
               ],
             ),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
               children:<Widget>[
                 checkbox('s',should),
                 checkbox('l',labeler),
                 checkbox('b',blamer),
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
                       title:Text('Catastrophizing: Thinking the worst possible outcome and neglecting to consider positive or neutral outcomes '
                           '(even though neutral outcomes might be more likely)'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset('assets/images/catastroph.jpg', width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Personalization: Seeing yourself as the cause of something you did not cause'),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/personal.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),
                 GestureDetector(
                   onTap:(){
                     AlertDialog alert=AlertDialog(
                       title:Text('Right '),
                     );
                     showDialog(
                       context:context,
                       builder:(BuildContext context){
                         return alert;
                       },
                     );
                   },
                   child:
                 Image.asset("assets/images/right.jpg", width: getProportionateScreenWidth(70),
                     height: getProportionateScreenHeight(70)),),


               ],
             ),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
               children:<Widget>[
                 checkbox('ca',catastroph),
                 checkbox('p',personal),
                 checkbox('r',right),
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
               iconSize: 36,
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
               iconSize: 36,
               icon: Icon(Icons.arrow_forward_ios),
               onPressed: () {
                 if (checkedDistortions.isEmpty) {
                   error = 'Please select corresponding distortions';
                   setState(() {});
                   return;
                 };

                 Navigator.push(context, MaterialPageRoute(builder: (context) => CBTResponse(thoughts)));
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