import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama=["Islam","Kristen","Hindu","Buddha"];
  String _agama="Islam";
  
  String _jk="";

  TextEditingController controllerNama= new TextEditingController();
  TextEditingController controllerPassword= new TextEditingController();
  TextEditingController controllerMotto= new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _jk=value;
    });
  }

  void pilihAgama(String value){
    setState(() {
      _agama=value;
    });
  }

  void _kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Password : ${controllerPassword.text}"),
            new Text("Motto : ${controllerMotto.text}"),
            new Text("Jenis Kelamin : $_jk"),
            new Text("Agama : $_agama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: ()=> Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context,child:alertDialog );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Formulir"),
        backgroundColor: Colors.teal,


      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerMotto,
                  maxLength: 3,
                  decoration: new InputDecoration(
                    hintText: "Motto",
                    labelText: "Motto",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new RadioListTile(
                  value: "Laki-laki",
                  title: new Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Pilih ini jika anda Laki-laki"),
                ),
                new RadioListTile(
                  value: "Perempuan",
                  title: new Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Pilih ini jika anda Perempuan"),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new Row(
                  children: <Widget>[
                    new Text("Agama    ",style: new TextStyle(fontSize: 13.0,color: Colors.blue)),
                    new DropdownButton(
                  onChanged: (String value){
                    pilihAgama(value);
                  },
                  value: _agama,
                  items: agama.map((String value){
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )
                  ],
                ),

                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.teal,
                  onPressed: (){
                    _kirimdata();
                  },
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}