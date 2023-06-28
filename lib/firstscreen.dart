import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/model.dart';
import 'package:todolist/secondpage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _titleController = TextEditingController();
  final _subtitileController = TextEditingController();

  final List<Model> _listitems = [Model(subtitles: "holaa", titles: "haiii")];
  void onsubmit(Model value) {
    if (_titleController.text.isNotEmpty ||
        _subtitileController.text.isNotEmpty) {
      box.put(value.id, value);
    }
    // _listitems.add(value);
  }

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
                    controller: _titleController,
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
                    controller: _subtitileController,
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
                    var title = _titleController.text.trim();
                    var subtitle = _subtitileController.text.trim();
                    setState(() {
                      onsubmit(Model(subtitles: subtitle, titles: title));
                    });
                    Navigator.pop(context);

                    _titleController.clear();
                    _subtitileController.clear();

                    // var titlee = _titleController.text;
                    // var subtitlee = _subtitileController.text;
                    // onsubmit(Model(subtitles: subtitlee, titles: titlee));
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

  @override
  void dispose() {
    _titleController.dispose();
    _subtitileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: IconButton.filledTonal(
      //     onPressed: () {
      //       setState(() {
      //         box.clear();
      //       });
      //     },
      //     icon: const Icon(
      //       Icons.delete_forever,
      //       size: 40,
      //       color: Colors.redAccent,
      //     )),
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
          IconButton(
              onPressed: () {
                setState(() {
                  bottomsheet();
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SecondPage(
        title: _titleController,
        subtitle: _subtitileController,
        list: _listitems,
        showbottom: bottomsheet,
      ),
    );
  }
}
