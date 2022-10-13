import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:newsapp/models/articlemodel.dart";
import 'dart:convert';
import 'package:newsapp/models/categorynews.dart';
import "package:google_fonts/google_fonts.dart";
import "package:newsapp/view/articleview.dart";


import "package:http/http.dart" as http; 
class Categorieview extends StatefulWidget {
  const Categorieview({Key? key, required this.category}) : super(key: key);
 final String category;
  @override
  State<Categorieview> createState() => _CategorieviewState();
}

class _CategorieviewState extends State<Categorieview> {

  List<news> newslist = [];
  bool loading = false;
   getcategory(category) async{
     setState(() {
       loading = true;
     });
      Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ee76cc46c3cd41159f734e647240499c");

      var response = await http.get(url);
      var jsondata = json.decode(response.body);

        print(jsondata);
        jsondata["articles"].forEach((element){
          news cat = news(
            title:  element["title"],
            description: element["description"],
            urltoimage: element["urlToImage"],
            articleurl: element["url"],

          );
          newslist.add(cat);
          setState(() {
            loading = false;
          });

        });



       

  }









@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategory(widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Texas", style: GoogleFonts.rajdhani(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 25) ,),
            Text("Times", style: GoogleFonts.rajdhani(color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 25) ,)
          ],

        ),
        actions: [
          Opacity(opacity: 0,

          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.abc),
          )
        ],
        leading: IconButton(

          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        elevation: 0.0,


      ),
      body:SafeArea(
        child: loading ? Container(
        child: Center(
        child: CircularProgressIndicator(color: Colors.orange),
    ),
    ):
    SingleChildScrollView(
    child: Container(
    child: Column(
    children: [
    Container(
    margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: newslist.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index){
          return Newstile(
            imgurl: newslist[index].urltoimage ,
            title: newslist[index].title,
            desc: newslist[index].description,

            posturl: newslist[index].articleurl,
          );

        },
      ),

    )
    ] ,
      )
    )
    )
      )
    );
  }
}
class Newstile extends StatelessWidget {
  final String imgurl, title, desc , posturl;
  const Newstile({Key? key, required this.imgurl, required this.title, required this.desc,  required this.posturl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Articleview(posturl: posturl)));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(imgurl, height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),

                ),
                SizedBox(height: 12,),
                Text(
                  title,
                  style: GoogleFonts.rajdhani(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700), maxLines: 2,
                ),
                SizedBox(height: 4,),
                Text(
                  desc,
                  style: GoogleFonts.rajdhani(color: Colors.black54, fontSize: 14, ), maxLines: 2,
                ),
              ],
            ),
          ),

        )
    );
  }
}

