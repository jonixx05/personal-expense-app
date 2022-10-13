import 'package:flutter/material.dart';

class ChartsBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartsBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      //Contraints defines how much space a widget may take
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Constraints.maxHeight *
                0.15, //takes 15% of the parent container
            child: FittedBox(
              child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
            ),
          ),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
            //enables this container to take up 60% of its parent widget (Container)
            height: Constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  //allows us to create a box that is sized as a fraction of another value
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          //fittedbox streks its element to take up the available space given to it
          Container(
            height: Constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
