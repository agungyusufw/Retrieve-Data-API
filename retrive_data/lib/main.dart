import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retrive_data/data.dart';

void main() {
  runApp(MaterialApp(
    home: API(),
    theme: ThemeData(),
  ));
}

class API extends StatefulWidget {
  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  Future<List<Barang>> fetchBarang() async {
    final response = await http.get("http://192.168.43.2/retrivedata/koneksi.php");
    return barangFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Data API Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: fetchBarang(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index){
                    Barang data = snapshot.data[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${data.barang}',style: TextStyle(fontSize: 20),),
                          Text('${data.jumlah}',style: TextStyle(fontSize: 20),),
                        ]
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            }
          ),
        ),
      ),
    );
  }
}


