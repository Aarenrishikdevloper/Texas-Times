

import "package:newsapp/models/categorymodel.dart" ;
List< Categoriemodel> getcatCategory(){
   List<Categoriemodel> mycategory = [];
   Categoriemodel categoriemodel;
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Business";
   categoriemodel.imageurl = "https://images.pexels.com/photos/1181605/pexels-photo-1181605.jpeg?auto=compress&cs=tinysrgb&w=600";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Entertainment";
   categoriemodel.imageurl = "https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "General";
   categoriemodel.imageurl = "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Health";
   categoriemodel.imageurl = "https://plus.unsplash.com/premium_photo-1661685749365-064fad43c907?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Sports";
   categoriemodel.imageurl = "https://media.istockphoto.com/photos/football-soccer-ball-on-grass-field-on-stadium-picture-id1312143573?s=612x612";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Science";
   categoriemodel.imageurl = "https://plus.unsplash.com/premium_photo-1663014611296-1af1ab71aee2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2NpZW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
   mycategory.add(categoriemodel);
   categoriemodel = new Categoriemodel();
   categoriemodel.categorieName = "Technology";
   categoriemodel.imageurl = "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
   mycategory.add(categoriemodel);



   return mycategory;
}
