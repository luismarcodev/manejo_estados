import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
     body: StreamBuilder(
  stream: usuarioService.usuarioStream,
 builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
     return snapshot.hasData
         ? InformacionUsuario(snapshot.data)
         : Center(child: Text( 'No hay información del usuario'));
  },
), // StreamBuilder
    );
  }
}
///Widget encargado de mostrar la información de usuario
class InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;
  const InformacionUsuario(this.usuario);

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
            title: Text('Nombre: ${usuario!.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario!.edad}'),
          ),
          Text(
            'Profesiones',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),
          ListTile(
            title: Text('Profesión 1: '),
          ),
          ListTile(
            title: Text('Profesion 2: '),
          ),
          ListTile(
            title: Text('Profesion 3: '),
          ),
          
        ],
      ),
    );
  }
}
