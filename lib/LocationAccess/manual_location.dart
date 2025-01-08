import "package:flutter/material.dart";
import "package:my_fashion/colors.dart";
import "package:my_fashion/providers/location_provider.dart";
import "package:provider/provider.dart";

class ManualLocationScreen extends StatefulWidget {
  const ManualLocationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ManualLocationScreenState();
  }
}

class ManualLocationScreenState extends State<ManualLocationScreen> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter Your Location",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: locationProvider.searchController,
              decoration: InputDecoration(
                hintText: "Search location",
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: grey,
                ),
                prefixIcon: Icon(Icons.search, color: grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, color: brown),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    locationProvider.clearSearch();
                  },
                  icon: Icon(
                    Icons.clear_rounded,
                    color: brown,
                  ),
                ),
              ),
              onSubmitted: (value) {
                // Handle search submission
                locationProvider.searchLocationApi(value);
              },
            ),
            SizedBox(height: 15),

            // Current Location Button
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  // Handle current location logic
                  locationProvider.useCurrentLocation();
                },
                icon: Icon(
                  Icons.near_me_rounded,
                  size: 30,
                  color: brown,
                ),
                label: Text(
                  "Use my current location",
                  style: TextStyle(
                    fontSize: 17,
                    color: black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Search Result Label
            Text(
              locationProvider.searchResults.isNotEmpty
                  ? "SEARCH RESULTS"
                  : "RECENT SEARCHES",
              style:
                  TextStyle(fontSize: 17, color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(height: 10),

            // Recent Search Results
            Expanded(
              child: ListView.builder(
                itemCount: locationProvider.searchResults.isNotEmpty
                    ? locationProvider.searchResults.length
                    : locationProvider
                        .recentSearches.length, // Replace with dynamic count
                itemBuilder: (context, index) {
                  String location = locationProvider.searchResults.isNotEmpty
                      ? locationProvider.searchResults[index]
                      : locationProvider.recentSearches[index];
                  return ListTile(
                    leading: Icon(
                      Icons.near_me,
                      color: brown,
                    ),
                    title: Text(
                      location, // Replace with dynamic data
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: black,
                      ),
                    ),
                    onTap: () {
                      // Handle location selection
                      locationProvider.saveRecentSearch(location);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
