import 'package:flutter/foundation.dart';
import 'meal.dart';
import 'service.dart';

class Booking {
  final int? id;
  final String brideName;
  final String bridegroomName;
  final String bridegroomNumber;
  final int childrenWithoutInvite;
  final int guestsWithoutInvite;
  final Meal meal;
  final List<Service> services;
  final int manualPrice;
  final int totalGuests;
  final DateTime weddingDate;
  final DateTime bookingTime;

  Booking({
    this.id,
    required this.brideName,
    required this.bridegroomName,
    required this.bridegroomNumber,
    required this.childrenWithoutInvite,
    required this.guestsWithoutInvite,
    required this.meal,
    required this.services,
    required this.manualPrice,
    required this.totalGuests,
    required this.weddingDate,
    required this.bookingTime,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'bride_name': brideName,
    'bridegroom_name': bridegroomName,
    'bridegroom_number': bridegroomNumber,
    'children_without_invite': childrenWithoutInvite,
    'guests_without_invite': guestsWithoutInvite,
    'meal_id': meal.id,
    'manual_price': manualPrice,
    'total_guests': totalGuests,
    'wedding_date': weddingDate.toIso8601String(),
    'booking_time': bookingTime.toIso8601String(),
  };

  factory Booking.fromMap(Map<String, dynamic> map) => Booking(
    id: map['id'] as int?,
    brideName: map['bride_name'] as String,
    bridegroomName: map['bridegroom_name'] as String,
    bridegroomNumber: map['bridegroom_number'] as String,
    childrenWithoutInvite: map['children_without_invite'] as int,
    guestsWithoutInvite: map['guests_without_invite'] as int,
    meal: map['meal'] as Meal,
    services: (map['services'] as List<dynamic>).cast<Service>(),
    manualPrice: map['manual_price'] as int,
    totalGuests: map['total_guests'] as int,
    weddingDate: DateTime.parse(map['wedding_date'] as String),
    bookingTime: DateTime.parse(map['booking_time'] as String),
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Booking &&
      other.id == id &&
      other.brideName == brideName &&
      other.bridegroomName == bridegroomName &&
      other.bridegroomNumber == bridegroomNumber &&
      other.childrenWithoutInvite == childrenWithoutInvite &&
      other.guestsWithoutInvite == guestsWithoutInvite &&
      other.meal == meal &&
      listEquals(other.services, services) &&
      other.manualPrice == manualPrice &&
      other.totalGuests == totalGuests &&
      other.weddingDate == weddingDate &&
      other.bookingTime == bookingTime;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      brideName,
      bridegroomName,
      bridegroomNumber,
      childrenWithoutInvite,
      guestsWithoutInvite,
      meal,
      Object.hashAll(services),
      manualPrice,
      totalGuests,
      weddingDate,
      bookingTime,
    );
  }
}