import 'package:flutter/material.dart';
import 'package:intern_task/model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget modelDetailCard(Model model,double m1,double m2)
{
  return Column(
    children: [
      SizedBox(height: m1*0.03,),
      Image.asset(model.asset,height: m1*0.13,),
      Align(child: Text(model.heading,overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.02,fontWeight: FontWeight.w500)),),alignment: Alignment.centerLeft,),
      SizedBox(height: m1*0.007,),
      Text(
        model.description,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: m1*0.013,fontWeight: FontWeight.w500)),
      ),
      SizedBox(height: m1*0.01,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Category",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.016,fontWeight: FontWeight.w500)),),
        ],
      ),
      SizedBox(height: m1*0.007,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(m1*0.013)),
            color: Colors.orange,
            elevation: 4,
            child: Container(
              height: m1*0.05,
              child: FlatButton(
                  color: Colors.orange,
                  child:Text(model.title,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: m1*0.017,fontWeight: FontWeight.w500)),),
                  onPressed: null),
            ),
          ),
        ],
      ),
      SizedBox(height: m1*0.007,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
      SizedBox(height: m1*0.007,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(model.duration,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: m1*0.017,fontWeight: FontWeight.w500)),),
        ],
      )
    ],
  );
}

Widget searchBar(double m1,double m2)
{
  return Card(
    color: Colors.grey[300],
    elevation: 10,
    child: Container(
      padding: EdgeInsets.fromLTRB(m2*0.025,0,m2*0.025,0),
      width: m2*0.62,
      height: m1*0.05,
      child: Row(
        children: [
          Icon(Icons.search,color: Colors.black),
          SizedBox(width: m2*0.03,),
          Container(
            width: m2*0.45,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search ads...',
                hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: m1*0.019,fontWeight: FontWeight.w400))
              ),
            ),
          )
        ],
      ),
    ),
  );
}