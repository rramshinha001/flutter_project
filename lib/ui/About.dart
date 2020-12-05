import 'package:flutter/material.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          title: Text('About '),
          elevation: 1.0,
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(          
                children: [
                  Text('About Us', style: TextStyle(fontSize: 30),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("- Anda Dapat Mengirim Laporan Berupa Hal Yang Menggangu Ketertiban warga, kritik atau saran bagi kemajuan desa ", style: TextStyle(fontSize: 16),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("- jika anda adalah warga baru yang baru pindah maka anda juga dapat melaporkan kepindahan anda melalui aplikasi ini ", style: TextStyle(fontSize: 16),),
                  ),
              ],),
            ),
          ),
        ),
    );
  }
}