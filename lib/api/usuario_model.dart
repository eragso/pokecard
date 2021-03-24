class Usuarios {

  List<Usuario> items = new List();

  Usuarios();

  Usuarios.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final pelicula = new Usuario.fromJsonMap(item);
      items.add( pelicula );
    }

  }

}



class Usuario {

  String uniqueId;

  String usuario1;
  String contrasena;
  String imagenusuario;

  Usuario({
    this.usuario1,
    this.contrasena,
    this.imagenusuario,
  });

  Usuario.fromJsonMap( Map<String, dynamic> json ) {

    usuario1        = json['usuario1'];
    contrasena      = json['contrasena'];
    imagenusuario   = json['imagen_usuario'];


  }

  getPosterImg() {

    if ( imagenusuario == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$imagenusuario';
    }

  }

}


