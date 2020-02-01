import 'Activity.dart';

class Destination
{
  final String imageUrl;
  final String city;
  final String country;
  final String description;
  final List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities
  });
}

final List<Activity> activities = [
  Activity(
    imageUrl: "assets/images/stmarksbasilica.jpg",
    name: "St. Mark's Basilica",
    type: "Sightseeing tour",
    startTimes: ["09:00 AM", "11:00 AM"],
    price: 50,
    rating: 5
  ),
  Activity(
      imageUrl: "assets/images/gondola.jpg",
      name: "Walking tour and Gandola Ride",
      type: "Sightseeing tour",
      startTimes: ["11:00 AM", "01:00 PM"],
      price: 210,
      rating: 4
  ),
  Activity(
      imageUrl: "assets/images/smurano.jpg",
      name: "Murano and Burano Tour",
      type: "Sightseeing tour",
      startTimes: ["12:30 PM", "02:00 PM"],
      price: 125,
      rating: 3
  ),
];

final List<Destination> destinations = [
  Destination(
    imageUrl: "assets/images/venice.jpg",
    city: "Venice",
    country: "Italy",
    description: "Visit Venice for an amazing unforgettable adventure",
    activities: activities
  ),
  Destination(
      imageUrl: "assets/images/paris.jpg",
      city: "Paris",
      country: "Italy",
      description: "Visit Paris for an amazing unforgettable adventure",
      activities: activities
  ),
  Destination(
      imageUrl: "assets/images/venice.jpg",
      city: "Venice",
      country: "Italy",
      description: "Visit Venice for an amazing unforgettable adventure",
      activities: activities
  ),
  Destination(
      imageUrl: "assets/images/saopaulo.jpg",
      city: "Sao Paulo",
      country: "Brazil",
      description: "Visit Sao Paulo for an amazing unforgettable adventure",
      activities: activities
  ),
  Destination(
      imageUrl: "assets/images/newdelhi.jpg",
      city: "New Delhi",
      country: "India",
      description: "Visit New Delhi for an amazing unforgettable adventure",
      activities: activities
  ),
  Destination(
      imageUrl: "assets/images/newyork.jpg",
      city: "New York",
      country: "USA",
      description: "Visit New York for an amazing unforgettable adventure",
      activities: activities
  )
];