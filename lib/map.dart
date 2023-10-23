import 'package:flutter/material.dart';
import 'package:mid/lastScreen.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => last(), ));
          }, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/newmap.png'), 
                fit: BoxFit.cover, 
              ),
            ),
          ),
          SizedBox(width: 20,height: 20,),
      Align(
            alignment: Alignment.topCenter, 
            child: Image.asset('assets/search.png'),
          ),
         ], ),
    );
  }
}
