import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_exercicio_nota/cad.dart';

class Meucad extends StatefulWidget {
  const Meucad({super.key});

  @override
  State<Meucad> createState() => _MeucadState();
}

class _MeucadState extends State<Meucad> {
  @override

  final enf = SizedBox(height: 200, width: 200, child: Image.asset('assets/imgs/prancheta.png'),);

  TextEditingController nomeController = TextEditingController();
  TextEditingController crmController = TextEditingController();

  bool _residencia = false;
  bool _especializacao = false;
  bool _pos = false;

  bool permitir = false;

  List<String> listaformacao = [];
  List<cadastro> listaCadastro = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Neuroclin", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),), 
        backgroundColor: Colors.green[100]),

        body: SingleChildScrollView(child: Column(children: [
          enf,

          SizedBox(height: 30,),

          TextField(
            controller: nomeController,
            decoration: InputDecoration(
                labelText: "Nome: ", 
                prefixIcon: Icon(Icons.perm_identity_sharp)),
          ),

          SizedBox(height: 30,),

          TextField(
            controller: crmController,
            decoration: InputDecoration(
                labelText: "CRM: ", 
                prefixIcon: Icon(Icons.cases_rounded)),
          ),

          SizedBox(height: 30,),

          Text("Selecione a sua formação: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

          SizedBox(height: 20,),

          Divider(
            thickness: 1.5,
            color: Color.fromARGB(153, 158, 158, 158),
          ),

          SizedBox(height: 20,),

          CheckboxListTile(
            title: Text("Residência: "),
            value: _residencia,
            onChanged: (value) {
               _residencia = value!;
              if (_residencia == true){
                listaformacao.add("Residencia");
              }
              setState(() {});
            },),

          CheckboxListTile(
            title: Text("Especialização: "),
            value: _especializacao,
            onChanged: (value) {
              _especializacao = value!;
              if (_especializacao == true){
                listaformacao.add("especialização");
              }
              setState(() {});
            },),

            CheckboxListTile(
            title: Text("Pós graduação: "),
            value: _pos,
            onChanged: (value) {
              _pos = value!;
              if (_pos == true){
                listaformacao.add("Pós graduação");
              }
              setState(() {});
            },),

           Divider(
            thickness: 1.5, color: Color.fromARGB(153, 158, 158, 158)),

          SwitchListTile(
            title: Text("Permitir chamadas de emergência: "),
            value: permitir,
            onChanged: (value) {
              permitir = value;
              setState(() {});
            },
          ),

          Divider( thickness: 1.5, color: Color.fromARGB(153, 158, 158, 158)),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              ElevatedButton(
                onPressed: () {
                  cadastro c = cadastro(nomeController.text, crmController.text, listaformacao, permitir);
                  listaCadastro.add(c);
                  imprimirDados();
                setState(() {});
              }, child: Text("Cadastrar")),

              SizedBox(width: 20,),

              ElevatedButton(onPressed: () {
                nomeController.clear();
                crmController.clear();

                _residencia = false;
                _especializacao = false;
                _pos = false;

                permitir = false;

                setState(() {});
              }, child: Text("Cancelar")),

          ],)
        ],)),
    );
  }

  void imprimirDados(){ 
    print("=-=-=-=-=--=-=-=-=-=-=-=");
    listaCadastro.forEach((cadastro c){ 
      print("- Nome: " + c.getNome + "\n- CRM: " + c.getCrm );

      for (int c = 0; c < listaformacao.length; c++){
        print("- Formação: " + listaformacao[c]);
      }
      print("- Permitir notificações: " + c.permitir.toString());
    });
  }

}