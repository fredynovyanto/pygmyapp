import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/provider/video_provider.dart';

const List<String> list = <String>['Espresso', 'Non Coffee', 'Manual Brew'];

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _titleController;
  late TextEditingController _urlImageController;
  late TextEditingController _urlVideoController;
  late VideoProvider videoProvider;
  String category = list.first;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: "");
    _urlImageController = TextEditingController(text: "");
    _urlVideoController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _urlImageController.dispose();
    _urlVideoController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    videoProvider = Provider.of<VideoProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Pygmy Owl Coffee",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Tambah Video",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownMenu<String>(
                  width: MediaQuery.of(context).size.width - 40,
                  label: const Text("Category"),
                  inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))),
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      category = value!;
                    });
                  },
                  dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _titleController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _urlImageController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter image url';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Image Url',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _urlVideoController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter video url';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Video Url',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context)
                          .unfocus(); //to hide the keyboard - if any
                      bool tambah = await videoProvider.addVideo(_titleController.text, _urlVideoController.text, category, _urlImageController.text);
                      if(!tambah) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Can't add video"),
                          ));
                      }
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      )),
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}

