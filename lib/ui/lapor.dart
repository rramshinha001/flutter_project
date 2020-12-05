import 'package:flutter/material.dart';
import 'package:lapor_app/helpers/dbhelper.dart';
import 'package:lapor_app/models/laporan.dart';

class Lapor extends StatefulWidget {
  @override
  _LaporState createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  Laporan _laporan = Laporan();
  List<Laporan> _laporann = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();
  final _ctrlPerihal = TextEditingController();
  final _ctrlKeterangan = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Halaman Laporan '),
          elevation: 1.0,
          backgroundColor: Colors.purple,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Laporan'),
              Tab(text: 'Daftar Laporan'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _form(),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _list(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _form() => Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _ctrlPerihal,
                onSaved: (val) => setState(() => _laporan.perihal = val),
                decoration: InputDecoration(
                  hintText: 'Perihal',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(new Radius.circular(5.0))),
                ),
                validator: (val) =>
                    (val.length == 0 ? 'this field is required' : null),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: _ctrlKeterangan,
                maxLines: 5,
                onSaved: (val) => setState(() => _laporan.keterangan = val),
                decoration: InputDecoration(
                  hintText: 'keterangan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(new Radius.circular(5.0))),
                ),
                validator: (val) =>
                    (val.length == 0 ? 'this field is required' : null),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () => _onSubmit(),
                  child: Text('submit'),
                  color: Colors.purple,
                  textColor: Colors.white,
                ),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      );

  _refreshList() async {
    List<Laporan> x = await _dbHelper.fetchLaporan();
    setState(() {
      _laporann = x;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_laporan.id == null)
        await _dbHelper.insertLaporan(_laporan);
      else
        await _dbHelper.updateLaporan(_laporan);
      _refreshList();
      _formReset();
    }
  }

  _formReset() {
    setState(() {
      _formKey.currentState.reset();
      _ctrlPerihal.clear();
      _ctrlKeterangan.clear();
      _laporan.id = null;
    });
  }

  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(
                        _laporann[index].perihal,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(_laporann[index].keterangan),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_sweep),
                        onPressed: () async {
                          await _dbHelper.deleteLaporan(_laporann[index].id);
                          _formReset();
                          _refreshList();
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _laporan = _laporann[index];
                          _ctrlPerihal.text = _laporann[index].perihal;
                          _ctrlKeterangan.text = _laporann[index].keterangan;
                        });
                      },
                    ),
                  ),
                  Divider(
                    height: 5.0,
                  ),
                ],
              );
            },
            itemCount: _laporann.length,
          ),
        ),
      );
}
