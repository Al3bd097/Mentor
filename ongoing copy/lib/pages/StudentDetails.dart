import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentor/models/Students.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key, required this.studentt});
  final Students studentt;

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
      message.recipients.add(userEmail);
      var smtpServer = gmailSaslXoauth2(userEmail, "cztphrwzackkpipv");
      send(message, smtpServer);
      print("Email has been sent successfully");
    } catch (e) {
      print("${e.toString()}");
    }
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(studentt.name)),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                studentt.name,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.mail,
                    size: 50,
                  ),
                  MaterialButton(
                      color: Colors.purple,
                      child: Text(
                        "Sendail",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      onPressed: sendMail),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Grade Project: ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.cookie),
                  Text(
                    "Favorite snack: ${studentt.snack}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.cookie),
                  Text(
                    "Impression: ${studentt.impression}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
