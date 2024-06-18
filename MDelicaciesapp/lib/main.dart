import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelListScreen(),
    );
  }
}

class Hotel {
  final int id;
  final String name;
  final String address;
  final double rating;

  Hotel({required this.id, required this.name, required this.address, required this.rating});
}

class HotelListScreen extends StatefulWidget {
  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  final List<Hotel> _hotels = [
    Hotel(id: 1, name: 'Hotel 1', address: 'Address 1', rating: 4.5),
    Hotel(id: 2, name: 'Hotel 2', address: 'Address 2', rating: 4.2),
    Hotel(id: 3, name: 'Hotel 3', address: 'Address 3', rating: 4.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel List'),
      ),
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_hotels[index].name),
            subtitle: Text(_hotels[index].address),
            trailing: Text(_hotels[index].rating.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetailScreen(hotel: _hotels[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  HotelDetailScreen({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Address: ${hotel.address}'),
            Text('Rating: ${hotel.rating}'),
          ],
        ),
      ),
    );
  }
}