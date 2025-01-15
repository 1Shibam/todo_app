import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            color: Colors.grey,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 40,
                  ),
                ))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.calendar_circle,
                        color: Colors.black,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bell_circle,
                        color: Colors.black,
                        size: 40,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
