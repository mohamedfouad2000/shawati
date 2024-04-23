import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment methods",
          style: StylesData.font18,
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              x = 0;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: const Color(0xffE9F0FF),
              borderRadius: BorderRadius.circular(15),
              // color: const Color(0xffE9F0FF),
              border: Border.all(
                  color: x == 0 ? ConstColor.kMainColor : Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsData.mastar),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 5967',
                        style: StylesData.font13.copyWith(color: Colors.black),
                      ),
                      Text(
                        'Expires 09/25',
                        style: StylesData.font10.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                if (x == 0)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: ConstColor.kMainColor,
                        border: Border.all(
                            color: Colors.grey.withOpacity(.4), width: .7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        )),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 15),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              x = 1;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: const Color(0xffE9F0FF),
              borderRadius: BorderRadius.circular(15),
              // color: const Color(0xffE9F0FF),
              border: Border.all(
                  color: x == 1 ? ConstColor.kMainColor : Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsData.visa),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 7539',
                        style: StylesData.font13.copyWith(color: Colors.black),
                      ),
                      Text(
                        'Expires 09/25',
                        style: StylesData.font10.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                if (x == 1)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: ConstColor.kMainColor,
                        border: Border.all(
                            color: Colors.grey.withOpacity(.4), width: .7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        )),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 15),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              x = 2;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: const Color(0xffE9F0FF),
              borderRadius: BorderRadius.circular(15),
              // color: const Color(0xffE9F0FF),
              border: Border.all(
                  color: x == 2 ? ConstColor.kMainColor : Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsData.paypal),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'freeslab88@gmail.com',
                    style: StylesData.font13.copyWith(color: Colors.black),
                  ),
                ),
                if (x == 2)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: ConstColor.kMainColor,
                        border: Border.all(
                            color: Colors.grey.withOpacity(.4), width: .7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        )),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 15),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
