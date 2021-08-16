import 'package:Rook/components/constants.dart';
import 'package:flutter/material.dart';

class IconedStats extends StatelessWidget {
  final String blocks;
  final String transactions;
  final String hodlingAddresses;
  final String outputs;

  const IconedStats({
    Key? key,
    required this.blocks,
    required this.transactions,
    required this.hodlingAddresses,
    required this.outputs,
  }) : super(key: key);

  Padding infoIcons(String title, String value, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(.09),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/$image',
                height: 38,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(title),
          Text(
            value,
            style: TextStyle(color: kPrimaryColor),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 10,
        spacing: 40,
        children: [
          infoIcons("Blocks", blocks, "square-blocks-outline.png"),
          infoIcons("Transactions", transactions, "arrow.png"),
          infoIcons("Outputs", outputs, "left-arrow.png"),
          infoIcons("Addresses", hodlingAddresses, "wallet.png"),
        ],
      ),
    );
  }
}
