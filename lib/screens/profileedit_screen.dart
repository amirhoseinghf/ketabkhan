import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/User.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routeName = "/edit";
  User user;

  ProfileEditScreen(this.user);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String name;

  String familyName;

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    Widget userDetails() {
      return Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
              height: 140,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(500)),
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: widget.user.profileImageUrl != null
                      ? Image.network(
                          widget.user.profileImageUrl,
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
          SizedBox(
            height: 10,
          ),
          Text(
            widget.user.name != null
                ? "${widget.user.name} ${widget.user.familyName}"
                : widget.user.userName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    }

    var _formKey = GlobalKey<FormState>();

    Widget formAndStuff() {
      return Container(
        width: 300,
        child: Form(
            key: _formKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("نام"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    style: Theme.of(context).textTheme.headlineSmall,
                    validator: (result) {
                      if (result.isEmpty) return "این فیلد نباید خالی باشد.";
                    },
                    onChanged: (result) {
                      widget.user.name = result;
                    },
                    initialValue: widget.user.name,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("نام خانوادگی"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    style: Theme.of(context).textTheme.headlineSmall,
                    validator: (result) {
                      if (result.isEmpty) return "این فیلد نباید خالی باشد.";
                    },
                    onChanged: (result) {
                      widget.user.familyName = result;
                    },
                    initialValue: widget.user.familyName,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("آدرس تصویر"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    style: Theme.of(context).textTheme.headlineSmall,
                    validator: (result) {
                      if (result.isEmpty) return "این فیلد نباید خالی باشد.";
                    },
                    onChanged: (result) {
                      widget.user.profileImageUrl = result;
                    },
                    initialValue: widget.user.profileImageUrl,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
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
                          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).buttonColor, shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          child: Text("ذخیره", style: Theme.of(context).textTheme.titleMedium,)))
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
        actions: [IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_forward_ios_rounded))],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              userDetails(),
              SizedBox(
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
