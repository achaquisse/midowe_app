import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:midowe_app/utils/constants.dart';
import 'package:midowe_app/utils/helper.dart';
import 'package:midowe_app/views/main_screen/main_screen_view.dart';
import 'package:midowe_app/widgets/primary_button_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: _size.height,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                key: Key("hero_image"),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/images/hero-image.png"),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 0.0),
              constraints: BoxConstraints(minWidth: _size.height * 0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 65,
                  ),
                  Text(
                    "Plataforma de angariação de fundos e apoio a causas sociais",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 1.5,
                      color: Constants.secondaryColor1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  PrimaryButtonIcon(
                      text: "Continuar",
                      icon: Icon(
                        CupertinoIcons.arrow_right,
                      ),
                      onPressed: () => _actionContinue(context)),
                  SizedBox(
                    height: 50.0,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Ao continuar significa que aceita os ",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                            text: "Termos e Condições",
                            style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    "https://midowe.co.mz/termos-e-condicoes";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                                // todo
                              }),
                      ])),
                  SizedBox(
                    height: 45.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _actionContinue(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(Constants.PREF_ACCEPTED_TERMS, true);

    Helper.nextPageNoBack(context, MainScreenView());
  }
}
