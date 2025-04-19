import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final lastnameController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isChecked = false;

  void onSubmit() {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(lastnameController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: lastnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "hooson bolhguee";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text("Last Name"), hintText: "hollo"),
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == "1") {
                          return "nonono";
                        }
                        return null;
                      },
                      items: const [
                        DropdownMenuItem(
                            value: "1", child: Text("Drop down 1")),
                        DropdownMenuItem(
                            value: "2", child: Text("Drop down 2")),
                        DropdownMenuItem(
                            value: "3", child: Text("Drop down 3")),
                        DropdownMenuItem(
                            value: "4", child: Text("Drop down 4")),
                      ],
                      onChanged: (values) {}),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      const Text("BRO CHI SUGA TEE")
                    ],
                  ),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("submit"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
