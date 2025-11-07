import 'package:flutter/material.dart';
import 'package:form_pendaftaran/beranda.dart';

class FormDaftar extends StatefulWidget {
  const FormDaftar({super.key});

  @override
  State<FormDaftar> createState() => _FormDaftarState();
}

  class _FormDaftarState extends State<FormDaftar> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController teleponController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BerandaPage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    teleponController.dispose();
    alamatController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Silahkan Isi Form Pendaftaran'),
          backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    
      body: Center(
        child: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255), // Very light blue
                  Color.fromARGB(255, 248, 221, 255), // Light blue
                ],
              ),
          ), 
    
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Form Pendaftaran',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan nama lengkap Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Masukkan email Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@')) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: teleponController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nomor Telepon',
                    hintText: 'Masukkan nomor telepon Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor HP tidak boleh kosong';
                    } else if (value.length < 10) {
                      return 'Nomor HP harus lebih dari 10 angka';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                    hintText: 'Masukkan alamat Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan password Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (value.length < 4) {
                      return 'Password harus lebih dari 3 karakter';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  } 
}
