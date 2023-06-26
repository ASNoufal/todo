import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/secondpage.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void bottomsheet() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) => Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Title......",
                          fillColor: Color.fromARGB(255, 202, 173, 173),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      maxLength: 50,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: "Say something......",
                          fillColor: Color.fromARGB(255, 202, 173, 173),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 330,
                      height: 70,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 121, 103, 103),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Sumbit",
                        style: GoogleFonts.capriola(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: Colors.green[300],
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "images/IMG_5536.HEIC",
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: bottomsheet, icon: const Icon(Icons.add))
        ],
      ),
      body: const SecondPage(),
    );
  }
}
