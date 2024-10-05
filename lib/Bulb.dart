import 'package:changenotifier/supplies/co%C4%B1lors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SwitchButton.dart';
import 'notifcontroller.dart';

class Bulb extends StatelessWidget{
  Bulb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBlueColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Activity A', style: TextStyle(color: Colors.white),),
          Text('(Room 1)', style: TextStyle(color: AppColor.purple),),
          Expanded(child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Bulb',style: TextStyle(color: AppColor.appBlueColor,fontSize: 25),),
                  Switch(
                    value: Provider.of<NotifManager>(context,listen: true).switchValue,
                    onChanged: (value){},
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ControlButton()));
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        side: BorderSide(
                          width: 1,
                          color: Colors.white
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set the desired border radius here
                        ),
                      ),
                      child: Text('Go to second room',style: TextStyle(color: Colors.white),))
                ],
              )
            ),

          ))


        ],
      ),
    );
  }


}