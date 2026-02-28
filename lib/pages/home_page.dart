import 'package:flutter/material.dart';
import '../models/absensi.dart';
import 'add_page.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Absensi> dataAbsensi = [];

  void tambahData(Absensi absensi){
    setState(() {
      dataAbsensi.add(absensi);
    });
  }

  void hapusData(int index){
    setState(() {
      dataAbsensi.removeAt(index);
    });
  }

  void editData(int index, Absensi absensi){
    setState(() {
      dataAbsensi[index] = absensi;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absensi Organisasi"),
      ),

      body: dataAbsensi.isEmpty
    ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.assignment,
              size: 80,
              color: Colors.grey,
            ),

            SizedBox(height: 20),

            Text(
              "Belum ada data absensi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Tekan tombol + untuk menambah data",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      )
    : ListView.builder(
        itemCount: dataAbsensi.length,
        itemBuilder: (context, index) {

          return Card(
            child: ListTile(

              title: Text(dataAbsensi[index].nama),

              subtitle: Text(
                "NIM: ${dataAbsensi[index].nim}\n"
                "Divisi: ${dataAbsensi[index].divisi}\n"
                "Status: ${dataAbsensi[index].status}"
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditPage(
                            absensi: dataAbsensi[index],
                            onEdit: (absensi){
                              editData(index, absensi);
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: (){
                      hapusData(index);
                    },
                  ),

                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddPage(onAdd: tambahData),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}