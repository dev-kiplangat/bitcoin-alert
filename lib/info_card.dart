import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;

  const InfoCard({
    Key? key,
    required this.title,
    required this.effectedNum,
    required this.iconColor,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
            width: 220,
            margin: EdgeInsets.only(
              right: 20,
              bottom: 30,
            ),
            // here the contraints provides us with the maximum width for widget
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 53,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: iconColor.withOpacity(0.12),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/vectors/run.svg',
                            height: 12,
                            width: 12,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: kTextColor),
                                children: [
                              TextSpan(
                                  text: "$effectedNum \n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "People",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 2,
                                  ))
                            ])),
                      ),
                      Expanded(
                        child: LineReportChart(),
                      )
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
