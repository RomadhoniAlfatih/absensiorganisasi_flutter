import 'package:flutter/material.dart';
import '../models/absensi.dart';

class EditPage extends StatefulWidget {

  final Absensi absensi;
  final Function(Absensi) onEdit;

  const EditPage({
    super.key,
    required this.absensi,
    required this.onEdit,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage>{

  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController divisiController;
  late TextEditingController statusController;

  @override
  void initState(){

    super.initState();

    namaController = TextEditingController(text: widget.absensi.nama);
    nimController = TextEditingController(text: widget.absensi.nim);
    divisiController = TextEditingController(text: widget.absensi.divisi);
    statusController = TextEditingController(text: widget.absensi.status);

  }

  void update(){

    Absensi absensi = Absensi(
      nama: namaController.text,
      nim: nimController.text,
      divisi: divisiController.text,
      status: statusController.text,
    );

    widget.onEdit(absensi);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Absensi"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(controller: namaController),
            TextField(controller: nimController),
            TextField(controller: divisiController),
            TextField(controller: statusController),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: update,
              child: const Text("Update"),
            ),

          ],
        ),
      ),
    );
  }
}