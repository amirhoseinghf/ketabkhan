import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  Widget userProfile(String imageUrl, contactName, BuildContext ctx) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  border: Border.all(width: 5, color: Colors.white)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            height: 10,
          ),
          Text(
            contactName,
            style: Theme.of(ctx).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget socialMedia(String imageUrl, String name, BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white, width: 7)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget sharingCard(String name, IconData icon, BuildContext context) {
        return Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.black),
              Text(name, style: TextStyle(color: Colors.black, fontFamily: "IranSansNum"),)
            ],),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.lightbulb,
                        size: 30,
                        color: Colors.amber,
                      )),
                  Column(
                    children: [
                      Text(
                        "این کتاب را به اشتراک بگذارید",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // padding: EdgeInsets.all(10),
                  children: [
                    userProfile(
                        "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/124612165/original/9932dc2091407d92e8c977db7efd24acb69429f3/design-a-minimalist-flat-cartoon-profile-picture-or-avatar.jpg",
                        "جولی",
                        context),
                    SizedBox(
                      width: 12,
                    ),
                    userProfile(
                        "https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png",
                        "کوین",
                        context),
                    SizedBox(
                      width: 12,
                    ),
                    userProfile(
                        "https://cdn.dribbble.com/userupload/5970731/file/original-299de2b20afe5a044d4eac7eb4bc2ac8.jpg?compress=1&resize=1200x900",
                        "ممدرضا",
                        context),
                    SizedBox(
                      width: 12,
                    ),
                    userProfile(
                        "https://cdn.dribbble.com/userupload/4096169/file/original-d238579cef69c71f9c3b54cbac87f130.jpg?compress=1&resize=1200x900",
                        "سامان",
                        context),
                  ],
                ),
              ),
              Divider(
                  color: Colors.blueGrey,
                  indent: 5,
                  endIndent: 5,
                  thickness: 1),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    socialMedia("https://cdn1.iconfinder.com/data/icons/social-media-2285/512/Colored_Facebook3_svg-512.png", "فیسبوک", context),
                    SizedBox(width: 20,),
                    socialMedia("https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Instagram_colored_svg_1-512.png", "اینستاگرام", context),
                    SizedBox(width: 20,),
                    socialMedia("https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Whatsapp2_colored_svg-512.png", "واتساپ", context),
                    SizedBox(width: 20,),
                    socialMedia("https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Twitter3_colored_svg-512.png", "توییتر", context)
                  ],
                ),
              ),
              sharingCard("کپی", Icons.copy, context),
              SizedBox(height: 15,),
              sharingCard("ارسال با ایمیل", Icons.mail_outline_rounded, context),
              SizedBox(height: 15,),
              sharingCard("افزودن به علاقه مندی ها", Icons.favorite_border_rounded, context)

            ],
          ),
        ),
      ),
    );
  }
}
