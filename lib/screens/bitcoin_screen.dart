import 'dart:io';

import 'package:bitcoin/common_widget/widget.dart';
import 'package:bitcoin/screens/bitcoin_controller.dart';
import 'package:bitcoin/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/assets.dart';

class Bitcoin extends StatefulWidget {
  const Bitcoin({Key? key}) : super(key: key);

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BitcoinController>(builder: (cont)
    {
      return WillPopScope(
        onWillPop: () async {
          return exit(0);
        },
        child: Scaffold(
          backgroundColor: primaryColor,
          body:
          cont.isLoading ? buildCircularIndicator():
          Column(
            children: [
              Image.asset(Assets.splashLogo),
              buildTextRegularWidget(cont.bitcoinList[cont.rateIndex].rate.toString(), orangeColor, context, 24.0,align: TextAlign.center),
              const Spacer(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: SizedBox(
                      height: 100.0,width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          ListWheelScrollView.useDelegate(
                              itemExtent: 40,
                              perspective: 0.01,
                              diameterRatio: 2.0,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: cont.bitcoinList.length,
                                builder: (context, index) {
                                  return buildTextRegularWidget(cont.bitcoinList[index].code.toString(),
                                      cont.rateIndex==index?blackColor:lightBlack, context, 18.0);
                                },
                              ),

                            onSelectedItemChanged: (val){
                                cont.onScrollChange(val);
                            },
                          ),
                          Column(
                            children: const [
                              SizedBox(height: 15.0,),
                              Divider(color: lightBlack,thickness: 0.3,),
                              SizedBox(height: 20.0,),
                              Divider(color: lightBlack,thickness: 0.3,),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
              )
            ],
          )),
      );
    }
    );}
}
