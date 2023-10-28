import 'package:flutter/material.dart';
import 'package:latihanflutter5/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Informasi"),
            content: Text("Selamat Anda Berhasil Login"),
            actions: [
              TextButton(
                  onPressed: () {
                    _redirectToNewPage(context);
                  },
                  child: Text("OK"))
            ],
          );
        },
      );
    }
  }

  void _redirectToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              NewPage()), // NewPage adalah halaman baru yang ingin Anda tuju
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: ListView(
        children: [
          Container(
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: "Masukan Username Anda",
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username Harus Di Isi";
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Masukan Password Anda",
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Harus Di Isi";
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: Text("login"))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
