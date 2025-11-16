import 'package:flutter/material.dart';
import 'date_time_selection_page.dart';
import 'car_rental_map_details_page.dart';
import 'car_rental_summary_page.dart';
import 'payment_details_page.dart';
import 'booking_review_page.dart';
import 'payment_success_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/dateTimeSelection',
      routes: {
        '/dateTimeSelection': (context) => DateTimeSelectionPage(),
        '/': (context) => CarRentalMapDetailsPage(),
        '/summary': (context) => CarRentalSummaryPage(),
        '/paymentDetails': (context) => PaymentDetailsPage(),
        '/bookingReview': (context) => BookingReviewPage(),
        '/paymentSuccess': (context) => PaymentSuccessPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}