import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentor/models/Students.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({Key? key, required this.studentt}) : super(key: key);
  final Students studentt;

  TextEditingController _gradeController = TextEditingController();

  ///
  /// Mail package
  ///
  Future<void> sendMail() async {
    try {
      var userEmail = "willmax097@gmail.com";
      var message = Message();
      message.subject = "subject from flutter";
      message.text = "heyy... sent from flutter";
      message.from = Address(userEmail.toString());
      message.recipients.add("al3bdf@gmail.com");
      var smtpServer = gmail("willmax097@gmail.com", "cztphrwzackkpipv");
      send(message, smtpServer);
      print("Email has been sent successfully");
    } catch (e) {
      print("${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(studentt.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Speaker_Photo-Frame-Anonymous.png",
            width: 300,
            height: 300,
          ),
          Text(
            studentt.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                size: 50,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text(
                  "Send mail",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onPressed: sendMail,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Grade Project: ",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, bottom: 20, top: 20),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter grade',
                  ),
                  controller: _gradeController,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.cookie),
                Text(
                  "Favorite snack: ${studentt.snack}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.cookie),
              Text(
                "Impression: ${studentt.impression}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
