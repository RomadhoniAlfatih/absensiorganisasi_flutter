import 'package:flutter/material.dart';
import '../models/absensi.dart';

class AddPage extends StatefulWidget {

  final Function(Absensi) onAdd;

  const AddPage({super.key, required this.onAdd});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{

  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController divisiController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  void simpan(){

    Absensi absensi = Absensi(
      nama: namaController.text,
      nim: nimController.text,
      divisi: divisiController.text,
      status: statusController.text,
    );

    widget.onAdd(absensi);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Absensi"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Anggota",
              ),
            ),

            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                labelText: "NIM",
              ),
            ),

            TextField(
              controller: divisiController,
              decoration: const InputDecoration(
                labelText: "Divisi",
              ),
            ),

            TextField(
              controller: statusController,
              decoration: const InputDecoration(
                labelText: "Status Kehadiran",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: simpan,
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}