import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/faliure_wid.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/ServesPrices%20Cubit/serves_prices_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/amount_payment.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/custom_add_image.dart';

import 'package:shawati/generated/l10n.dart';

class PaymentScreenBody extends StatefulWidget {
  const PaymentScreenBody(
      {super.key,
      required this.bookingId,
      required this.serid,
      required this.startAt,
      required this.endAt,
      required this.attachment,
      required this.coupon});
  final int bookingId;
  final int serid;
  final String startAt;
  final String endAt;
  final String attachment;
  final String coupon;

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
          if (state is AddAttachMentSucc) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).Successfull
                    : state.txt);
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is AddAttachMentError) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).oppsMessage
                    : state.msg);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
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
                  BlocProvider(
                    create: (context) => ServesPricesCubit(HomeRepoImpl())
                      ..getServesPrices(
                        bookingId: widget.bookingId,
                        coupon: widget.coupon,
                        serid: widget.serid,
                        startAt: widget.startAt,
                        endAt: widget.endAt,
                      ),
                    child: AmountPayment(
                      fromBooking: true,
                      id: widget.serid,
                      start: widget.startAt,
                      end: widget.endAt,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.attachment != '')
                    Text(
                      S.of(context).lastPayment,
                      style: StylesData.font14,
                    ),
                  if (widget.attachment != '')
                    const SizedBox(
                      height: 10,
                    ),
                  if (widget.attachment != '')
                    InkWell(
                      onTap: () async {
                        launchURL('$xURLIMAGE${widget.attachment}');
                      },
                      child: Container(
                        width: double.infinity,
                        // height: 70.82,
                        padding: const EdgeInsets.all(15.92),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAECF0)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 15.5,

                              // backgroundColor: ConstColor.kMainColor,
                              backgroundImage: AssetImage(AssetsData.pdf),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(widget.attachment ?? '',
                                maxLines: 1, style: StylesData.font11),
                            // const SizedBox(
                            //   width: 16,
                            // ),
                            // Container(
                            //   width: 30,
                            //   height: 31,
                            //   padding: const EdgeInsets.only(
                            //     top: 9.53,
                            //     left: 8.80,
                            //     right: 9.26,
                            //     bottom: 9.53,
                            //   ),
                            //   clipBehavior: Clip.antiAlias,
                            //   decoration: ShapeDecoration(
                            //     color: Colors.white,
                            //     shape: RoundedRectangleBorder(
                            //       side: const BorderSide(
                            //           width: 1, color: Color(0xFFEAECF0)),
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //   ),
                            //   child: const Center(
                            //       child: Icon(
                            //     Icons.remove_red_eye,
                            //     size: 11,
                            //   )),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 13,
                  ),

                  // const PaymentMethod(),

                  Builder(builder: (context) {
                    if (BookingCubit.get(context).model != null) {
                      // value = state.model.data![0].id.toString();
                      return Column(
                        children: [
                          Column(
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
                                          alignment:
                                              AlignmentDirectional.centerStart,
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
                                                    '$xURLIMAGE${item.image}' ??
                                                        '',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text((LocalizationCubit.get(
                                                                  context)
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
                                    getuserprofile(i: ImageSource.gallery);
                                  },
                                  child: file == null
                                      ? const CustomAddImage()
                                      : Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                              // AmountPayment(
                              //     id: widget.id,
                              //     start: widget.start,
                              //     end: widget.end),
                              // const Spacer(),
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
                            ],
                          ),
                          defaultButton(
                              fun: () {
                                // print(
                                // 'id is ${widget.id} and start is ${widget.start} and end is ${widget.end} and payment method is $value');
                                if (value != null && file != null) {
                                  BlocProvider.of<BookingCubit>(context)
                                      .paymentMethodsUpload(
                                          bookingId: widget.bookingId,
                                          paymentMethodId: int.parse(
                                              value.toString() ?? '0'),
                                          image: file!);
                                } else {
                                  setState(() {
                                    errormsq = S.of(context).eroor500;
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
                              textWidget: state is AddAttachMentLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      S.of(context).Payment,
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
            ),
          );
        },
      ),
    );
  }
}
