import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/DeletePomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';

class DeletePagePomar extends StatefulWidget {
  final String? idPomar;

  DeletePagePomar({Key? key, this.idPomar}) : super(key: key);
  @override
  _DeletePagePomarState createState() => _DeletePagePomarState(idPomar!);
}

class _DeletePagePomarState extends State<DeletePagePomar> {
  late Future<Pomar> _futurePomar;
  late String id = "0";
  _DeletePagePomarState(String idPomar) {
    id = idPomar;
  }

  @override
  void initState() {
    super.initState();
    _futurePomar = fetchPomar(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Pomar'),
      ),
      body: Center(
        child: FutureBuilder<Pomar>(
          future: _futurePomar,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${snapshot.data?.nome ?? 'Deleted'}'),
                    ElevatedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          deletePomar(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
