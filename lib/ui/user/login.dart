import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple/constants/local_data.dart';
import 'package:simple/constants/strings.dart';
import 'package:simple/ui/widgets/empty_app_bar_widget/empty_app_bar_widget.dart';
import 'package:simple/modules/app_localizations.dart';
import 'package:simple/ui/widgets/app_icon_widget/app_icon_widget.dart';
import 'package:simple/ui/widgets/textfield_widget/textfield_widget.dart';
import 'package:simple/routes.dart';
import 'package:simple/stores/user/login/login_store.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userMobileController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _loginStore = LoginStore();

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userMobileController.addListener(() {
      //this will be called whenever user types in some value
      _loginStore.setUserMobile(_userMobileController.text);
    });
    _userPasswordController.addListener(() {
      //this will be called whenever user types in some value
      _loginStore.setPassword(_userPasswordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userMobileController.dispose();
    _userPasswordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginStore.setContext(context);
    LocalData().loginId = "91" + _loginStore.userMobile;

    return Scaffold(
      backgroundColor: Colors.white,
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBackgroundImage(),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: EmptyAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              _buildBodyWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBodyWidgets() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
        child: Column(
          children: <Widget>[
            InkWell(
                onTap: () => launch(Strings.appName),
                child: AppIconWidget(image: 'assets/images/logo.png')),
            SizedBox(height: 50.0),
            _buildUserMobileField(),
            SizedBox(height: 20.0),
            _buildPasswordField(),
            SizedBox(height: 30.0),
            _signInWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMobileField() {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                border: Border.all(color: Colors.black54, width: 1.0)),
            child: TextFieldWidget(
              hint: AppLocalizations.instance.text('login_et_user_mobile'),
              inputType: TextInputType.phone,
              maxLength: 10,
              padding: EdgeInsets.only(bottom: 5.0, left: 15.0),
              textController: _userMobileController,
              inputAction: TextInputAction.next,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(10)
              ],
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              errorText: _loginStore.loginErrorStore.userMobile,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildPasswordField() {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  border: Border.all(color: Colors.black54, width: 1.0)),
              child: TextFieldWidget(
                hint: AppLocalizations.instance.text('login_et_user_password'),
                isObscure: true,
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0),
                textController: _userPasswordController,
                focusNode: _passwordFocusNode,
                errorText: _loginStore.loginErrorStore.password,
              )),
        ],
      );
    });
  }

  Widget _signInWidget() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        height: 50.0,
        minWidth: 200.0,
        child: RaisedButton(
          onPressed: () async {
            navigate(context);
          },
          child: Text(
            AppLocalizations.instance.text('login_btn_sign_in'),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
          textColor: Colors.white,
          elevation: 0.0,
          color: Colors.green[400],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.dashboard, (Route<dynamic> route) => false);
      });
    });

    return Container();
  }
}
