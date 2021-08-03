
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cbt_thoughts.dart';

class TIPPSkills extends StatelessWidget
{
  Set<String> sensationNames;
  String dataKey;

  TIPPSkills(this.dataKey,this.sensationNames,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: TextButton(child: Text('CONTINUE'), onPressed: (){
      Navigator.pop(context);
      Navigator.push( context,MaterialPageRoute(builder: (context) => CBTThoughts(dataKey)));
    },),);
  }

}