
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  final imagePath;

  DetailScreen(this.imagePath);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.imagePath),),
    );
  }
}
