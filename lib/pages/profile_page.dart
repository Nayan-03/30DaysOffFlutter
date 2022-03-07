import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = (await ImagePicker.platform.pickImage(source: ImageSource.camera))
          as File;
    } else {
      image = (await ImagePicker.platform
          .pickImage(source: ImageSource.gallery)) as File;
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Text("Profile"),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: _image == null
                                ? const NetworkImage(
                                    "https://i.pinimg.com/474x/77/5b/91/775b91d4b1bfcac2aa3292b47763c1b1.jpg")
                                : Image.file(_image!) as ImageProvider
                            ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((Builder) => bottomSheet(context)));
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Full Name ", " "),
              buildTextField("Email", " "),
              buildTextField("Phone", " "),
              buildTextField("Profession", " "),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("CANCEl",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.orange.shade900,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("SAVE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String labalText,
    String placeholder,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
            labelText: labalText,
            labelStyle: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,fillColor: Colors.white,
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade900,
            )),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Picture",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.camera),
                    onPressed: () {
                      getImage(true);
                    },
                  ),
                  Container(
                    child: const Text("Camera",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      getImage(true);
                    },
                  ),
                  Container(
                    child: const Text("Gallery",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
