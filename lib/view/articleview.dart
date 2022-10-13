import 'dart:async';

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:webview_flutter/webview_flutter.dart";

class Articleview extends StatefulWidget {
  final String posturl;
  const Articleview({Key? key, required this.posturl}) : super(key: key);

  @override
  State<Articleview> createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview>{
   final Completer<WebViewController>_completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
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
     body: Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width ,
       child: WebView(
          initialUrl: widget.posturl,
         javascriptMode: JavascriptMode.unrestricted,
         onWebViewCreated: (WebViewController webViewController){
             setState(() {
                _completer.complete(webViewController);
             });
         },
       ),
     )
    );
  }
}
