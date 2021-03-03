import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/main.dart';
import 'package:intern_task/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  Model model;
  DetailsPage(this.model);

  @override
  _DetailsPageState createState() => _DetailsPageState(model);
}

class _DetailsPageState extends State<DetailsPage> {
  Model model;
  String drop = " ";
  _DetailsPageState(this.model);

  int current = 0;

  @override
  Widget build(BuildContext context) {

    double m1 = MediaQuery.of(context).size.height;
    double m2 = MediaQuery.of(context).size.width;

    Image img1 = Image.asset(model.asset);
    Image img2 = Image.asset(model.asset);
    Image img3 = Image.asset(model.asset);

    List<Widget> imgList = [
      img1,img2,img3
    ];
    Color color = Colors.grey[400];

    Widget container(String title, String subtitle) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.015,fontWeight: FontWeight.w500))
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(m1*0.013)),
                elevation: 6,
                color: Colors.orange,
                child: Padding(
                  padding: EdgeInsets.all(m1*0.013),
                  child: Text(
                    subtitle,
                    style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w600))
                  ),
                ),
                ),
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: m1*0.025,
                ),
                Stack(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: m1*0.035,
                      ),
                      CarouselSlider(
                        items: imgList,
                        options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((ind) {
                          int index = imgList.indexOf(ind);
                          return Padding(
                            padding: EdgeInsets.all(m1*0.006),
                            child: CircleAvatar(
                              radius: m1*0.006,
                                backgroundColor: current == index
                                    ? Colors.orange
                                    : Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    ),
                  )
                ]),
                Padding(
                  padding: EdgeInsets.all(m1*0.015),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                              elevation: 4,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(9, 3, 9, 3),
                                child: Text(
                                  "Pending",
                                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.015,fontWeight: FontWeight.w500)),
                                ),
                                color: Colors.blue[400],
                              )),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: model.price.substring(0, 3),
                                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.017,fontWeight: FontWeight.w400)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: model.price.substring(3),
                                        style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.028,fontWeight: FontWeight.w500))
                                    )],
                                ),
                              ),
                              Text(model.duration,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: m1*.017)),)
                            ],
                          )
                        ],
                      ),
                      Align(
                        child: Text(
                          model.heading,
                          style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.025))
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: m1*0.018,
                      ),
                      Align(
                        child: Text(
                          "Description",
                          style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.015))
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: m1*0.016,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ReadMoreText(
                            model.description,
                            style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.017)),
                            trimLines: 2,
                            colorClickableText: Colors.orange,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            moreStyle: TextStyle(
                                fontSize: m1*0.018,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          )),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          container("Category", "Electronic"),
                          container("Sub Category", "Laptop"),
                          container("Type/Make", "Apple")
                        ],
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Align(
                        child: Text(
                          "Ad Location",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.017)),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: m1*0.03,
                          ),
                          SizedBox(
                            width: m1*0.013,
                          ),
                          Container(
                              width: m2*0.8,
                              child: Text(
                                  "Sr No. 280/1A, Sathe Wasti, Lohegaon, Pune ,Maharashtra, India, 411047",
                                style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.017),
                              ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Align(
                        child: Text(
                          "Ad Poster info",
                          style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.017))
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: m1*0.05,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(
                            width: m2*0.04,
                          ),
                          Container(
                            height: m1*0.12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jitendra Chaudhary",style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.019)),),
                                Text(
                                  "Jitendra93266@gmail.com",
                                  style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.016))
                                ),
                                Text(
                                  "9623876634",
                                  style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.016)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: m2*0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: m1*0.05,
                              ),
                              Icon(Icons.mail),
                              SizedBox(
                                height: m1*0.013,
                              ),
                              Icon(Icons.perm_phone_msg)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: m1*0.013,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(m1*0.013)),
                              elevation: 6,
                              color: Colors.green[400],
                              child: Container(
                                  width: m2*0.36,
                                  height: m1*0.06,
                                  child: Center(
                                      child: Text(
                                    "Approve",
                                    style:  GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.019))
                                  ))),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(m1*0.03), topRight: Radius.circular(m1*0.03)),
                                    ),
                                    builder: (context) {
                                      return Container(
                                        height: m1*0.4,
                                        padding: EdgeInsets.all(m1*0.018),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(icon:Icon(Icons.close),onPressed: ()
                                                  {
                                                    Navigator.of(context).pop();
                                                  },),
                                            ),
                                            Text("Approve add", style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: m1*.024))),
                                            SizedBox(height: m1*0.025,),
                                            Text("Are you sure you want to approve this add?",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.017)),),
                                            SizedBox(height: m1*0.025,),
                                            Text("Note: This action will notify user this add is approved and be visible to others",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: m1*.017)),),
                                        SizedBox(height: m1*0.05,),
                                            RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(m1*0.013)),
                                          elevation: 6,
                                          color: Colors.green[400],
                                          child: Container(
                                              width: m2*0.8,
                                              height: m1*0.07,
                                              child: Center(
                                                  child: Text(
                                                    "Approve",
                                                    style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.021))
                                                  ))),
                                        onPressed: (){
                                            Navigator.pop(context);
                                            return showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(m1*0.026)),

                                                  child: Container(
                                                    padding: EdgeInsets.all(m1*.019),
                                                    height: m1*0.34,
                                                    child: Column(
                                                      children: [
                                                        Text("Done!",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.024)),),
                                                        SizedBox(height: m1*0.013,),
                                                        CircleAvatar(
                                                          child: Icon(Icons.check,color: Colors.white,size: m1*0.036,),
                                                          backgroundColor: Colors.green,
                                                          radius: m1*0.04,
                                                        ),
                                                        SizedBox(height: m1*0.013,),
                                                        Text("The add is successfully",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.017)),),
                                                        SizedBox(height: m1*0.013,),
                                                        Text("Approved",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.024)),),
                                                        SizedBox(height: m1*0.018,),
                                                    RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(m1*0.013)),
                                                      elevation: 6,
                                                      color: Colors.green[400],
                                                      child: Container(
                                                          width: m2*0.3,
                                                          height: m1*0.065,
                                                          child: Center(
                                                              child: Text(
                                                                "Okay",
                                                                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.017))
                                                              ))),
                                                    onPressed: ()
                                                      {
                                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                                                      },)
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                        },)
                                          ],
                                        ),
                                      );
                                    });
                              }),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(m1*0.013)),
                              elevation: 6,
                              color: Colors.blue[400],
                              child: Container(
                                  width: m2*0.36,
                                  height: m1*0.06,
                                  child: Center(
                                      child: Text(
                                    "Reject",
                                    style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.02))
                                  ))),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(m1*0.04), topRight: Radius.circular(m1*0.04)),
                                    ),
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState /*You can rename this!*/)
                                        {
                                          return Container(
                                            height: m1*0.45,
                                            padding: EdgeInsets.all(m1*0.019),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: IconButton(icon:Icon(Icons.close),onPressed: ()
                                                  {
                                                    Navigator.of(context).pop();
                                                    setState((){
                                                      color = Colors.grey[400];
                                                      drop = " ";
                                                    });
                                                  },),
                                                ),
                                                Text("Reject add",style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: m1*.024)),),
                                                SizedBox(height: m1*0.016,),
                                                Text("Are you sure you want to reject this add?",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.017)),),
                                                SizedBox(height: m1*0.016,),
                                                Text("Pick add rejection reason.",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.016)),),
                                                SizedBox(height: m1*0.013,),
                                                Card(
                                                  elevation: 3,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(m1*0.013),
                                                    child: DropdownButton<String>(
                                                      value: drop,
                                                      isExpanded: true,
                                                      icon: Icon(Icons.arrow_drop_down),
                                                      iconSize: m1*0.028,
                                                      isDense: true,
                                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 17),
                                                      underline: Container(
                                                        color: Colors.white,
                                                      ),
                                                      onChanged: (String newValue) {
                                                        setState(() {
                                                          drop = newValue;
                                                          color = Colors.blue;
                                                        });
                                                      },
                                                      items: <String>[" ",'The category is mismatch']
                                                          .map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: m1*.018)),),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: m1*0.018,),
                                                Text("Note: This action will notify user the add is rejected.",style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: m1*.017)),),
                                                SizedBox(height: m1*0.018,),
                                                RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(m1*0.013)),
                                                  elevation: 6,
                                                  color: color,
                                                  child: Container(
                                                      width: m2*0.8,
                                                      height: m1*0.065,
                                                      child: Center(
                                                          child: Text(
                                                            "Reject",
                                                            style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.02))
                                                          ))),
                                                  onPressed: (){
                                                    if(color==Colors.blue)
                                                      {
                                                        Navigator.pop(context);
                                                        return showDialog(
                                                            context: context,
                                                            builder: (context) => Dialog(
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(m1*0.026)),

                                                              child: Container(
                                                                padding: EdgeInsets.all(m1*.019),
                                                                height: m1*0.34,
                                                                child: Column(
                                                                  children: [
                                                                    Text("Done!",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.024)),),
                                                                    SizedBox(height: m1*0.013,),
                                                                    CircleAvatar(
                                                                      child: Icon(Icons.check,color: Colors.white,size: m1*0.036,),
                                                                      backgroundColor: Colors.green,
                                                                      radius: m1*0.04,
                                                                    ),
                                                                    SizedBox(height: m1*0.013,),
                                                                    Text("The add is successfully",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.017)),),
                                                                    SizedBox(height: m1*0.013,),
                                                                    Text("Rejected",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: m1*.024)),),
                                                                    SizedBox(height: m1*0.018,),
                                                                    RaisedButton(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(m1*0.013)),
                                                                      elevation: 6,
                                                                      color: Colors.green[400],
                                                                      child: Container(
                                                                          width: m2*0.3,
                                                                          height: m1*0.065,
                                                                          child: Center(
                                                                              child: Text(
                                                                                  "Okay",
                                                                                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: m1*.017))
                                                                              ))),
                                                                      onPressed: ()
                                                                      {
                                                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                                                                      },)
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                                      }

                                                  },)
                                              ],
                                            ),
                                          );
                                        }
                                      );
                                    });
                              }),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
