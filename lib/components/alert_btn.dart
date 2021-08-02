import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/screens/create_alert.dart';
import 'package:crypto_tracker/screens/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAlertButton extends StatelessWidget {
  const CustomAlertButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateAlert();
              },
            ),
          );
        },
        child: Container(
          height: 100,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .22,
                  top: 1,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(.05),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Set Price Alert\n",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextSpan(
                            text:
                                "When the Price goes up or down \nyou will get notified",
                            style: TextStyle(color: kTextMediumColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Positioned(
                left: 8,
                top: 17,
                child: SvgPicture.asset(
                  'assets/vectors/update.svg',
                  height: 70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
