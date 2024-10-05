import 'package:changenotifier/supplies/co%C4%B1lors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bulb.dart';
import 'notifcontroller.dart';

class ControlButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body:  Column(
          children: [
            SizedBox(height: 50,),
            Text('Activity B', style: TextStyle(color: Colors.white),),
            Text('(Room 2)', style: TextStyle(color: AppColor.purple),),
            Expanded(child: Center(
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Switch Button',style: TextStyle(color: AppColor.appBlueColor,fontSize: 25),),
                    ElevatedButton(onPressed: () async{
                      await Provider.of<NotifManager>(context,listen: false).turnOnOffBulb();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Bulb()));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(Provider.of<NotifManager>(context,listen: false).switchValue?'The bulb will be turned off':'The bulb will be turned on'),


                          // You can customize the SnackBar appearance here
                        ),
                      );

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
                        child: Text('Turn On/Off The Bulb',style: TextStyle(color: Colors.white),))
                  ]
              ),
            )),
          ]

      ),
    );

  }

}