import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/CustomLoginTypeBtn.dart';
import 'package:ourESchool/UI/Widgets/LoginRoundedButton.dart';
import 'package:ourESchool/UI/Widgets/ReusableRoundedButton.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/pages/Profiles/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'MobileLoginPage.dart';

enum ButtonType { LOGIN, REGISTER }

class LoginPage extends StatefulWidget {
  static String loginTypeSelected = 'S';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String idHint = string.student_id;
  bool isRegistering = false;
  String notYetRegisteringText = string.not_registered;
  ButtonType buttonType = ButtonType.LOGIN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: TopBar(
        title: string.login,
        child: kBackBtn,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Hero(
                  tag: 'mobile',
                  transitionOnUserGestures: true,
                  child: ReusableRoundedButton(
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    // text: 'Mobile',
                    onPressed: () {
                      kopenPageBottom(
                        context,
                        MobileLoginPage(),
                      );
                    },
                    height: 50,
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ),
            ),
            LoginRoundedButton(
              label:
                  buttonType == ButtonType.LOGIN ? string.login : string.register,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (id) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.school_name_code_hint,
                    labelText: string.school_name_code,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (id) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.student_teacher_id_hint,
                    labelText: idHint,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomLoginTypeBtn(
                  onPressed: () {
                    if (LoginPage.loginTypeSelected == 'S') {
                      setState(() {
                        idHint = string.student_id;
                      });
                    }
                    if (LoginPage.loginTypeSelected == 'PT') {
                      setState(() {
                        idHint = string.student_or_teacher_id;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (email) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.email_hint,
                    labelText: string.email,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (password) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.password_hint,
                    labelText: string.password,
                  ),
                ),
                isRegistering
                    ? SizedBox(
                        height: 15,
                      )
                    : Container(),
                isRegistering
                    ? TextField(
                        obscureText: true,
                        onChanged: (password) {},
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: string.password_hint,
                          labelText: string.confirm_password,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 15,
                ),
                Hero(
                  tag: 'otpForget',
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ReusableRoundedButton(
                          child: Text(
                            notYetRegisteringText,
                            style: TextStyle(
                              // color: kmainColorTeacher,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            // cardKey.currentState.toggleCard();
                            setState(() {
                              if (buttonType == ButtonType.LOGIN) {
                                buttonType = ButtonType.REGISTER;
                              } else {
                                buttonType = ButtonType.LOGIN;
                              }
                              isRegistering = !isRegistering;
                              notYetRegisteringText = isRegistering
                                  ? string.regidtered
                                  : string.not_registered;
                            });
                          },
                          height: 40,
                        ),
                        ReusableRoundedButton(
                          child: Text(
                            string.need_help,
                            style: TextStyle(
                              // color: kmainColorTeacher,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            //Forget Password Logic
                            kopenPage(context, ForgotPasswordPage());
                          },
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}