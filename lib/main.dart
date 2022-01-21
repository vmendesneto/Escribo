import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Escribo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dasafio Técnico - Escribo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  List<String> dataList = [];
  int result = 0;
  int? dado;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.center,
              child: Text(
                "Desafio Técnico - Escribo",
                style: TextStyle(color: Colors.yellow),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(2),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Digite um número inteiro.",
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 35,
                      width: 90,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                      ),
                      child: TextFormField(
                        style: const TextStyle (color: Colors.yellow),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.yellow,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Insira um Número Válido";
                          }
                          return null;
                        },
                        autofocus: true,
                        controller: controller,
                      )),
                  RaisedButton(
                      color: Colors.blue,
                      child: const Text("OK"),
                      textColor: Colors.yellow,
                      onPressed: () {
                        if (controller.text.isEmpty || controller.text == "") {
                          total = 0;
                          return null;
                        } else {
                          total = 0;
                          dataList = [];
                          dado = int.parse(controller.text);
                          int i = 1;
                          for (i; i < dado!; i++) {
                            double res = i / 3;
                            double rest = i / 5;
                            if (res % 1 == 0 || rest % 1 == 0) {
                              total = total + i;
                              dataList.add(i.toString());
                            }
                          }
                          result = total;
                          setState(() {
                            result = result;
                            dataList = dataList;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Os Valores divisiveis por 3 e 5 inferiores ao número informado \n são:",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 40,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (context, int index) {
                        return dataList.toString() != null
                            ? Align(
                                alignment: Alignment.center,
                                child: Text(dataList[index].toString(),
                                    style: const TextStyle(
                                        color: Colors.yellow, fontSize: 25)))
                            : Container();
                      })),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Resultado da soma dos números acima é:",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 90,
                    color: Colors.blue,
                    child: Text(
                      result.toString(),
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 25),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
            ]),
          ),
        ));
  }
}
