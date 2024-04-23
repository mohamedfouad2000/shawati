import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(
        1,
      ),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          Container(
            width: 57,
            height: 80,
            decoration: BoxDecoration(
                color: const Color(0xFFFE4A49),
                borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: ImageIcon(
                AssetImage(AssetsData.delete),
                color: Colors.white,
                size: 10,
              ),
            ),
          )
          // A SlidableAction can have an icon and/or a label.
          // SlidableAction(
          //   onPressed: (i) {},
          //   backgroundColor: const Color(0xFFFE4A49),
          //   foregroundColor: Colors.white,
          //   icon: Icons.delete,
          // ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.46, color: Color(0xFFF4F4F4)),
                borderRadius: BorderRadius.circular(20.59),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x11EA5A5A),
                  blurRadius: 62.86,
                  offset: Offset(14.61, 18.65),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // if (false)
                const CircleAvatar(
                  radius: 23,
                  backgroundColor: Color(0xff1FD526),
                  child: Center(
                    child: ImageIcon(
                      AssetImage(
                        // ,
                        AssetsData.notification,
                      ),
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Account Has been activated',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: StylesData.font14.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Order 100145 is Successfull by your request',
                        style: StylesData.font8,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 7),
                  child: Text(
                    // ,
                    '9:00 Pm',
                    style: StylesData.font8,
                  ),
                ),

                Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE92929),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
