import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/theming/fonts.dart';

class PercentsWidget extends StatelessWidget {
  const PercentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularPercentIndicator(
            arcType: ArcType.FULL,
            arcBackgroundColor: Colors.transparent,
            radius: 50.0,
            lineWidth: 12.0,
            percent: 1.0,
            center: new Text("100%",style: AppFont.font18BoldWhite,),
            footer: new Text("Bills",style: AppFont.font18BoldWhite,),
            progressColor: Colors.green,
          ),
          CircularPercentIndicator(
            arcType: ArcType.FULL,
            arcBackgroundColor: Colors.transparent,
            radius: 50.0,
            lineWidth: 12.0,
            percent: 0.25,
            center: new Text("25%",style: AppFont.font18BoldWhite,),
            footer: new Text("Internet",style: AppFont.font18BoldWhite,),
            progressColor: Colors.yellow,
          ),
          CircularPercentIndicator(
            arcType: ArcType.FULL,
            arcBackgroundColor: Colors.transparent,
            radius: 50.0,
            lineWidth: 12.0,
            percent: 0.7,
            center: new Text("70%",style: AppFont.font18BoldWhite,),
            footer: new Text("Bills",style: AppFont.font18BoldWhite,),
            progressColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
