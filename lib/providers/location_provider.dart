import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For decoding JSON responses

class LocationProvider extends ChangeNotifier {
  bool _locationGranted = false;

  TextEditingController searchController = TextEditingController();
  List<String> searchResults = [];
  List<String> recentSearches = [];

  final String googleApiKey =
      "AIzaSyBJvjSMydFQlpKLn-yG_QADLAsDCFl7OYA"; // Replace with your API key

  bool get locationGranted => _locationGranted;

  LocationProvider() {
    _loadRecentSearches();
  }

  /// Request location permission
  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      _locationGranted = true;
    } else {
      _locationGranted = false;
    }
    notifyListeners();
  }

  /// Load recent searches from SharedPreferences
  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    recentSearches = prefs.getStringList('recentSearches') ?? [];
    notifyListeners();
  }

  /// Save a search to recent searches
  Future<void> saveRecentSearch(String location) async {
    if (!recentSearches.contains(location)) {
      recentSearches.add(location);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('recentSearches', recentSearches);
      notifyListeners();
    }
  }

  /// Simulate fetching location search results
  Future<void> searchLocation(String query) async {
    if (query.isEmpty) return;

    // Simulate an API call
    await Future.delayed(Duration(seconds: 1));
    searchResults = [
      "$query Central",
      "$query Downtown",
      "$query Mall",
    ];
    notifyListeners();
  }

  /// Clear search bar and results
  void clearSearch() {
    searchController.clear();
    searchResults = [];
    notifyListeners();
  }

  /// Fetch user's current location and convert to address
  Future<void> useCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        searchResults = ["Location services are disabled"];
        notifyListeners();
        return;
      }

      if (!_locationGranted) {
        await requestLocationPermission();
      }

      if (_locationGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        // Reverse geocode to get the address with Indian locale
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
          localeIdentifier: "en_IN", // Ensures Indian address format
        );

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          String address =
              "${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
          searchResults = [address];
        } else {
          searchResults = ["Unable to determine address"];
        }
      } else {
        searchResults = ["Location permission not granted"];
      }
    } catch (e) {
      searchResults = ["Failed to get current location: ${e.toString()}"];
    }
    notifyListeners();
  }

  // Fetch address suggestions from Google Places API
  Future<void> searchLocationApi(String query) async {
    if (query.isEmpty) return;

    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$googleApiKey&types=geocode";

    try {
      final response = await http.get(Uri.parse(url));

      // Log response for debugging
      print("API URL: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final predictions = data['predictions'] as List;

        searchResults =
            predictions.map((item) => item['description'].toString()).toList();
      } else {
        searchResults = ["Failed to fetch suggestions"];
        print("Error: ${response.body}");
      }
    } catch (e) {
      searchResults = ["Error: ${e.toString()}"];
      print("Exception: $e");
    }
    notifyListeners();
  }

  /// Extract city and country from a full address string
  String getCityAndCountry(String address) {
    final parts = address.split(',');
    if (parts.length >= 2) {
      return '${parts[parts.length - 2].trim()}, ${parts.last.trim()}';
    }
    return address; // Return full address if splitting fails
  }
}
