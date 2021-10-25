
import 'package:flutter/material.dart';

class ReferrallDetail extends StatelessWidget {
  const ReferrallDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Referral'),
          // leading: Icon(Icons.arrow_back_ios, size: 24,color: Colors.black54,)
        ),
        body: profileView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1500,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Profiles details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Container(height: 24,width: 24)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      child: ClipOval(child: Image.asset('assets/images/ava.jpg', height: 150, width: 150, fit: BoxFit.cover,),),
                    ),
                    Positioned(bottom: 1, right: 1 ,child: Container(
                      height: 40, width: 40,
                      child: Icon(Icons.add_a_photo, color: Colors.white,),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Type something about yourself', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone number', style: TextStyle(color:Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone number', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone number', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone number', style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.deepOrange)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container( height: 70, width: 200,
                    child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
