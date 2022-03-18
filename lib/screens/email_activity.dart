import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:http/http.dart' as http;

class EmailACtivity extends StatefulWidget {
  const EmailACtivity({Key? key}) : super(key: key);

  @override
  State<EmailACtivity> createState() => _EmailACtivityState();
}

class _EmailACtivityState extends State<EmailACtivity> {

  String alerMessage = 'Verifying...';
  String password = '';
  TextEditingController emailId = new TextEditingController();
  String mailId='';

  void showAlert(String alertMsg){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context)=>
            AlertDialog(
                content:StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return Container(
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 15),
                          Text('$alertMsg' ,style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    );
                  },
                )
            )
    );
  }

  Future<void> sendingRequest(String mailId) async{
    showAlert(alerMessage);
    try{
      http.Response response =
      await http.get(Uri.parse("https://mindmadetech.in/api/forgotpassword/verify_email/$mailId"));
      if(response.statusCode==200){
        if(response.body.contains("Valid Email")){
          setState(() {
            Navigator.pop(context);
            alerMessage = "Generating new password...";
            sendPassword(emailId.text.toString());
            showAlert(alerMessage);
          });
        }else{
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.alternate_email_outlined,color: Colors.white,),
                    Text('  Wrong email address!'),
                  ],
                ),
                backgroundColor: Color(0xffE33C3C),
                behavior: SnackBarBehavior.floating,
              )
          );
        }
      }else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.wifi_outlined,color: Colors.white,),
                  Text('  Something went wrong!'),
                ],
              ),
              backgroundColor: Color(0xffE33C3C),
              behavior: SnackBarBehavior.floating,
            )
        );
      }
    }catch(error){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.wifi_outlined,color: Colors.white,),
                Text('  Something went wrong!'),
              ],
            ),
            backgroundColor: Color(0xffE33C3C),
            behavior: SnackBarBehavior.floating,
          )
      );
    }


  }


  Future<void> sendPassword(String mail) async{
    setState(() {
      password = RandomPasswordGenerator().randomPassword(
          letters: true,
          numbers: true,
          passwordLength: 8,
          specialChar: true,
          uppercase: true
      );
    });
    http.Response response = await http.put(
        Uri.parse('https://mindmadetech.in/api/forgotpassword/reset_password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "Email":mail,
          "Password":password,
        }));
    print(password);
    print(mail);
    if(response.statusCode==200){
      if(response.body.contains("Password Changed Successfully")){
        Navigator.pop(context);
        setState(() {
          alerMessage = "Sending password...";
          passwordToMail(password);
          showAlert(alerMessage);
        });
      }else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.alternate_email_outlined,color: Colors.white,),
                  Text('  Wrong email address!'),
                ],
              ),
              backgroundColor: Color(0xffE33C3C),
              behavior: SnackBarBehavior.floating,
            )
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.wifi_outlined,color: Colors.white,),
                Text('  Something went wrong!'),
              ],
            ),
            backgroundColor: Color(0xffE33C3C),
            behavior: SnackBarBehavior.floating,
          )
      );
    }
  }

  Future<void> passwordToMail(String genPass) async{
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sending mail...'),
        )
    );
    String splitName = emailId.text.toString().split('@').first;

    try{
      SmtpServer smtpServer = SmtpServer('mindmadetech.in')
        ..username = "_mainaccount@mindmadetech.in"
        ..password = "1boQ[(6nYw6H.&_hQ&";

      final equivalentMessage = Message()
        ..from = Address("support@mindmade.in")
        ..recipients.add(Address(emailId.text.toString()))
      // ..ccRecipients.addAll([Address('surya@mindmade.in'),'durgavenkatesh805@gmail.com'])
      // ..bccRecipients.add('bccAddress@example.com')
        ..subject = 'Mindmade Support'
        ..html= "<h3> Dear ${splitName[0].toUpperCase()}</h3>"
            "<p>Greetings from MindMade Customer Support Team!!!</p>"
            "<p>We have received a request to reset the password for your account.</p><br>"
            "<p>Your System generated Password: $genPass</p><br>"
            "<p>To Login,go to https://mm-customer-support-ten.vercel.app/ then enter the following information:</p>"
            "<p>You can change your password once you logged in.</p>"
            "<b>Thanks & Regards,</b><br>"
            "<b>MindMade</b>";

      await send(equivalentMessage, smtpServer);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.done_all,color: Colors.white,),
                Text('  Password sent to mail!'),
              ],
            ),
            backgroundColor: Color(0xff198D0F),
            behavior: SnackBarBehavior.floating,
          )
      );
      setState(() {
        alerMessage = 'Verfying...';
      });

    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.alternate_email_outlined,color: Colors.white,),
                  Text('  Unable to send mail!'),
                ],
              ),
              backgroundColor: Color(0xffE33C3C),
              behavior: SnackBarBehavior.floating,
            )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forget Password'),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon:Icon(CupertinoIcons.back),
          iconSize: 30,
          splashColor: Colors.purpleAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
                height: 220,
                image: AssetImage('assets/images/forgetpass.png')
            ),

            Container(
              height: 55,
              margin: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailId,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    hintText: 'Enter registered e-mail',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        setState(() {
                          emailId.text = "";
                        });
                      },
                      icon: Icon(Icons.close_rounded),
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: 110,
              child: Container(
                height: 45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.blueAccent,
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailId.text.toString());
                    print(emailValid);
                    if(emailValid!=true){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.alternate_email_outlined,color: Colors.white,),
                                Text('  Enter a valid email id!'),
                              ],
                            ),
                            backgroundColor: Color(0xffE33C3C),
                            behavior: SnackBarBehavior.floating,
                          )
                      );
                    }
                    else if(emailId.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.alternate_email_outlined,color: Colors.white,),
                                Text('  Field is empty!'),
                              ],
                            ),
                            backgroundColor: Color(0xffE33C3C),
                            behavior: SnackBarBehavior.floating,
                          )
                      );
                    }else{
                      sendingRequest(emailId.text.toString());

                    }
                  },
                  child:Row(
                    children: [
                      Icon(Icons.done_all , color: Colors.white,),
                      Text('  Verify'  , style: TextStyle(color: Colors.white,),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
