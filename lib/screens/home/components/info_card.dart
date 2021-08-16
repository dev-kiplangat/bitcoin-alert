import 'package:Rook/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Function press;
  final String icon;
  final String currency;
  final String price;

  const InfoCard({
    Key? key,
    required this.title,
    required this.price,
    required this.press,
    required this.icon,
    required this.currency,
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
            constraints: BoxConstraints.tightFor(
              width: 220,
            ),
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
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/$icon',
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "$title\n",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kTextMediumColor,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: "$currency",
                              style: TextStyle(
                                color: kTextMediumColor.withOpacity(.7),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 40,
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "current value",
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              "\$ $price",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
