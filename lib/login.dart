import 'package:flutter/material.dart';
import 'package:pokecard/api/rest_api.dart';
import 'package:pokecard/main2.dart';

class AuthThreePage extends StatefulWidget {
  static final String path = "lib/login/auth3.dart";

  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}

class _AuthThreePageState extends State<AuthThreePage> {
  bool formVisible;
  int _formsIndex;
  

  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://i.pinimg.com/originals/b6/d1/0c/b6d10c828a3c218eebf75bfab73784cb.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black54,
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight + 40),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Bienvenidos",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "¡Bienvenidos a nuestra App! \n Verifica tus credenciales para entrar",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Acceso"),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.grey.shade700,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Inscribirse"),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 2;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
                const SizedBox(height: 40.0),
                OutlineButton.icon(
                  borderSide: BorderSide(color: Colors.blue),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  icon: Icon(Icons.android),
                  label: Text("Continuar como invitado"),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainWidget(usuario: '', usuarioimagen: ''))),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: (!formVisible)
                ? null
                : Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              textColor: _formsIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              color:
                                  _formsIndex == 1 ? Colors.blue : Colors.white,
                              child: Text("Acceso"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RaisedButton(
                              textColor: _formsIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              color:
                                  _formsIndex == 2 ? Colors.blue : Colors.white,
                              child: Text("Signup"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 2;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  formVisible = false;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                                _formsIndex == 1 ? LoginForm() : SignupForm(),
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _userName = TextEditingController();
  final _userPassword = TextEditingController();
  String _userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _userName,
            decoration: InputDecoration(
              hintText: "Nombre de usuario",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            controller: _userPassword,
            decoration: InputDecoration(
              hintText: "Constraseña",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Acceder"),
            onPressed: () {
              final body = {
                    "usuario1": _userName.text,
                    "contrasena": _userPassword.text,
                  };
                  ApiService.getUsuario().then((success) {
                    bool verify = false;
                    for (var i=0; i < success.length; i++){
                      if (success[i]['usuario1'] == _userName.text){
                        if(success[i]['contrasena'] == _userPassword.text){
                          _userImage = success[i]['imagen_usuario'];
                          verify = true;
                        }
                      }
                    }
                    /*if(success.contains(_userName.text) && success.contains(_userPassword.text)){
                        verify = true;
                    }*/
                    print(success);
                    //success.contains(Usuario(usuario1:_userName.text, contrasena:_userName.text));
                    //final usuarios = new Usuarios.fromJsonList([]);
                    if (verify) {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainWidget(usuario: _userName.text, usuarioimagen: _userImage)));
                      return;
                    }else{
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Credenciales Incorrectas!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _userName.text = '';
                                _userPassword.text = '';
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }                    
                  });                  
            },
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({Key key}) : super(key: key);

  _SignupForm createState() => _SignupForm();
}

class _SignupForm extends State<SignupForm> {
  final _userName = TextEditingController();
  final _userPassword = TextEditingController();
  final _userPasswordConfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _userName,
            decoration: InputDecoration(
              hintText: "Nombre de usuario",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            controller: _userPassword,
            decoration: InputDecoration(
              hintText: "Contraseña",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            controller: _userPasswordConfirm,
            decoration: InputDecoration(
              hintText: "Confirmar contraseña",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Inscribirse"),
            onPressed: () {
                  final body = {
                    "usuario1": _userName.text,
                    "contrasena": _userPassword.text,
                    "imagen_usuario": "notimage",
                  };
                  if (_userPasswordConfirm.text == _userPassword.text){
                  ApiService.addUsuario(body).then((success) {
                      if (success) {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Usuario creado con éxito!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _userName.text = '';
                                _userPassword.text = '';
                                _userPasswordConfirm.text = '';
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }else{
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Error Creando Usuario!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }                    
                  });
                    }else{
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Las contraseñas no son iguales!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                    }
                },
          ),
        ],
      ),
    );
  }
}
