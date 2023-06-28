import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
    required this.list,
    required this.showbottom,
  });
  final List<Model> list;
  final void Function() showbottom;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          itemCount: box.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            Model model = box.getAt(index);
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.green[100],
              child: InkWell(
                  onTap: () {
                    setState(() {
                      var task = box.getAt(index);
                      box.putAt(index, task);

                      widget.showbottom();
                    });
                  },
                  child: ListTile(
                    title: Text(
                      model.titles,
                      style: GoogleFonts.anton(letterSpacing: 2),
                    ),
                    subtitle: Text(
                      model.subtitles,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, letterSpacing: 1),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          box.delete(model.id);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
