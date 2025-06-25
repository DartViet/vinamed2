import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar_viewmodel.dart';
import 'package:ltdmed/l10n/langvar.dart';
import 'package:ltdmed/models/base_model.dart';

class LanguageService extends ChangeNotifier implements BaseModel {
  static LanguageService? _instance;
  static LanguageService get instance {
    _instance ??= LanguageService();
    return _instance!;
  }

  String _homePage = "";
  String _userInfo = "";
  String _healthRecord = "";
  String _staff = "";
  String _admin = "";
  String _login = "";
  String _logout = "";
  String _email = "";
  String _password = "";
  String _signup = "";
  String _signin = "";
  String _forgotPassword = "";
  String _passwordNotCorrect = "";
  String _welcome = "";
  String _usernameNotValid = "";
  String _confirmPassword = '';
  String _signUp = '';
  String _signupCreateAccount = '';
  String _emailNotValid = '';
  String _passwordNotValid = '';
  String _confirmPasswordNotValid = '';
  String _close = '';
  String _userAccountCreated = '';
  String _fullName = '';
  String _cccdNumber = '';
  String _phoneNumber = '';
  String _address = '';
  String _cmndNumber = '';
  String _dateOfBirth = '';
  String _dateOfIssue = '';
  String _placeOfIssue = '';
  String _gender = '';
  String _userInfoTitle = '';
  String _male = '';
  String _female = '';
  String _selecteDate = '';
  String _title = "";
  String _userInfoScanIDQRCode = '';
  String _qrscanScanning = '';

  String get homePage => _homePage;
  String get userInfo => _userInfo;
  String get healthRecord => _healthRecord;
  String get staff => _staff;
  String get admin => _admin;
  String get login => _login;
  String get logout => _logout;
  String get email => _email;
  String get password => _password;
  String get signup => _signup;
  String get signin => _signin;
  String get forgotPassword => _forgotPassword;
  String get passwordNotCorrect => _passwordNotCorrect;
  String get welcome => _welcome;
  String get usernameNotValid => _usernameNotValid;
  String get confirmPassword => _confirmPassword;
  String get signUp => _signUp;
  String get signupCreateAccount => _signupCreateAccount;
  String get emailNotValid => _emailNotValid;
  String get passwordNotValid => _passwordNotValid;
  String get confirmPasswordNotValid => _confirmPasswordNotValid;
  String get close => _close;
  String get userAccountCreated => _userAccountCreated;

  String get fullName => _fullName;
  String get cccdNumber => _cccdNumber;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get cmndNumber => _cmndNumber;
  String get dateOfBirth => _dateOfBirth;
  String get dateOfIssue => _dateOfIssue;
  String get placeOfIssue => _placeOfIssue;
  String get gender => _gender;
  String get userInfoTitle => _userInfoTitle;
  String get male => _male;
  String get female => _female;
  String get selecteDate => _selecteDate;
  String get title => _title;
  String get userInfoScanIDQRCode => _userInfoScanIDQRCode;
  String get qrscanScanning => _qrscanScanning;

  @override
  Future<void> changeLang(String lang) {
    return _changeLang(lang);
  }

  Future<void> init() async {
    _instance = this;
    await _changeLang(AppbarViewmodel.instance.currentLang); // Default language
    notifyListeners();
  }

  Future<void> _changeLang(String lang) async {
    // This method should be implemented to change the language strings
    // For example, you can fetch the strings from a localization file or service
    _userInfo = await LangUtility.getString(LangVar.userInfo, lang);
    _healthRecord = await LangUtility.getString(LangVar.healthRecord, lang);
    _staff = await LangUtility.getString(LangVar.staff, lang);
    _admin = await LangUtility.getString(LangVar.admin, lang);
    _homePage = await LangUtility.getString(LangVar.homePage, lang);
    _login = await LangUtility.getString(LangVar.commonLogin, lang);
    _logout = await LangUtility.getString(LangVar.commonLogout, lang);
    _email = await LangUtility.getString(LangVar.email, lang);
    _password = await LangUtility.getString(LangVar.password, lang);
    _signup = await LangUtility.getString(LangVar.signUp, lang);
    _signin = await LangUtility.getString(LangVar.signIn, lang);
    _forgotPassword = await LangUtility.getString(LangVar.forgotPassword, lang);
    _passwordNotCorrect = await LangUtility.getString(
      LangVar.passwordNotCorrect,
      lang,
    );
    _welcome = await LangUtility.getString(LangVar.signinpageWelcome, lang);
    _usernameNotValid = await LangUtility.getString(
      LangVar.emailNotValid,
      lang,
    );
    _signUp = await LangUtility.getString(LangVar.signUp, lang);
    _signupCreateAccount = await LangUtility.getString(
      LangVar.signupCreateAccount,
      lang,
    );
    _confirmPassword = await LangUtility.getString(
      LangVar.signupConfirmPassword,
      lang,
    );
    _emailNotValid = await LangUtility.getString(LangVar.emailNotValid, lang);
    _passwordNotValid = await LangUtility.getString(
      LangVar.passwordNotValid,
      lang,
    );
    _confirmPasswordNotValid = await LangUtility.getString(
      LangVar.confirmPasswordNotValid,
      lang,
    );
    _close = await LangUtility.getString(LangVar.close, lang);
    _userAccountCreated = await LangUtility.getString(
      LangVar.userAccountCreated,
      lang,
    );
    _fullName = await LangUtility.getString(LangVar.userInfoFullName, lang);
    _cccdNumber = await LangUtility.getString(LangVar.userInfoCCCD, lang);
    _phoneNumber = await LangUtility.getString(
      LangVar.userInfoPhoneNumber,
      lang,
    );
    _address = await LangUtility.getString(LangVar.userInfoAddress, lang);
    _cmndNumber = await LangUtility.getString(LangVar.userInfoCMND, lang);
    _dateOfBirth = await LangUtility.getString(
      LangVar.userInfoDateOfBirth,
      lang,
    );
    _dateOfIssue = await LangUtility.getString(
      LangVar.userInfoDateIssued,
      lang,
    );
    _placeOfIssue = await LangUtility.getString(
      LangVar.userInfoPlaceIssued,
      lang,
    );
    _gender = await LangUtility.getString(LangVar.userInfoGender, lang);
    _userInfoTitle = await LangUtility.getString(LangVar.userInfo, lang);
    _male = await LangUtility.getString(LangVar.male, lang);
    _female = await LangUtility.getString(LangVar.female, lang);
    _selecteDate = await LangUtility.getString(
      LangVar.userInfoSelectDate,
      lang,
    );
    _title = await LangUtility.getString(LangVar.homePage, lang);
    _userInfoScanIDQRCode = await LangUtility.getString(
      LangVar.userInfoScanIDQRCode,
      lang,
    );
    _qrscanScanning = await LangUtility.getString(LangVar.qrscanScanning, lang);

    notifyListeners();
  }
}
