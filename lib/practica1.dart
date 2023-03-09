import 'package:flutter/material.dart';

class Practica1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Practica1();
  }
}

class _Practica1 extends State<Practica1>{
  final cantidad = TextEditingController();
  String selectedValue = "indica";

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Indica - 8 USD"),value: "indica"), //8-15
      DropdownMenuItem(child: Text("Sativa - 7 USD"),value: "sativa"), //7-20
      DropdownMenuItem(child: Text("Híbrida - 9 USD"),value: "hibrida"), //8-18
      DropdownMenuItem(child: Text("Kush - 10 USD"),value: "kush"), //10-20
      DropdownMenuItem(child: Text("Skunk - 8 USD"),value: "skunk"), //8-20
      DropdownMenuItem(child: Text("Haze - 11 USD"),value: "haze"), //10-25
      DropdownMenuItem(child: Text("Diesel - 13 USD"),value: "diesel"), //10-20
    ];
    return menuItems;
  }

  void _mostrarVentanaConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Policia'),
          content: Text('Aguas con la policia mijo'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          actions: [
            IconButton(onPressed: (){
              _mostrarVentanaConfirmacion(context);
            }, icon: Icon((Icons.local_police)))
          ],
          title: const Text("Practica 1: Weed Total"),
        ),

        body: Center(
          child: Container(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Image.asset('lib/logo.png', height: 90, width: 90, ),
                ),


                Padding(
                  padding: EdgeInsets.all(60),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: cantidad,
                    decoration: InputDecoration(labelText: "Cantidad (gr)"),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: DropdownButton(
                    value: selectedValue,
                    dropdownColor: Color.fromRGBO(184, 221, 166, 60),
                    items: dropdownItems,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),

                SizedBox(height: 80),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      switch(selectedValue){

                        case "indica": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total indica: ${(double.parse(cantidad.text) * 8)} USD"))); break;
                        case "sativa": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total sativa: ${(double.parse(cantidad.text) * 7)} USD"))); break;
                        case "hibrida": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total hibrida: ${(double.parse(cantidad.text) * 9)} USD"))); break;
                        case "kush": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total kush: ${(double.parse(cantidad.text) * 19)} USD"))); break;
                        case "skunk": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total skunk: ${(double.parse(cantidad.text) * 8)} USD"))); break;
                        case "haze": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total haze: ${(double.parse(cantidad.text) * 11)} USD"))); break;
                        case "diesel": ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total diesel: ${(double.parse(cantidad.text) * 13)} USD"))); break;

                      };
                    }, child: const Text("Calcular"),
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(42, 137, 71, 100))
                    ),

                    SizedBox(width: 30,),

                    ElevatedButton(onPressed: (){
                      cantidad.clear();
                      setState(() {
                        selectedValue = "indica";
                      });
                    }, child: const Text("Limpiar"),
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(42, 137, 71, 100))
                    ),
                  ],
                )
              ],
            ),
          ),
        )


    );
  }
}