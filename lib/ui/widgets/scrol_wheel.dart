import 'package:flutter/material.dart';

import 'scorll_wheel_number.dart';

class ScrollWheel extends StatefulWidget {
  final int pos;
  final ValueChanged <Map>update;

  const ScrollWheel({Key? key , this.pos=0, required this.update}) : super(key: key);

  @override
  State<ScrollWheel> createState() => _ScrollWheelState();
}

class _ScrollWheelState extends State<ScrollWheel> {  
  late FixedExtentScrollController _controller;
  int selectedNumber = 0;
  


  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 70,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 40,
        perspective: 0.001,
        diameterRatio: 0.9,
        useMagnifier: true,
        magnification: 1.3,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
              setState(() {
                selectedNumber = index;
              });
              widget.update({'number':index.toString(),'pos':widget.pos});
            },
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List<Widget>.generate(
            10,
            (index) => ScrolWheelNumber(
              number: index.toString(),
              selectedColor: selectedNumber == index? Colors.white: const Color.fromARGB(153, 255, 255, 255) ,
            ), 
          ),
        ),
      ),
    );
  }
}
