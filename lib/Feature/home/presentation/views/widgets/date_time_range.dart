import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/styles.dart';

class DateTimeSchedleRange extends StatefulWidget {
  const DateTimeSchedleRange({
    super.key,
    required this.from,
  });
  final String from;

  @override
  State<DateTimeSchedleRange> createState() => _DateTimeSchedleRangeState();
}

class _DateTimeSchedleRangeState extends State<DateTimeSchedleRange> {
  late final FixedExtentScrollController _controller;
  List fruitNames = [];
  @override
  void initState() {
    for (int i = 0; i < widget.from.split(',').length; i++) {
      try {
        //dd-MM-yyyy
        var x = widget.from
            .split(',')[i]
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll('"', '')
            .replaceAll('\\', '');
        fruitNames.add(x);

        print(fruitNames[i]);
      } catch (e) {}
    }
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoPicker(
        scrollController: _controller,
        backgroundColor: Colors.white,
        itemExtent: 30.0,
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        children: [
          for (final item in fruitNames)
            Center(
                child: Text(
              '$item',
              style: StylesData.font20.copyWith(color: Colors.blue),
            )),
        ],
        onSelectedItemChanged: (i) {},
      ),
    );
  }
}
