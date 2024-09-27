import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 15.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width > 700.0
                                      ? 40.0
                                      : 10.0,
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width > 700.0
                                      ? 40.0
                                      : 10.0,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width > 700.0
                                      ? 40.0
                                      : 10.0,
                                  0.0,
                                )),
                            child: Text(
                              'Политика конфиденциальности Сахалин-Маркет\nДата последнего обновления: 13.08.2024\n\nВведение\n\nПриложение Сахалин-Маркет (далее - \"мы\", \"наше\" или \"нас\") уважает вашу конфиденциальность и стремится защитить ваши персональные данные. Эта политика конфиденциальности объясняет, как мы собираем, используем и защищаем вашу личную информацию.\n\nСобираемые данные\n\nМы собираем следующие персональные данные:\n\nИмя\nАдрес электронной почты\nНомер телефона\n\n\nИспользование данных\n\nМы используем ваши персональные данные для:\n\nСвязи с вами\nОформления и обработки заказов\nОтправки электронных писем с информацией о ваших заказах\n\n\nПередача данных третьим лицам\n\nМы передаем ваши данные администраторам заведений, в которых вы делаете заказ, исключительно в целях выполнения вашего заказа.\n\nХранение и защита данных\n\nВаши данные хранятся на серверах Firebase в течение всего срока работы приложения. Мы применяем соответствующие технические и организационные меры для защиты ваших персональных данных.\n\nФайлы cookie\n\nНаше приложение не использует файлы cookie или аналогичные технологии отслеживания.\n\nПрава пользователей\n\nВы имеете право на доступ, исправление и удаление ваших персональных данных. Вы можете самостоятельно удалить все свои данные, воспользовавшись кнопкой \"Удалить профиль\" в вашем личном кабинете.\n\nПолитика в отношении несовершеннолетних\n\nНаше приложение не предоставляет контент, который может нанести вред несовершеннолетним пользователям. Мы не собираем намеренно персональные данные детей младше 13 лет.\n\nИзменения в политике конфиденциальности\n\nМы можем время от времени обновлять нашу политику конфиденциальности. В случае существенных изменений мы уведомим вас по электронной почте.\n\nКонтактная информация\n\nЕсли у вас возникли вопросы или concerns относительно нашей политики конфиденциальности, пожалуйста, свяжитесь с нами по адресу: info@sakhalin-market.ru\n\nСогласие\n\nИспользуя наше приложение, вы соглашаетесь с нашей политикой конфиденциальности.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
