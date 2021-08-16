import 'package:Rook/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventionInfoCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionInfoCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset('assets/vectors/$svgSrc', height: 80, width: 80),
      SizedBox(
        height: 10,
      ),
      Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kPrimaryColor.withOpacity(.6))),
    ]);
  }
}

class BuildHelpCard extends StatelessWidget {
  const BuildHelpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
                height: 130,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .4,
                  top: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF60BE93),
                    Color(0xFF1B8D59),
                  ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Dial 999 for \nMedical Help!\n\n",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: "If any simptoms appear",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                  ]),
                )),
            Positioned(
              left: -12,
              top: -3,
              child: SvgPicture.asset(
                "assets/vectors/doctors.svg",
                height: 130,
              ),
            ),
          ],
        ));
  }
}
