
import 'package:camsolution_app/utilities/cam_solution_theme.dart';
import 'package:camsolution_app/utilities/cam_solution_widgets.dart';

import '../sign_up_page/sign_up_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context) => SignUpPageWidget(),
                  ),
                );
              },
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
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.always,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          child: buildCountryPickerDropdown(context),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController1',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          validator: (val) {
                            if(val != null)
                            if (val.isEmpty) {
                              return 'Required';
                            }
                            if(val != null)
                            if (val.length < 8) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.only(left: 12, right: 12),
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
                            suffixIcon: textController1!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => textController1!.clear(),
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: !passwordVisibility,
                        validator: (val) {
                          if(val != null)
                            if (val.isEmpty) {
                              return 'Required';
                            }
                          if(val != null)
                            if (val.length < 6) {
                              return 'Password should be atleast 6 characters';
                            }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: CamsolutionTheme.bodyText1.override(
                            fontFamily: 'NatoSansKhmer',
                            color: Color(0xDC696969),
                            useGoogleFonts: false,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: CamsolutionTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: CamsolutionTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16, 12.5, 16, 12.5),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            if (formkey.currentState!.validate()) {
                              print("Validated");
                            }else{
                              print("Not Validated");
                            }
                          },
                          text: 'Log in',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
