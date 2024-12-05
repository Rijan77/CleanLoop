//
//
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
//           content: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Ensure the column takes only as much space as needed
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Full Name'),
//                 ),
//                 TextField(
//                   controller: addressController,
//                   decoration: InputDecoration(labelText: 'Address'),
//                 ),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(labelText: 'Email'),
//                 ),
//                 TextField(
//                   controller: contactController,
//                   decoration: InputDecoration(labelText: 'Contact Number'),
//                 ),
//               ],
//             ),
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
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

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
      title: "Tree Plantation Drive",
      date: DateTime(2024, 12, 16),
      time: "11:00 AM",
      location: "City Square",
    ),
    Event(
      title: "Eco-Walkathon",
      date: DateTime(2024, 12, 20),
      time: "6:00 AM",
      location: "River Park",
    ),
    Event(
      title: "Waste Management Workshop",
      date: DateTime(2024, 12, 28),
      time: "2:00 PM",
      location: "Community Center",
    ),
    Event(
      title: "Sustainability Fair",
      date: DateTime(2025, 1, 5),
      time: "10:00 AM",
      location: "Town Hall",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Events'),
      ),
      body: Column(
        children: [
          // Calendar Widget with customized colors
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2025, 12, 31),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.green[300],
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.red),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            eventLoader: _getEventsForDay,
          ),

          // Event List in blue-themed UI
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay)[index];
                return Card(
                  color: Colors.blue[50],
                  child: ListTile(
                    title: Text(
                      event.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    subtitle: Text(
                      '${event.time} | ${event.location}',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add, color: Colors.green),
                      onPressed: () => _showParticipationDialog(context, event),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$userName, you have joined the event!'),
                  ));
                }
              },
              child: Text('Join'),
            ),
          ],
        );
      },
    );
  }
}



