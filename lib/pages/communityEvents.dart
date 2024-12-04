import 'package:flutter/material.dart';

class CommunityEventsPage extends StatefulWidget {
  @override
  _CommunityEventsPageState createState() => _CommunityEventsPageState();
}

class _CommunityEventsPageState extends State<CommunityEventsPage> {
  // A map to store the event participation status
  Map<String, bool> eventParticipated = {};

  // Function to toggle participation
  void _participateEvent(String eventTitle) {
    setState(() {
      eventParticipated[eventTitle] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Events'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildEventCard('Recycling Workshop', 'Join us for a recycling workshop. Learn how to recycle effectively.', 'December 5, 2024'),
            _buildEventCard('Green Market', 'Explore the Green Market for eco-friendly products.', 'December 10, 2024'),
            _buildEventCard('Community Cleanup', 'Help us clean the local park and make a difference.', 'December 15, 2024'),
            _buildEventCard('Tree Plantation', 'Be part of a tree plantation event to make the environment greener.', 'December 20, 2024'),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String description, String date) {
    bool hasParticipated = eventParticipated[title] ?? false;

    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 10),
            hasParticipated
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You are successfully registered for this event!", style: TextStyle(color: Colors.green)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle booking confirmation
                    _showBookingConfirmation(context, title);
                  },
                  child: Text('Confirm Booking'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            )
                : ElevatedButton(
              onPressed: () {
                // Participate in the event
                _participateEvent(title);
              },
              child: Text('Participate'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingConfirmation(BuildContext context, String eventTitle) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking Confirmed'),
          content: Text('You have successfully booked your spot for "$eventTitle".'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}