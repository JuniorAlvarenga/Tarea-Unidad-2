import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  set globalUsuario(String globalUsuario) {}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 10.0, vertical: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.account_circle,
                color: Color(0xFF0D007E),
                size: 150,
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _usuarioController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 22.0),
                decoration: const InputDecoration(
                    labelText: 'Usuario',
                    hintText: 'Ingrese su usuario',
                    prefixIcon: Icon(Icons.perm_identity),
                    border: OutlineInputBorder()),
                validator: (value) {
                  return value!.isEmpty ? 'Por favor ingrese un usuario' : null;
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                  fontSize: 22.0,
                ),
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()),
                validator: (value2) {
                  return value2!.isEmpty
                      ? 'Por favor ingrese una contraseña'
                      : null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: double.parse('50'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage(
                                usuario: _usuarioController.text);
                          },
                        ),
                      );
                    }
                  },
                  color: const Color(0xFF0D007E),
                  textColor: Colors.white,
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(fontSize: 28.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  String usuario;
  ProfilePage({super.key, required this.usuario});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _editando = false;
  final TextEditingController _textEditingController2 = TextEditingController();
  void _editar() {
    setState(() {
      _editando = true;
      _textEditingController2.text = widget.usuario;
    });
  }

  void _guardarEdicion() {
    setState(() {
      widget.usuario = _textEditingController2.text;
      _editando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _editando
              ? TextField(
                  controller: _textEditingController2,
                  decoration: const InputDecoration(
                    hintText: 'Nuevo Nombre',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    _guardarEdicion();
                  },
                )
              : Text(
                  widget.usuario,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: GestureDetector(
                  onTap: () {
                    _editar();
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 30.0,
                  ),
                )),
          ]),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, right: 20, left: 18),
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.lightGreenAccent,
                          child:
                              Icon(Icons.phone, size: 15, color: Colors.white)),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, right: 16),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.yellowAccent,
                        child: Icon(
                          Icons.message,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 42,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Image.network(
                            'https://militaryhealthinstitute.org/wp-content/uploads/sites/37/2021/08/blank-profile-picture-png.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, right: 18, left: 16),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.redAccent,
                        child: Icon(Icons.star_border,
                            size: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, right: 18),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.lightBlueAccent,
                        child: Icon(Icons.share, size: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Profile Info',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 80.0,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date of Birth',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '15 Feb 1996',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.001,
                                  right: MediaQuery.of(context).size.width *
                                      0.001),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[800],
                                child: const Icon(
                                  Icons.mode_edit_outlined,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Contact Info',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.32),
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              Text('Add'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 90.0,
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Main Number',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '+504 9811-0172',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.001),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.block_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.001),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.delete_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 90.0,
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Primary Number',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '+504 9811-0172',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.001),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.block_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.001),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.delete_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Email Info',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.4),
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              Text('Add'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 90.0,
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Main Email',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'jialvarenga@unah.hn',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.001),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[800],
                                child: const Icon(
                                  Icons.delete_outlined,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Address Info',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.3),
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              Text('Add'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 110.0,
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Home Town Address',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Col.Modelo, Zona NE,',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        'San Pedro Sula, Cortes',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.0001),
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.grey[800],
                                child: const Icon(
                                  Icons.delete_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.879,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/e/ee/Logo_de_Facebook.png'), //NetworkImage
                          radius: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 73, 173, 255),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/08/23/11/30/twitter-2672572_960_720.jpg'), //NetworkImage
                          radius: 25,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(244, 179, 5, 5),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://play-lh.googleusercontent.com/VRMWkE5p3CkWhJs6nv-9ZsLAs1QOg5ob1_3qg-rckwYW7yp1fMrYZqnEFpk0IoVP4LM'), //NetworkImage
                          radius: 25,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(212, 248, 93, 46),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Google_Plus_logo_%282015-2019%29.svg/2048px-Google_Plus_logo_%282015-2019%29.svg.png'), //NetworkImage
                          radius: 25,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(211, 31, 31, 31),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          radius: 25,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 27,
                            child: Icon(
                              Icons.add_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
