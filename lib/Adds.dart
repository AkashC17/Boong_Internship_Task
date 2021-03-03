import 'package:flutter/material.dart';
import 'package:intern_task/details.dart';
import 'package:intern_task/model.dart';
import 'package:intern_task/shared.dart';
import 'package:google_fonts/google_fonts.dart';

class Adds extends StatefulWidget {
  List<Model> models;

  Adds(this.models);

  @override
  _AddsState createState() => _AddsState(models);
}

class _AddsState extends State<Adds> {
  List<Model> models;

  _AddsState(this.models);

  @override
  Widget build(BuildContext context) {

    double m1 = MediaQuery.of(context).size.height;
    double m2 = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 3,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: m2*0.07,
          title: Row(
            children: [
              searchBar(m1,m2),
              SizedBox(
                width: m2*0.03,
              ),
              Text(
                "Ads",
                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.025,fontWeight: FontWeight.w600))
              )
            ],
          ),
          iconTheme: IconThemeData(color: Colors.orange),
        ),
        drawer: Drawer(),
        body: Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Card(
              elevation: 5,
              child: TabBar(
                onTap: (index) {

                },
                tabs: [
                  Tab(child:Text("Pending",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.013,fontWeight: FontWeight.w600)))),
                  Tab(child:Text("Rejected",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.013,fontWeight: FontWeight.w600)))),
                  Tab(child:Text("Approved",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.013,fontWeight: FontWeight.w600)))),
                  Tab(child:Text("All",style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.013,fontWeight: FontWeight.w600)))),
                ],
              ),
            ),

               Container(
                 height: m1*0.79,
                 padding: EdgeInsets.fromLTRB(m2*0.05,5,m2*0.05,5),
                 child: TabBarView(children: [
                  TabView(models,m1,m2),
                  TabView(models,m1,m2),
                  TabView(models,m1,m2),
                  TabView(models,m1,m2),

              ]),
               ),

          ],
        ),
      ),
    );
  }
}

class TabView extends StatefulWidget {
  List<Model> models;

  double m1;
  double m2;

  TabView(this.models,this.m1,this.m2);

  @override
  _TabViewState createState() => _TabViewState(models,this.m1,this.m2);
}

class _TabViewState extends State<TabView> {
  List<Model> models;

  double m1;
  double m2;

  _TabViewState(this.models,this.m1,this.m2);

  Color color;
  String label;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.4*m1/m2*0.6,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0),
          itemCount: models.length,
          itemBuilder: (BuildContext ctx, index) {

            switch(index)
            {
              case 0:
                {
                  color = Colors.blue[400];
                  label = "Pending";
                  break;
                }
              case 1:
                {
                  color = Colors.green[400];
                  label = "Approved";
                  break;
                }
              case 2:
                {
                  color = Colors.red[400];
                  label = "Rejected";
                  break;
                }

            }
            return Card(
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(models[index])));
                        },
                        color: Colors.white,
                        child: modelDetailCard(models[index],m1,m2)
                    ),
                  ),
                  Positioned(
                    height: m1*0.04,
                    width: m2*0.32,
                    left: m2*0.19,
                    child: Card(elevation:4,child: Container(padding: EdgeInsets.fromLTRB(9,3,9,3),child: Text(label,style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),),color: color,)),
                  )
                ],
              ),
            );
          });
  }
}
