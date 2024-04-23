import 'package:flutter/cupertino.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_payment_method.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/google_map.dart';

class BookingDetailsScreenBody extends StatelessWidget {
  const BookingDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BookingProduct(),
            SizedBox(
              height: 15,
            ),
            BookingPaymentMethod(),
            SizedBox(
              height: 15,
            ),
            CalendarDetails(),
            SizedBox(
              height: 15,
            ),
            GoogleMapWidget(),
          ],
        ),
      ),
    );
  }
}
