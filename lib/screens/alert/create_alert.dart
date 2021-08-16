import 'package:Rook/components/constants.dart';
import 'package:Rook/config/alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

import 'components/currencySelect.dart';

class AlertObj {
  final String name;
  final String limit;
  final String currency;
  final String frequency;

  const AlertObj(this.name, this.limit, this.currency, this.frequency,
      {Key? key});
}

class CreateAlert extends StatefulWidget {
  const CreateAlert({Key? key}) : super(key: key);

  @override
  _CreateAlertState createState() => _CreateAlertState();
}

class _CreateAlertState extends State<CreateAlert> {
  var error = "";

  final Map alertInfo = {
    "limit": "",
    "frequency": 'ONCE',
    "currency": "",
    "title": "selth",
  };

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'ONCE',
      'label': '     ONE TIME',
      'icon': Icon(Icons.repeat_one),
    },
    {
      'value': 'PERISTENT',
      'label': '    PERISTENT',
      'icon': Icon(Icons.repeat),
    },
  ];

  abyss({key, value}) {
    setState(() {
      alertInfo[key] = value;
    });
  }

  Widget customSelect() {
    return SelectFormField(
        type: SelectFormFieldType.dropdown,
        dialogCancelBtn: "close",
        enableInteractiveSelection: true,

        // or can be dialog
        initialValue: alertInfo['frequency'],
        icon: Icon(Icons.repeat),
        labelText: '     SELECT FREQUENCY',
        items: _items,
        onChanged: (val) {
          abyss(key: 'frequency', value: val);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: kTextMediumColor,
        ),
        title: Text(
          'Create Alert',
          style: TextStyle(
            color: kTextMediumColor,
            fontSize: 17,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // FocusScope.of(context).unfocus();
          // new TextEditingController().clear();
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Enter Amount",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 60,
                    bottom: 20,
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        buildTextForm(),
                        SizedBox(
                          height: 10,
                        ),
                        if (error != "")
                          Row(
                            children: [
                              Icon(
                                Icons.error,
                                color: Colors.red[300],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                  color: Colors.red[300],
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CoinSelector(feeder: (callback) {
                  abyss(key: 'currency', value: callback);
                }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alert Frequency",
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: customSelect(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: submitBtn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton submitBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red[300],
        enableFeedback: true,
        padding: EdgeInsets.symmetric(
          vertical: 18,
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Provider.of<AlertsModel>(context, listen: false)
            .publishAlert(alertInfo);
      },
      autofocus: true,
      child: Text(
        "Create Alert",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  validator(value) {
    if (value == 0 || value!.isEmpty) {
      setState(() {
        error = "Cannot be blank";
      });
    }
    return null;
  }

  TextFormField buildTextForm() {
    return TextFormField(
      onChanged: (val) {
        print(val);
        abyss(key: 'limit', value: val);
      },
      validator: (val) => validator(val),
      maxLength: 16,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        hintText: "0.00",
        alignLabelWithHint: true,
        enabled: true,
        labelStyle: TextStyle(
          textBaseline: TextBaseline.ideographic,
        ),
        prefixText: "\$",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
        ),
      ),
    );
  }
}

class CoinSelector extends StatelessWidget {
  final Function feeder;
  const CoinSelector({
    Key? key,
    required this.feeder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Coin",
            style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SelectCoins(callback: feeder),
        ],
      ),
    );
  }
}
