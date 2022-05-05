import 'dart:async';

import '../models/Usuario.dart';

class _UsuarioService{
  late Usuario _usuario;

  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  Usuario? get usuario => this._usuario;
  bool get existeUsuario => (this._usuario  != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;
  
  
  void cargarUsuario(Usuario user){
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad){
    this._usuario.edad = edad;
    this._usuarioStreamController.add( this._usuario );

  }

  dispose(){
    this._usuarioStreamController.close();
  }
  
}

final usuarioService = new _UsuarioService();