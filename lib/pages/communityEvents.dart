// import 'package:flutter/material.dart';
//
// class CommunityEventsPage extends StatefulWidget {
//   @override
//   _CommunityEventsPageState createState() => _CommunityEventsPageState();
// }
//
// class _CommunityEventsPageState extends State<CommunityEventsPage> {
//   // A map to store the event participation status
//   Map<String, bool> eventParticipated = {};
//
//   // Function to toggle participation
//   void _participateEvent(String eventTitle) {
//     setState(() {
//       eventParticipated[eventTitle] = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Community Events'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildEventCard('Recycling Workshop', 'Join us for a recycling workshop. Learn how to recycle effectively.', 'December 5, 2024'),
//             _buildEventCard('Green Market', 'Explore the Green Market for eco-friendly products.', 'December 10, 2024'),
//             _buildEventCard('Community Cleanup', 'Help us clean the local park and make a difference.', 'December 15, 2024'),
//             _buildEventCard('Tree Plantation', 'Be part of a tree plantation event to make the environment greener.', 'December 20, 2024'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEventCard(String title, String description, String date) {
//     bool hasParticipated = eventParticipated[title] ?? false;
//
//     return Card(
//       margin: EdgeInsets.only(bottom: 16.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(description, style: TextStyle(fontSize: 14)),
//             SizedBox(height: 8),
//             Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
//             SizedBox(height: 10),
//             hasParticipated
//                 ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("You are successfully registered for this event!", style: TextStyle(color: Colors.green)),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle booking confirmation
//                     _showBookingConfirmation(context, title);
//                   },
//                   child: Text('Confirm Booking'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 ),
//               ],
//             )
//                 : ElevatedButton(
//               onPressed: () {
//                 // Participate in the event
//                 _participateEvent(title);
//               },
//               child: Text('Participate'),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showBookingConfirmation(BuildContext context, String eventTitle) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Booking Confirmed'),
//           content: Text('You have successfully booked your spot for "$eventTitle".'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';  // Import the calendar package
// import 'event.dart';  // Import the Event model
//
// class CommunityEventsPage extends StatefulWidget {
//   @override
//   _CommunityEventsPageState createState() => _CommunityEventsPageState();
// }
//
// class _CommunityEventsPageState extends State<CommunityEventsPage> {
//   // Calendar state
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay = DateTime.now();
//
//   // Event data
//   List<Event> events = [
//     Event(
//       title: "Community Cleanup",
//       date: DateTime(2024, 12, 5),
//       time: "10:00 AM",
//       location: "Central Park",
//     ),
//     Event(
//       title: "Green Market",
//       date: DateTime(2024, 12, 6),
//       time: "9:00 AM",
//       location: "Main Street",
//     ),
//   ];
//
//   // Get events for a specific day
//   List<Event> _getEventsForDay(DateTime day) {
//     return events.where((event) {
//       return event.date.year == day.year &&
//           event.date.month == day.month &&
//           event.date.day == day.day;
//     }).toList();
//   }
//
//   // To store the name of the user participating in the event
//   TextEditingController _nameController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Community Events'),
//       ),
//       body: Column(
//         children: [
//           // Calendar Widget
//           TableCalendar(
//             focusedDay: _focusedDay,
//             firstDay: DateTime.utc(2020, 01, 01),
//             lastDay: DateTime.utc(2025, 12, 31),
//             eventLoader: _getEventsForDay, // Function to load events for a day
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//           ),
//
//           // Event List
//           Expanded(
//             child: ListView.builder(
//               itemCount: _getEventsForDay(_selectedDay).length,
//               itemBuilder: (context, index) {
//                 final event = _getEventsForDay(_selectedDay)[index];
//                 return Card(
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: Text(event.title),
//                         subtitle: Text('${event.time} | ${event.location}'),
//                         trailing: IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () => _showParticipationDialog(context, event),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Participants:'),
//                             // Display list of participants for this event
//                             ...event.participants.map((participant) => Text(participant)).toList(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Show dialog to add new event
//           _showAddEventDialog(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   // Show dialog to add a new event
//   void _showAddEventDialog(BuildContext context) {
//     TextEditingController titleController = TextEditingController();
//     TextEditingController locationController = TextEditingController();
//     String selectedTime = '10:00 AM'; // Default time
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add New Event'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: 'Event Title'),
//               ),
//               TextField(
//                 controller: locationController,
//                 decoration: InputDecoration(labelText: 'Event Location'),
//               ),
//               DropdownButton<String>(
//                 value: selectedTime,
//                 items: ['10:00 AM', '2:00 PM', '6:00 PM']
//                     .map((time) => DropdownMenuItem(
//                   value: time,
//                   child: Text(time),
//                 ))
//                     .toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedTime = newValue!;
//                   });
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Add event to the list
//                 setState(() {
//                   events.add(Event(
//                     title: titleController.text,
//                     date: _selectedDay,
//                     time: selectedTime,
//                     location: locationController.text,
//                   ));
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add Event'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show dialog to participate in an event
//   void _showParticipationDialog(BuildContext context, Event event) {
//     TextEditingController nameController = TextEditingController();
//     TextEditingController addressController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController contactController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Participate in ${event.title}'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Full Name'),
//               ),
//               TextField(
//                 controller: addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: contactController,
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 String userName = nameController.text.trim();
//                 String userAddress = addressController.text.trim();
//                 String userEmail = emailController.text.trim();
//                 String userContact = contactController.text.trim();
//
//                 if (userName.isNotEmpty && userEmail.isNotEmpty && userContact.isNotEmpty) {
//                   // Add participant to the event
//                   setState(() {
//                     event.addParticipant(userName);
//                     // You can also store the full details of participants here if needed.
//                     nameController.clear();
//                     addressController.clear();
//                     emailController.clear();
//                     contactController.clear();
//                   });
//
//                   Navigator.of(context).pop();
//                   // Optionally show a success message
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('$userName, you just have joined the event!'),
//                   ));
//                 }
//               },
//               child: Text('Join Event'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // Import the calendar package
import 'event.dart';  // Import the Event model

class CommunityEventsPage extends StatefulWidget {
  @override
  _CommunityEventsPageState createState() => _CommunityEventsPageState();
}

class _CommunityEventsPageState extends State<CommunityEventsPage> {
  // Calendar state
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  // Event data
  List<Event> events = [
    Event(
      title: "Community Cleanup",
      date: DateTime(2024, 12, 5),
      time: "10:00 AM",
      location: "Central Park",
    ),
    Event(
      title: "Green Market",
      date: DateTime(2024, 12, 6),
      time: "9:00 AM",
      location: "Main Street",
    ),
  ];

  // Get events for a specific day
  List<Event> _getEventsForDay(DateTime day) {
    return events.where((event) {
      return event.date.year == day.year &&
          event.date.month == day.month &&
          event.date.day == day.day;
    }).toList();
  }

  // To store the name of the user participating in the event
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Events'),
      ),
      body: Column(
        children: [
          // Calendar Widget
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2025, 12, 31),
            eventLoader: _getEventsForDay, // Function to load events for a day
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),

          // Event List
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay)[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(event.title),
                        subtitle: Text('${event.time} | ${event.location}'),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => _showParticipationDialog(context, event),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Participants:'),
                            // Display list of participants for this event
                            ...event.participants.map((participant) => Text(participant)).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to add new event
          _showAddEventDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Show dialog to add a new event
  void _showAddEventDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    String selectedTime = '10:00 AM'; // Default time

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Event'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Event Title'),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Event Location'),
              ),
              DropdownButton<String>(
                value: selectedTime,
                items: ['10:00 AM', '2:00 PM', '6:00 PM']
                    .map((time) => DropdownMenuItem(
                  value: time,
                  child: Text(time),
                ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedTime = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Add event to the list
                setState(() {
                  events.add(Event(
                    title: titleController.text,
                    date: _selectedDay,
                    time: selectedTime,
                    location: locationController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add Event'),
            ),
          ],
        );
      },
    );
  }

  // Show dialog to participate in an event
  void _showParticipationDialog(BuildContext context, Event event) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Participate in ${event.title}'),
          content: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the column takes only as much space as needed
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(labelText: 'Contact Number'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String userName = nameController.text.trim();
                String userAddress = addressController.text.trim();
                String userEmail = emailController.text.trim();
                String userContact = contactController.text.trim();

                if (userName.isNotEmpty && userEmail.isNotEmpty && userContact.isNotEmpty) {
                  // Add participant to the event
                  setState(() {
                    event.addParticipant(userName);
                    // You can also store the full details of participants here if needed.
                    nameController.clear();
                    addressController.clear();
                    emailController.clear();
                    contactController.clear();
                  });

                  Navigator.of(context).pop();
                  // Optionally show a success message
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$userName, you just have joined the event!'),
                  ));
                }
              },
              child: Text('Join Event'),
            ),
          ],
        );
      },
    );
  }
}
