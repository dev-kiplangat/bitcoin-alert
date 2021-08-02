import 'package:crypto_tracker/constants.dart';
import 'package:flutter/material.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {},
        ),
        title: Text("Set Security PIN"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          children: [
            Text(
              "We will require this password whenever you want to access this app",
              style: TextStyle(
                fontSize: 20,
                color: kTextMediumColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
