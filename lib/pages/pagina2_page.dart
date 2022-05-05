import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(usuarioService.usuario == null  ? 'Pagina2' : usuarioService.usuario!.nombre ) ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario'),
              color: Colors.blue[100],
              onPressed: (){
                //final usuarioService = Provider.of<UsuarioService>(context, listen: false);

                usuarioService.usuario = new Usuario(nombre: 'Luis', edad: 23, profesiones: ['soldador','albañil','fontanero']);

            }),
             MaterialButton(
              child: Text('Cambiar edad'),
              color: Colors.blue[100],
              onPressed: (){
                usuarioService.cambiarEdad(129);
            }),
             MaterialButton(
              child: Text('Añadir profesion'),
              color: Colors.blue[100],
              onPressed: (){
                usuarioService.agregarProfesion();
            }),
          ],
        )
      ),
      
    );
  }
}