import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/faliure_wid.dart';
import 'package:shawati/Feature/home/data/model/payment_model/datum.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/amount_payment.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/custom_add_image.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/pay_now.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/payment_method.dart';
import 'package:shawati/generated/l10n.dart';

class PaymentScreenBody extends StatefulWidget {
  const PaymentScreenBody(
      {super.key, required this.id, required this.start, required this.end});
  final int id;
  final String start;
  final String end;

  @override
  State<PaymentScreenBody> createState() => _PaymentScreenBodyState();
}

class _PaymentScreenBodyState extends State<PaymentScreenBody> {
  File? file;
  ImagePicker picker = ImagePicker();
  Future<void> getuserprofile({required ImageSource i}) async {
    // emit(getuserprofileLoading());
    var pickedfile = await picker.pickImage(source: i);
    if (pickedfile != null) {
      setState(() {
        file = File(pickedfile.path);
      });
      print(pickedfile.path);
    } else {
      print("No Image");
    }
  }

  bool x = false;
  String? value;
  String errormsq = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(HomeRepoImpl())..getPaymentMethod(),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is ADDBookingSucc) {
            showToast(msq: state.msq);
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is ADDBookingError) {
            showToast(msq: state.msg);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Payment,
                  style: StylesData.font24Google,
                ),
                const SizedBox(
                  height: 20,
                ),
                // const PaymentMethod(),

                Builder(builder: (context) {
                  if (BookingCubit.get(context).model != null) {
                    // value = state.model.data![0].id.toString();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Choose_The_Payment_Method,
                        ),
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButton<String>(
                                    underline: const SizedBox(),
                                    value: value,
                                    alignment: AlignmentDirectional.centerStart,
                                    isExpanded: true,
                                    hint: Text(S
                                        .of(context)
                                        .Choose_The_Payment_Method),
                                    onChanged: (String? selecteddata) {
                                      setState(() {
                                        value = selecteddata;
                                      });
                                      setState(() {});
                                    },
                                    items: BookingCubit.get(context)
                                        .model
                                        ?.data
                                        ?.map((item) {
                                      return DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              '$xURLIMAGE${item.image}' ?? '',
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(width: 10),
                                            Text((LocalizationCubit.get(context)
                                                        .isArabic()
                                                    ? item.nameAr
                                                    : item.name) ??
                                                ''),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                        Text(
                          S.of(context).Upload_your_payment_screen_here,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () {
                              var x = AlertDialog(
                                surfaceTintColor: Colors.white,
                                title: Text(
                                  S.of(context).ChooseYourPhoto,
                                ),
                                content: SizedBox(
                                  height: 140,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: double.infinity,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          child: TextButton.icon(
                                              label: Text(
                                                S.of(context).Gallary,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () async {
                                                getuserprofile(
                                                    i: ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.storage_outlined,
                                                color: Colors.black,
                                              ))),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          height: 50,
                                          width: double.infinity,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          child: TextButton.icon(
                                              label: Text(
                                                S.of(context).camera,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () {
                                                getuserprofile(
                                                    i: ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.black,
                                              ))),
                                    ],
                                  ),
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return x;
                                  });
                            },
                            child: file == null
                                ? const CustomAddImage()
                                : Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.file(file!),
                                        ),
                                      ],
                                    ),
                                  )),
                        const SizedBox(
                          height: 15,
                        ),

                        // const Expanded(child: AmountPayment()),

                        if (errormsq != '')
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Center(
                                child: Text(
                              errormsq,
                              style: StylesData.font14
                                  .copyWith(color: Colors.white),
                            )),
                          ),
                        if (errormsq != '')
                          const SizedBox(
                            height: 20,
                          ),
                        defaultButton(
                            fun: () {
                              print(
                                  'id is ${widget.id} and start is ${widget.start} and end is ${widget.end} and payment method is $value');
                              if (value != null && file != null) {
                                BlocProvider.of<BookingCubit>(context)
                                    .addBooking(
                                        id: widget.id,
                                        start: widget.start,
                                        image: file!,
                                        paymentMethod: value ?? '',
                                        end: widget.end);
                              } else {
                                setState(() {
                                  errormsq =
                                      'Please select payment method and upload payment screen';
                                });
                              }

                              // showModalBottomSheet(
                              //     context: context,
                              //     useSafeArea: true,
                              //     showDragHandle: true,
                              //     isScrollControlled: true,
                              //     shape: const RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.vertical(
                              //           top: Radius.circular(25.0)),
                              //     ),
                              //     builder: (BuildContext context) {
                              //       return const PayNowSheet();
                              //       // return your layout
                              //     });
                            },
                            textWidget: state is ADDBookingLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Pay now',
                                    style: StylesData.font13,
                                  ),
                            height: 54,
                            c: ConstColor.kMainColor),
                      ],
                    );
                  } else if (state is GetPaymentError) {
                    return const FailureWidget();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
