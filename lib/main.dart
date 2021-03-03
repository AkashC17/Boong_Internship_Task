import 'package:flutter/material.dart';
import 'package:intern_task/Adds.dart';
import 'package:intern_task/details.dart';
import 'package:intern_task/model.dart';
import 'package:intern_task/shared.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Model car  = Model("assets/car.jpeg", "Car for sale","The car is for sale at.", "Cars", "OMR 225", "1 day ago",);
  Model mac = Model("assets/mac.jpeg","MacBook 2016 on sale","Latest laptop at cheap price. 512 tb storage, 32 GB ram, latest processor. Used only for one month. Great deal grab it quickly will not find.... ","Electronic","OMR 2125","1 day ago");


  @override
  Widget build(BuildContext context) {

    double m1 = MediaQuery.of(context).size.height;
    double m2 = MediaQuery.of(context).size.width;

    List<Model> models = [car,mac,mac];

    Widget card1(String text, Icon icon, int no,Color color)
    {
      return RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              color: color,
              child: Container(
                width: m2*0.2,
                height: m1*0.16,
                padding: EdgeInsets.fromLTRB(m2*0.003, m1*0.009, m2*0.003, m1*0.009),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon,
                          Text("$no",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.03,fontWeight: FontWeight.w600)),)
                        ],
                      )
                    ]),
              ),
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Adds(models)));
              });
    }

    Widget card2(String text, Color color)
    {
      return RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(m1*0.013)),
          elevation: 4,
          color: color,
          child:Container(width:m2*0.2,child: Center(child: Text(text,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),))),
          onPressed:(){});
    }



    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.orange),
          title: Text("                               Dashboard",style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.023,fontWeight: FontWeight.w600))),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(m2*0.04,0,m2*0.04,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    searchBar(m1,m2),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(m1*0.013)),
                      elevation: 6,
                            color: Colors.orange,
                            child:Text("View all adds",style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.011,fontWeight: FontWeight.w500)),),
                              onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Adds(models)));
                              }),
                  ],
                ),
                SizedBox(height: m1*0.02,),
                Row(
                  children: [
                    Text("Total adds",textAlign: TextAlign.start,style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.018,fontWeight: FontWeight.w500)),),
                  ],
                ),
                SizedBox(height: m1*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card1("Approved ads", Icon(Icons.check,color: Colors.white,),3,Colors.green),
                    card1("Rejected adds",Icon(Icons.close,color: Colors.white,),1,Colors.blue),
                    card1("Pending adds",Icon(Icons.assignment_rounded,color: Colors.white,),1,Colors.orange)
                  ],
                ),
                SizedBox(height: m1*0.01,),
                Divider(thickness: 1,),
                SizedBox(height: m1*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pending by categories",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.018,fontWeight: FontWeight.w500)),),
                    GestureDetector(child: Text("See more",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.green,fontSize: m1*0.018,fontWeight: FontWeight.w500)),),
                    onTap: (){},)
                  ],
                ),
                SizedBox(height: m1*0.007,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          card2("Cars",Colors.green),
                          card2("Properties",Colors.blue[400]),
                          card2("Jobs",Colors.orange[400])
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          card2("Electronic",Colors.green),
                          card2("Mobile",Colors.blue[400]),
                          card2("Watches",Colors.orange[400])
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          card2("Laptops",Colors.green),
                          card2("Lands",Colors.blue[400]),
                          card2("Apple",Colors.orange[400])
                        ]
                    )
                  ]
                ),
                Divider(thickness: 1,),
                SizedBox(height: m1*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pending adds",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.018,fontWeight: FontWeight.w500)),),
                    GestureDetector(child: Text("See more",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.green,fontSize: m1*0.018,fontWeight: FontWeight.w500)),),
                    onTap: (){},)
                  ],
                ),
                SizedBox(height: m1*0.008,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Stack(
                    children: [
                      Container(
                        height: m1*0.4,
                        width: m2*0.43,
                        child:
                        FlatButton(
                          onPressed: ()
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(car)));
                            },
                            color: Colors.white,
                            child: card3(car,m1,m2)
                        ),
                      ),
                      Positioned(
                        height: m1*0.04,
                        width: m2*0.32,
                        left: m2*0.22,
                        child: Card(elevation:4,child: Container(padding: EdgeInsets.fromLTRB(9,3,9,3),child: Text("Pending",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),),color: Colors.blue[400],)),
                      )
                    ],
                  ),
                ),
            Card(
              color: Colors.white,
              elevation: 4,
              child: Stack(
                children: [
                  Container(
                    // padding: EdgeInsets.all(8),
                    height: m1*0.4,
                    width: m2*0.43,
                    child:
                    FlatButton(
                        onPressed: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(mac)));
                        },
                        color: Colors.white,
                        child: card3(mac,m1,m2)
                    ),
                  ),
                  Positioned(
                    height: m1*0.04,
                    width: m2*0.32,
                    left: m2*0.22,
                    child: Card(elevation:4,child: Container(padding: EdgeInsets.fromLTRB(9,3,9,3),child: Text("Pending",style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),),color: Colors.blue[400],)),
                  )
                ],
              ),
            )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
