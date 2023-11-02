import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';

const List<String> list = <String>['Espresso', 'Non Coffee', 'Manual Brew', 'Kopi Susu'];

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _detailController;
  late MenuProvider menuProvider;
  String category = list.first;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _priceController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    _detailController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _detailController.dispose();
    menuProvider.setImagePath("");
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    menuProvider = Provider.of<MenuProvider>(context, listen: false);

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
          const Text("Tambah Menu",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<MenuProvider>(
                      builder: (context, menuProvider, child) =>
                          (menuProvider.imagePath == "")
                              ? Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                )
                              : Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.black),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              menuProvider.imagePath),
                                          fit: BoxFit.cover)),
                                ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {

                            File file = await menuProvider.getImage();
                            if(file.path == ""){
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Image size must be under 1 MB"),
                              ));
                            }
                            String path = await menuProvider.uploadImage(file);
                            menuProvider.setImagePath(path);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              )),
                          child: const Text("Upload Image"),
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () async {
                            menuProvider.setImagePath("");
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                                  backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              )),
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  controller: _nameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter menu name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Nama Menu',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _descriptionController,
                  maxLines: 3,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    if (value.length < 6) {
                      return 'Please enter description min 6 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _detailController,
                  maxLines: 3,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter detail';
                    }
                    if (value.length < 6) {
                      return 'Please enter detail min 6 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Detail',
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
                      bool tambah = await menuProvider.addMenu(_nameController.text, int.parse(_priceController.text), _descriptionController.text, menuProvider.imagePath, category, _detailController.text);
                      if(!tambah) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Can't add menu"),
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

