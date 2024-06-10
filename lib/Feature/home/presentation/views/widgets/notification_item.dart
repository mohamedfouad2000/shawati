import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/notification_model/datum.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_details_with_id_screen.dart';
// import 'package:shawati/Feature/home/presentation/views/screens/requests_screen.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.data,
  });

  final DatumNotif data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateWithAnimation(
            Get.context!,
            BookingDetailsScreenWithId(
              id: int.parse(data.modelId.toString()) ?? 0,
            ));
      },
      child: Stack(
        alignment: LocalizationCubit.get(context).isArabic()
            ? Alignment.bottomLeft
            : Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        LocalizationCubit.get(context).isArabic()
                            ? data.titleAr ?? ''
                            : data.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: StylesData.font14.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        LocalizationCubit.get(context).isArabic()
                            ? data.bodyAr ?? ''
                            : data.body ?? '',
                        style: StylesData.font8,
                      ),
                    ],
                  ),
                ),

                if (data.seen == 0)
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
          Padding(
            padding:
                const EdgeInsets.only(top: 7, right: 7, left: 7, bottom: 7),
            child: Text(
              // ,
              data.createdAt.toString().substring(0, 10) ?? '',
              style: StylesData.font8,
            ),
          ),
        ],
      ),
    );
  }
}
