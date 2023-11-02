import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/admin/menu_page.dart';
import 'package:pygmyapp_menu/admin/video_page.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Pygmy Owl Coffee",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
              ),
        ),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(30),
        itemCount: 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          late String title;
          late IconData icon;
          late VoidCallback onTap;

          switch (index) {
            case 0:
              title = "List Menu";
              icon = Icons.list_alt;
              onTap = () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const MenuPage();
              }));
              break;
            case 1:
              title = "List Video";
              icon = Icons.video_collection_rounded;
              onTap = () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const VideoPage();
              }));
              break;
          }
          return Material(
            borderRadius: BorderRadius.circular(9),
            color: Colors.brown,
            child: InkWell(
              borderRadius: BorderRadius.circular(9),
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        icon,
                        size: 50,
                        color: Colors.white,
                      )
                    ),
                  const SizedBox(height: 20),
                  Text(title, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          );
        },
      ),
      drawer: const DrawerWidget(),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // List video = espresso;
      //   // for(var data in video) {
      //   //   addVideo(data['title'], data['url'], data['category'], data['image']);
      //   // // final videoProvider = Provider.of<VideoProvider>(context, listen: false);
      //   // // videoProvider.getEspresso();
      //   // }
      // }, child: const Icon(Icons.add)),
    );
  }
}
