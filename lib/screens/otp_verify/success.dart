import 'package:Rook/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Rook/components/constants.dart';
import 'package:Rook/config/market.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  late final localstate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    (() async {
      await Market().fetchCurrency();
      _finish(localstate);
    })();
  }

  void _finish(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    localstate = context;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/vectors/success.svg',
              height: 200,
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Verification Complete!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: kTextMediumColor,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Consumer<Market>(builder: (context, market, child) {
              if (market.loading == true)
                return SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.yellow[200],
                  ),
                );
              else
                return Container();
            })
          ],
        ),
      ),
    );
  }
}
