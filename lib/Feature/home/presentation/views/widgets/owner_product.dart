import 'package:flutter/material.dart';
import 'package:shawati/Core/constans/const.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerProduct extends StatelessWidget {
  const OwnerProduct({
    super.key,
    required this.owner,
    required this.image,
    required this.name,
  });
  final ContactDetails owner;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   // image: AssetImage(AssetsData.testimage),
                // ),
                borderRadius: BorderRadius.all(
              Radius.circular(13),
            )),
            child: CachedImage('$xURLIMAGE$image'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
                Text(
                  LocalizationCubit.get(context).isArabic()
                      ? "المالك"
                      : "Owner",
                  style: StylesData.font10.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              launchWhatsApp(phone: owner.phone ?? '');
              // await textNumber(number: '01020400451' ?? '');
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(.4), width: .7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(AssetsData.chat),
                  color: Colors.grey,
                  size: 8,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              Uri url = Uri(scheme: "tel", path: '${owner.phone}');
              print(await canLaunchUrl(url));
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print("Can't open dial pad.");
              }
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: ConstColor.kMainColor,
                  border:
                      Border.all(color: Colors.grey.withOpacity(.4), width: .7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(AssetsData.calling),
                  color: Colors.white,
                  size: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
