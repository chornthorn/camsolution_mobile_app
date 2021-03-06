import 'package:camsolution_app/utilities/cam_solution_theme.dart';
import 'package:camsolution_app/utilities/cam_solution_widgets.dart';


import '../login_page/login_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key? key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
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
                  'Log in',
                  style: CamsolutionTheme.bodyText1.override(
                    fontFamily: 'NatoSansKhmer',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Sign Up',
                        style: CamsolutionTheme.bodyText1.override(
                          fontFamily: 'NatoSansKhmer',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.only(top: 0, bottom: 0,right: 8),
                        child: buildCountryPickerDropdown(context),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          validator: (val) {
                            if(val !=  null)
                            if (val.isEmpty) {
                              return 'Required';
                            }
                            if(val !=  null)
                            if (val.length < 8) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.only(left: 12,right: 12),
                            hintStyle: CamsolutionTheme.bodyText1.override(
                              fontFamily: 'NatoSansKhmer',
                              color: Color(0xFF696969),
                              useGoogleFonts: false,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            suffixIcon: textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => textController!.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: CamsolutionTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Validated");
                          }else{
                            print("Not Validated");
                          }
                        },
                        text: 'Continue',
                        options: FFButtonOptions(
                          width: 130,
                          height: 45,
                          color: CamsolutionTheme.primaryColor,
                          textStyle: CamsolutionTheme.subtitle2.override(
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
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: CamsolutionTheme.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Continue with Facebook',
                              style: CamsolutionTheme.bodyText1.override(
                                fontFamily: 'NatoSansKhmer',
                                color: Colors.white,
                                useGoogleFonts: false,
                              ),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xFF313131),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.apple,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Continue with  Apple',
                              style: CamsolutionTheme.bodyText1.override(
                                fontFamily: 'NatoSansKhmer',
                                color: Colors.white,
                                useGoogleFonts: false,
                              ),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Continue with Google',
                              style: CamsolutionTheme.bodyText1.override(
                                fontFamily: 'NatoSansKhmer',
                                color: Colors.black,
                                useGoogleFonts: false,
                              ),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
