import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "package:newsapp/models/categorymodel.dart";
import "package:newsapp/helper/data.dart";
import "package:newsapp/models/articlemodel.dart";
import 'dart:convert';
import "package:newsapp/view/articleview.dart";
import "package:newsapp/view/categoryview.dart";

import "package:http/http.dart" as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <Categoriemodel> categories = [];
  List <Articles>newslist = [];
 bool loading = false;
 getnews() async{
    newslist = [];
    setState(() {
      loading = true;
    });
   Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=ee76cc46c3cd41159f734e647240499c");
   var response = await http.get(url);
   var jsondata = jsonDecode(response.body);
   print(jsondata);
   if(jsondata["status"] == "ok"){
      jsondata["articles"].forEach((element){

       Articles article  = Articles(
         title: element["title"],
         description: element["description"],
         urltoimage: element["urlToImage"],
         articleurl: element["url"],
         content:  element["content"],

       );
       newslist.add(article);
      setState(() {
        loading = false;
      });
      print(newslist);


     });
   }
}
  @override
  void initState() {



    // TODO: implement initState
    super.initState();

    categories = getcatCategory();
    getnews();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Texas", style: GoogleFonts.rajdhani(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 25) ,),
            Text("Times", style: GoogleFonts.rajdhani(color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 25) ,),
          ],
        ),
        elevation: 0.0,

      ),
      body: SafeArea(
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
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 70,

                  child: ListView.builder(
                     itemCount:categories.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                       return Categorycard(
                         imgurl: categories[index].imageurl,
                         categoryname: categories[index].categorieName,
                       );
                    }
                  ),


                  ),
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
                        content: newslist[index].content,
                        posturl: newslist[index].articleurl,
                      );

                    },
                  ),
                )
              ],
                ),

            )
          ),
        ),
      );

  }
}
class Categorycard extends StatelessWidget {
   final String imgurl;
   final categoryname;
  const Categorycard({Key? key, required this.imgurl, this.categoryname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
         Navigator.of(context).push( MaterialPageRoute(builder: (context) => Categorieview(category: categoryname.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right:14),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(imgurl, height: 60, width: 120, fit: BoxFit.cover),


            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.5),
                borderRadius:  BorderRadius.circular(5),

              ),
              child: Text(
                  categoryname,
                textAlign: TextAlign.center,
                style: GoogleFonts.rajdhani(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              )
            )
          ],
        )
      ),
    );
  }
}
class Newstile extends StatelessWidget {
  final String imgurl, title, desc , content, posturl;
  const Newstile({Key? key, required this.imgurl, required this.title, required this.desc, required this.content, required this.posturl}) : super(key: key);

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



