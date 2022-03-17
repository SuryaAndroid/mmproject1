import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mmcustomerservice/screens/admin/Customer.dart';
import 'package:mmcustomerservice/screens/admin/customerviewpage.dart';
import 'package:mmcustomerservice/screens/change_password.dart';
import 'package:mmcustomerservice/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<GetCustomer> data = [];
  String user='';
  bool clicked = false;

  showAlert(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Container(
              child: AlertDialog(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        color: Colors.red,
                      ),
                      Text(
                        '  Please wait...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )));
        });
  }

  Future<void> CusProfile() async{
    showAlert(context);
    try{
      http.Response response =
      await http.get(Uri.parse("https://mindmadetech.in/api/customers/list/$user"));
      print(response.statusCode);
      if(response.statusCode == 200){
        setState(() {
          List b = jsonDecode(response.body);
          print('List $b');
          data = b.map((e) => GetCustomer.fromJson(e)).toList();
        });
        Navigator.pop(context);
      }else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sever busy! try again later',style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor: Colors.blueAccent,
            behavior: SnackBarBehavior.floating,

          )
        );
      }
    }catch(ex){
      print(ex);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() async{
      var pref = await SharedPreferences.getInstance();
      user = pref.getString('usertypeMail')!;
      CusProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()
            {
            Navigator.pop(context);
            },
          icon:Icon(CupertinoIcons.back,color: Colors.blueAccent,),
          iconSize: 30,
          splashColor: Colors.purpleAccent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: data.isNotEmpty?Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Text(data[0].Email[0].toUpperCase(),style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text(data[0].Email,style: TextStyle(
                          fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(25),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_circle,color: Colors.black54,size: 30,),
                      title: Text('Name'),
                      subtitle: Text(data[0].Email),
                    ),
                    ListTile(
                      leading: Icon(Icons.group_rounded,color: Colors.black54,size: 30,),
                      title: Text('Company'),
                      subtitle: Text(data[0].Companyname),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone,color: Colors.black54,size: 30,),
                      title: Text('Phone Number'),
                      subtitle: Text(data[0].Phonenumber),
                    ),
                    ListTile(
                      leading: Icon(Icons.vpn_key_outlined,color: Colors.black54,size: 30,),
                      title: Text('Password'),
                      subtitle: Text(clicked==true?data[0].Password:"******",style: TextStyle(
                        fontSize: 17
                      ),),
                      trailing: IconButton(
                        onPressed: (){
                          if(clicked==false){
                            setState(() {
                              clicked=true;
                            });
                          }else{
                            setState(() {
                              clicked=false;
                            });
                          }
                        },
                        icon: Icon(Icons.remove_red_eye_outlined,color: clicked==true?Colors.black:Colors.black54,),
                      ),
                    ),
                    Container(
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                          color: Colors.blueAccent,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.forward ,color: Colors.white,),
                              Text(' Change Password',style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ):Container()
      ),
    );
  }
}

