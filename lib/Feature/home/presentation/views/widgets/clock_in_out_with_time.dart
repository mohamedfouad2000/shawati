import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/generated/l10n.dart';

class ClockInOutWithTime extends StatefulWidget {
  const ClockInOutWithTime({
    super.key,
    required this.clockin,
    required this.clockout,
  });
  final String clockin;
  final String clockout;

  @override
  State<ClockInOutWithTime> createState() => _ClockInOutWithTimeState();
}

class _ClockInOutWithTimeState extends State<ClockInOutWithTime> {
  String start = '';
  String end = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      start = widget.clockin
          .split(',')
          .first
          .replaceAll('[', '')
          .replaceAll('"', '')
          .replaceAll(']', '')
          .replaceAll('\\', '')
          .trim()
          .substring(0, 10);
      end = widget.clockout
          .split(',')
          .last
          .replaceAll('[', '')
          .replaceAll('"', '')
          .replaceAll(']', '')
          .replaceAll('\\', '')
          .trim()
          .substring(0, 10);
    } catch (e) {
      // start = widget.clockin
      //     .replaceAll('[', '')
      //     .replaceAll('"', '')
      //     .replaceAll(']', '')
      //     .replaceAll('\\', '')
      //     .trim();
      // end = widget.clockin
      //     .replaceAll('[', '')
      //     .replaceAll('"', '')
      //     .replaceAll(']', '')
      //     .replaceAll('\\', '')
      //     .trim();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageIcon(
                    const AssetImage(
                      AssetsData.note,
                    ),
                    color: ConstColor.kMainColor,
                    size: 15,
                  ),
                  Text(
                    S.of(context).ClockIn,
                    style: StylesData.font9.copyWith(
                        color: const Color(0xffABABAB),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.clockin.isNotEmpty && widget.clockin != ''
                    ? (start.substring(0, 10))
                    : '',
                style: StylesData.font11.copyWith(color: Colors.black),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsData.clock,
                  ),
                  color: ConstColor.kMainColor,
                  size: 15,
                ),
                Text(
                  S.of(context).ClockOut,
                  style: StylesData.font9.copyWith(
                      color: const Color(0xffABABAB),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.clockout.isNotEmpty && widget.clockout != ''
                  ? end.substring(0, 10)
                  : '',
              style: StylesData.font11.copyWith(color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}
