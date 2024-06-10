import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/ServesPrices%20Cubit/serves_prices_cubit.dart';
import 'package:shawati/generated/l10n.dart';

class AmountPayment extends StatelessWidget {
  const AmountPayment({
    super.key,
    required this.id,
    required this.start,
    required this.end,
    required this.fromBooking,
  });
  final int id;
  final String start;
  final String end;
  final bool fromBooking;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServesPricesCubit, ServesPricesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ServesPricesSucc) {
          if (state.servesPrices.data?.unAvaliableDays != null) {
            return Text(
                style: StylesData.font13.copyWith(color: Colors.red),
                "${S.of(context).InvalidDays} ${state.servesPrices.data?.unAvaliableDays?.length}");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).BookingDetails,
                style: StylesData.font18,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    '${S.of(context).eventdays} : ${state.servesPrices.data?.totalEventDays} ${S.of(context).day}',
                    style: StylesData.font11
                        .copyWith(color: const Color(0xff7A7A7A)),
                  )),
                  Text(
                    '${state.servesPrices.data?.eventDaysPrices} ${S.of(context).SAR}',
                    style: StylesData.font11.copyWith(
                        color: const Color(0xff222B45),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    '${S.of(context).normaldays} : ${state.servesPrices.data?.totalNormalDays} ${S.of(context).day}',
                    style: StylesData.font11
                        .copyWith(color: const Color(0xff7A7A7A)),
                  )),
                  Text(
                    '${((state.servesPrices.data?.total!)! - (state.servesPrices.data!.eventDaysPrices!))} ${S.of(context).SAR}',
                    style: StylesData.font11.copyWith(
                        color: const Color(0xff222B45),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    '${S.of(context).Total} :',
                    style: StylesData.font11
                        .copyWith(color: const Color(0xff7A7A7A)),
                  )),
                  Text(
                    '${state.servesPrices.data?.total.toString()} ${S.of(context).SAR}',
                    style: StylesData.font11.copyWith(
                        color: const Color(0xff222B45),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (state.servesPrices.data?.totalAfterApplyCoupon != null &&
                  !fromBooking)
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      '${S.of(context).TotalAfterCopon} :',
                      style: StylesData.font11
                          .copyWith(color: const Color(0xff7A7A7A)),
                    )),
                    Text(
                      '${state.servesPrices.data?.totalAfterApplyCoupon ?? ''}${state.servesPrices.data?.totalAfterApplyCoupon is int ? S.of(context).SAR : ''}',
                      style: StylesData.font11.copyWith(
                          color: const Color(0xff222B45),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              if (fromBooking &&
                  state.servesPrices.data?.totalAfterApplyCoupon is int)
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      '${S.of(context).TotalAfterCopon} :',
                      style: StylesData.font11
                          .copyWith(color: const Color(0xff7A7A7A)),
                    )),
                    Text(
                      '${state.servesPrices.data?.totalAfterApplyCoupon ?? ''}${state.servesPrices.data?.totalAfterApplyCoupon is int ? S.of(context).SAR : ''}',
                      style: StylesData.font11.copyWith(
                          color: const Color(0xff222B45),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
            ],
          );
        } else if (state is ServesPricesError) {
          return Center(
            child: Text(state.msg),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
