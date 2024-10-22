import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rules_model.dart';
export 'rules_model.dart';

class RulesWidget extends StatefulWidget {
  const RulesWidget({super.key});

  @override
  State<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends State<RulesWidget> {
  late RulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RulesModel());

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
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Правила использования сервиса Сахалин-Маркет\n\nДанное соглашение определяет условия и правила использования мобильного приложения и сайта для заказа услуг доставки товаров и блюд (далее - Приложение и Сайт), предоставляемых сервисом Сахалин-Маркет (далее - Сервис).\n\nИспользуя Приложение или Сайт, вы соглашаетесь со всеми правилами, условиями и принципами работы Сервиса. Если вы не согласны с настоящим соглашением и правилами пользования Приложения, не используйте его для заказа услуг.\n\nРегистрация и личные данные\nПри регистрации в Приложении и на Сайте вы подтверждаете, что принимаете правила сервиса и даете согласие на обработку своих персональных данных в соответствии с Федеральным законом №152-ФЗ \"О персональных данных\". Регистрация требует указания действующего адреса электронной почты, номера телефона и адреса доставки. Эти данные используются для связи с администраторами заведений, где сделан заказ, а также для отправки уведомлений и сервисных сообщений, необходимых для реализации функционала Приложения и Сайта.\n\nСервис вправе информировать вас о порядке и способах использования Приложения и Сайта, а также о проводимых маркетинговых, рекламных и иных мероприятиях путем направления сообщений на указанные вами электронную почту или телефон.\n\nЗаказы и оплата\nИспользуя Приложение или Сайт, вы размещаете заказ на оказание услуг доставки товаров и блюд среди заведений, использующих Сервис, и получаете информацию о статусе заказа. Оплата заказов осуществляется непосредственно курьерам заведений, указанных в вашем заказе, наличными, картой или через Систему Быстрых Платежей (СБП). Это касается как доставки, так и самовывоза заказов из заведения. Сервис не участвует в процессе оплаты и не несет ответственности за финансовые транзакции между клиентом и заведением.\n\nКонфиденциальность и безопасность данных\nМы принимаем меры для защиты персональных данных пользователей в соответствии с Федеральным законом РФ \"О персональных данных\" №152-ФЗ, включая использование шифрования данных и регулярное обновление мер безопасности. Персональные данные, такие как адрес электронной почты, номер телефона и адрес доставки, используются исключительно для целей регистрации, обработки и выполнения заказов, а также для связи с пользователями.\n\nОграничение ответственности\nСервис предоставляет только право пользования Приложением и Сайтом и не оказывает услуги самой доставки, равно как не несет какой-либо ответственности за оказываемые заведениями услуги и товары. Договор доставки и оплаты по заказу осуществляется непосредственно между клиентом и заведением. Исполнителем по данному договору выступает заведение. Сервис не несет ответственности перед вами или третьими лицами за любой ущерб или убытки, включая косвенные и фактические убытки, понесенные в связи с использованием Приложения или Сайта. Пользователь может оставлять претензии к качеству купленных товаров/блюд в виде отзывов к заведениям и товарам/блюдам.\n\nОбновления и поддержка\nСервис не обязан предоставлять поддержку, обслуживание, обновления, модификации и новые версии Приложения или Сайта. Однако, Сервис может время от времени выпускать обновления для Приложения и Сайта и автоматически обновлять их версии на вашем устройстве. Сервис не гарантирует бесперебойную и безошибочную работу Приложения и Сайта.\n\nПользовательские обязательства\nПри пользовании Приложением или Сайтом вы подтверждаете, что являетесь законным владельцем мобильного телефона или компьютера, на которых установлено Приложение, а также надлежаще зарегистрированным и законным пользователем услуг связи, позволяющих использовать возможности передачи данных. Пользователи обязуются предоставлять достоверные данные при регистрации и заказе. Они несут ответственность за безопасность своих учетных записей и паролей.\n\nБлокировка аккаунта\nАдминистрация Сервиса вправе заблокировать аккаунт пользователя в случае нарушения правил использования Приложения и Сайта. Нарушение может включать, но не ограничивается, предоставлением ложных данных, неправомерным использованием Приложения или Сайта или нарушением условий данного соглашения.\n\nПретензии и санкции\nСервис не несет ответственности за качество оказываемых заведениями услуг и товаров, но может применять к ним различные санкции в случае нарушений прав потребителя в соответствии с законодательством о защите прав потребителей.\n\nПраво на изменение правил\nСервис оставляет за собой право изменять данные Правила использования в любое время. Изменения вступают в силу с момента их публикации в Приложении и на Сайте. Продолжение использования Приложения и Сайта после внесения изменений означает ваше согласие с новыми правилами.\n\nПрименимое законодательство\nНастоящее соглашение регулируется и толкуется в соответствии с законодательством Российской Федерации. Все споры, возникающие в связи с настоящим соглашением, подлежат рассмотрению в судах по месту нахождения Сервиса.\n\nПодтверждая регистрацию в Приложении или на Сайте, вы соглашаетесь с настоящими Правилами использования и обязуетесь их соблюдать.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
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
