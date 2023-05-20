import 'package:flutter/material.dart';
import 'package:flutter_application_4/API.dart';

void main() {
  runApp(const MaterialApp());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetState();
}

class _HomePagetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API')),
      ),
        body: FutureBuilder(future: getAPI(), builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data['products'].length, itemBuilder: (context, index) {
              return ListTile(
              leading: Image.network(snapshot.data['products'][index]['thumbnail'], width: 100, fit: BoxFit.cover,),
              title: Text(snapshot.data['products'][index]['title']),
              subtitle: Text(snapshot.data['products'][index]['brand']),
              trailing: Text(snapshot.data['products'][index]['price'].toString()));
          });
          } else if(snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },)
    );
  }
}