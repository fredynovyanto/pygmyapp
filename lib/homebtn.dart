import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/home.dart';
import 'package:pygmyapp_menu/video_page.dart';

class Homebtn extends StatefulWidget {
  const Homebtn({super.key});

  @override
  State<Homebtn> createState() => _HomebtnState();
}

class _HomebtnState extends State<Homebtn> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:
        TabBarView(controller: _controller, children: [
          Home(),
          const VideoPage("Espresso"),
          const VideoPage("Non Coffee"),
          const VideoPage("Manual Brew"),
      ]),
      bottomNavigationBar: Material(
        color: Colors.brown,
        child: TabBar(controller: _controller, tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.coffee),
            text: "Espresso",
          ),
          Tab(
            icon: Icon(Icons.coffee_maker_outlined),
            text: "Non Coffee",
          ),
          Tab(
            icon: Icon(Icons.coffee_rounded),
            text: "Manual Brew",
          ),
        ]),
      ),
      drawer: const DrawerWidget(),
    );
  }
}

