import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sms_reg_model.dart';
export 'sms_reg_model.dart';

class SmsRegWidget extends StatefulWidget {
  const SmsRegWidget({super.key});

  @override
  State<SmsRegWidget> createState() => _SmsRegWidgetState();
}

class _SmsRegWidgetState extends State<SmsRegWidget>
    with TickerProviderStateMixin {
  late SmsRegModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmsRegModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerRegController.onStartTimer();
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 15.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 15.0,
                                borderWidth: 2.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x7EF1F4F8),
                                icon: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 32.0),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Logo_23_07.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 130.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).width >= 768.0
                                        ? 430.0
                                        : 530.0,
                                constraints: BoxConstraints(
                                  maxWidth: 570.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: PinCodeTextField(
                                                      autoDisposeControllers:
                                                          false,
                                                      appContext: context,
                                                      length: 4,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      enableActiveFill: false,
                                                      autoFocus: true,
                                                      enablePinAutofill: false,
                                                      errorTextSpace: 16.0,
                                                      showCursor: true,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      obscureText: false,
                                                      hintCharacter: '*',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      pinTheme: PinTheme(
                                                        fieldHeight: 44.0,
                                                        fieldWidth: 44.0,
                                                        borderWidth: 2.0,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        shape: PinCodeFieldShape
                                                            .underline,
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        inactiveColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      controller: _model
                                                          .pinCodeController,
                                                      onChanged: (_) {},
                                                      onCompleted: (_) async {
                                                        if (_model
                                                                .pinCodeController!
                                                                .text ==
                                                            FFAppState()
                                                                .CMSCode) {
                                                          GoRouter.of(context)
                                                              .prepareAuthEvent();
                                                          if ('1234567' !=
                                                              '1234567') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Passwords don\'t match!',
                                                                ),
                                                              ),
                                                            );
                                                            return;
                                                          }

                                                          final user =
                                                              await authManager
                                                                  .createAccountWithEmail(
                                                            context,
                                                            '${FFAppState().UserPhoneNumber}@yandex.ru',
                                                            '1234567',
                                                          );
                                                          if (user == null) {
                                                            return;
                                                          }

                                                          await UserRecord
                                                              .collection
                                                              .doc(user.uid)
                                                              .update(
                                                                  createUserRecordData(
                                                                emailReal:
                                                                    FFAppState()
                                                                        .UserEmail,
                                                                displayName:
                                                                    FFAppState()
                                                                        .UserName,
                                                                phoneNumber:
                                                                    '+7${FFAppState().UserPhoneNumber}',
                                                              ));

                                                          context.pushNamedAuth(
                                                              'main',
                                                              context.mounted);

                                                          FFAppState().CMSCode =
                                                              '';
                                                          FFAppState()
                                                              .UserName = '';
                                                          FFAppState()
                                                              .UserEmail = '';
                                                          safeSetState(() {});
                                                        } else {
                                                          await actions
                                                              .showCustomSnackBarAction2(
                                                            context,
                                                            'Не верный код',
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                          );
                                                        }
                                                      },
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator: _model
                                                          .pinCodeControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  _model.visibleText
                                                      ? 'Введите последние 4 цифры входящего номера телефона'
                                                      : 'Введите код из смс',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Отправить код повторно в СМС через:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      FlutterFlowTimer(
                                                        initialTime: _model
                                                            .timerRegInitialTimeMs,
                                                        getDisplayTime: (value) =>
                                                            StopWatchTimer
                                                                .getDisplayTime(
                                                          value,
                                                          hours: false,
                                                          milliSecond: false,
                                                        ),
                                                        controller: _model
                                                            .timerRegController,
                                                        updateStateInterval:
                                                            Duration(
                                                                milliseconds:
                                                                    1000),
                                                        onChanged: (value,
                                                            displayTime,
                                                            shouldUpdate) {
                                                          _model.timerRegMilliseconds =
                                                              value;
                                                          _model.timerRegValue =
                                                              displayTime;
                                                          if (shouldUpdate)
                                                            safeSetState(() {});
                                                        },
                                                        onEnded: () async {
                                                          _model.blockSendSMS =
                                                              true;
                                                          safeSetState(() {});
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ],
                                              ),
                                              Stack(
                                                children: [
                                                  if (_model.blockSendSMS)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().CMSCode =
                                                            random_data
                                                                .randomInteger(
                                                                    1000, 9999)
                                                                .toString();
                                                        safeSetState(() {});
                                                        _model.visibleText =
                                                            false;
                                                        safeSetState(() {});
                                                        await SendSMSAeroCall
                                                            .call(
                                                          number: FFAppState()
                                                              .UserPhoneNumber,
                                                          text: FFAppState()
                                                              .CMSCode,
                                                        );

                                                        _model
                                                            .timerRegController
                                                            .onResetTimer();

                                                        _model
                                                            .timerRegController
                                                            .onStartTimer();
                                                        _model.blockSendSMS =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                      text: 'Отправить код CMC',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  if (!_model.blockSendSMS)
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Отправить код CMC',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0x66F84F0E),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
