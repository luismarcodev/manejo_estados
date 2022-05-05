import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            if(snapshot.hasData){
              return Text(snapshot.data!.nombre);
            }else{
              return Text('Pagina 2');
            }
            
          }
        ),
      ),
      body: Botonera(),
      
    );
  }
}

class Botonera extends StatelessWidget {
  const Botonera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer Usuario'),
            color: Colors.blue[100],
            onPressed: (){
              final user = new Usuario(nombre: 'Luis', edad: 45, profesiones: ['soldador']);
              usuarioService.cargarUsuario(user);
          }),
           MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue[100],
            onPressed: (){
              usuarioService.cambiarEdad(12);
          }),
           MaterialButton(
            child: Text('Añadir profesion'),
            color: Colors.blue[100],
            onPressed: (){

          }),
        ],
      )
    );
  }
}