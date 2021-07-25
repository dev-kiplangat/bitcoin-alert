import 'package:crypto_tracker/constants.dart';
import 'package:crypto_tracker/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildDetailsBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitleWithMoreIcon(),
                    SizedBox(
                      height: 10,
                    ),
                    buildCaseNumber(context),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                        color: kTextMediumColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    WeeklyChart(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoTextWithPercentage(
                          title: "From Last Week",
                          percentage: "6.43",
                        ),
                        buildInfoTextWithPercentage(
                          title: "Recovery Rate",
                          percentage: "9.8",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(.03),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Global Map"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    SizedBox(height: 0),
                    SvgPicture.asset(
                      'assets/vectors/world.svg',
                      height: 160,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$percentage%\n",
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
          ),
        ),
        TextSpan(
          text: "$title",
          style: TextStyle(
            color: kTextMediumColor,
            height: 1.2,
          ),
        ),
      ]),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547 ",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: kPrimaryColor,
                height: 1.2,
              ),
        ),
        Text(
          " 5.8% ",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        Icon(
          Icons.arrow_upward,
          color: kPrimaryColor,
        )
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New Cases",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
  }

  AppBar buildDetailsBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: kPrimaryColor,
            ))
      ],
    );
  }
}
