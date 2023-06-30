import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../models/User.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routeName = "/edit";
  User user;
  String path;

  ProfileEditScreen(this.user, {Key key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String name;

  String familyName;

  String imageUrl;

  String dropDownMenuValue = "از گالری";

  String profileImagePath = "";

  void pickFromGallery() async {
  XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file != null) {
    widget.path = file.path;
  }

  setState(() {
    widget.user.profileImg = Image.file(File(widget.path));
    widget.user.profileImgPath = file.path;
  });

  }

  void pickFromCamera() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      widget.path = file.path;
      profileImagePath = file.path;
    }
    setState(() {
      widget.user.profileImg = Image.file(File(widget.path));
      widget.user.profileImgPath = file.path;
    });

  }

  @override
  Widget build(BuildContext context) {
    Widget userDetails() {
      return Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Stack(
            children: [
              Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(500)),
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: widget.user.profileImgPath != null
                          ? Image.file(
                              File(widget.user.profileImgPath),
                              fit: BoxFit.contain,
                              // color: Colors.white,
                              height: 5,
                              errorBuilder: (context, child, loadingProgress) =>
                                  Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                                color: Colors.white,
                              ),
                            )
                          : Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                              color: Colors.white,
                            ))),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all()),
                      child: PopupMenuButton<String>(
                        icon: Icon(Icons.edit, color: Colors.black, size: 20,),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem(child: Text("از دوربین", style: TextStyle(fontFamily: "IranSansNum", color: Colors.black),), value: "camera",),
                          PopupMenuItem(child: Text("از گالری", style: TextStyle(fontFamily: "IranSansNum", color: Colors.black),), value: "gallery",),
                        ],
                        onSelected: (result) {
                          switch (result) {
                            case "camera": pickFromCamera(); break;
                            case "gallery": pickFromGallery(); break;
                          }
                        },
                        color: Colors.white,
                      )))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            (widget.user.name != null && widget.user.name != "admin")
                ? "${widget.user.name} ${widget.user.familyName}"
                : widget.user.userName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }

    var formKey = GlobalKey<FormState>();

    Widget formAndStuff() {
      return SizedBox(
        width: 300,
        child: Form(
            key: formKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: const Text("نام"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    style: Theme.of(context).textTheme.headlineSmall,
                    validator: (result) {
                      if (result.isEmpty) return "این فیلد نباید خالی باشد.";
                      return null;
                    },
                    onChanged: (result) {
                      widget.user.name = result;
                    },
                    initialValue:
                        widget.user.name == "admin" ? null : widget.user.name,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: const Text("نام خانوادگی"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    style: Theme.of(context).textTheme.headlineSmall,
                    validator: (result) {
                      if (result.isEmpty) return "این فیلد نباید خالی باشد.";
                      return null;
                    },
                    onChanged: (result) {
                      widget.user.familyName = result;
                    },
                    initialValue: widget.user.familyName == "admin"
                        ? null
                        : widget.user.familyName,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              await Socket.connect("10.0.2.2", 2424)
                                  .then((socket) {
                                var userInfo = widget.user.toJson();
                                var userInfoString = jsonEncode(widget.user,);
                                // userInfo = jsonEncode(object)
                                socket.write("save_info\n${userInfoString}\u0000");
                                socket.listen((event) {
                                  print(event);
                                });
                              });
                              setState(() {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.done_all_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "اطلاعات شما با موفقیت ذخیره شد.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "IranSansNum"),
                                          ),
                                        ],
                                      )),
                                  backgroundColor: Colors.green,
                                ));
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            "ذخیره",
                            style: Theme.of(context).textTheme.titleMedium,
                          )))
                ],
              ),
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SvgPicture.asset(
          'assets/images/ketabkhan.svg',
          height: 27,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              userDetails(),
              const SizedBox(
                height: 12,
              ),
              formAndStuff(),
            ],
          ),
        ),
      ),
    );
  }
}
