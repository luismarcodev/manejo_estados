import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Usuario.dart';

//import '../services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsuarioService usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              usuarioService.removerUsuario();
            },
            icon: Icon(Icons.delete),
          )
        ],
        title: Text('Pagina 1'),
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario,
            )
          : Center(
              child: Text('No existe'),
            ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario? usuario;
  const InformacionUsuario({this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario!.nombre} '),
          ),
          ListTile(
            title: Text('Edad: ${usuario!.edad}'),
          ),
          Text(
            'Profesiones',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),

          ...usuario!.profesiones.map((profesion) => ListTile(title: (Text(profesion)),)).toList()


          // ListTile(
          //   title: Text('Profesión 1: '),
          // ),
       
        ],
      ),
    );
  }
}
