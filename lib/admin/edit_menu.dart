import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';

const List<String> list = <String>['Espresso', 'Non Coffee', 'Manual Brew'];

class EditMenu extends StatefulWidget {
  const EditMenu({super.key, required this.menu});
  
  final Menu menu;

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _detailController;
  late MenuProvider menuProvider;
  late String category;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _priceController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    _detailController = TextEditingController(text: "");
    category = widget.menu.category;
    
    _nameController.text = widget.menu.name;
    _priceController.text = widget.menu.price.toString();
    _descriptionController.text = widget.menu.description;
    _detailController.text = widget.menu.detail;
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

    // menuProvider.setImagePath(widget.menu.image);
    // category = widget.menu.category;

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
                      builder: (context, menuProvider, child) {
                        if(menuProvider.imagePath == "") {
                          return Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.menu.image),
                                    fit: BoxFit.cover)),
                                
                          );
                        } else {
                          return Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        menuProvider.imagePath),
                                    fit: BoxFit.cover)),
                          );
                        }
                      }
                          // (menuProvider.imagePath == "")
                          //     ? Container(
                          //         width: 200,
                          //         height: 200,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             border: Border.all(color: Colors.black)),
                          //       )
                          //     : Container(
                          //         width: 200,
                          //         height: 200,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(16),
                          //             border: Border.all(color: Colors.black),
                          //             image: DecorationImage(
                          //                 image: NetworkImage(
                          //                     menuProvider.imagePath),
                          //                 fit: BoxFit.cover)),
                          //       ),
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
                  initialSelection: category,
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
                      String image = menuProvider.imagePath;
                      if(image == "") {
                        image = widget.menu.image;
                      }
                      bool edit = await menuProvider.editMenu(widget.menu.menuId, _nameController.text, int.parse(_priceController.text), _descriptionController.text, image, category, _detailController.text);
                      if(!edit) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Can't edit menu"),
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

