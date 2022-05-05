import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario'),
              color: Colors.blue[100],
              onPressed: (){

            }),
             MaterialButton(
              child: Text('Cambiar edad'),
              color: Colors.blue[100],
              onPressed: (){

            }),
             MaterialButton(
              child: Text('Añadir profesion'),
              color: Colors.blue[100],
              onPressed: (){

            }),
          ],
        )
      ),
      
    );
  }
}