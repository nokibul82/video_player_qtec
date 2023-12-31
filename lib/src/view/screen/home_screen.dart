import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Videos"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return Text("data $index");
          }
      ),
    );
  }
}