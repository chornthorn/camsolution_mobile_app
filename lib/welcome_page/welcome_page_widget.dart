import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../sign_up_page/sign_up_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEAEFFF),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/home_background.png',
                    ).image,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Image.asset(
                      'assets/images/label.png',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Autospace',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'NatoSansKhmer',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 26, 16, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPageWidget(),
                            ),
                          );
                        },
                        text: 'Sign Up',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'NatoSansKhmer',
                            color: Colors.white,
                            useGoogleFonts: false,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'Log into Autospace',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                    child: Image.network(
                      'https://picsum.photos/seed/940/600',
                      width: 28,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xB3000000),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
                      child: Text(
                        'Skip',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'NatoSansKhmer',
                          color: Color(0xFFEAEFFF),
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
