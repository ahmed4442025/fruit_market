import 'cache_helper.dart';
import 'cache_strings.dart';

class CacheGet {
  static void init() {
    _getSkipIntro();
    _getSetNotifyAcc();
    _getSetNotifyProm();
    _getSetLang();
    _getSetAdr();
    _getIsLogin();
  }

  // ---------- on boarding view (skip) ----------
  static late bool skipIntro;

  // get
  static void _getSkipIntro() {
    skipIntro = CacheHelper.getBool(key: CacheStrings.skip) ?? false;
  }

  // set
  static void setSkipIntro(bool isSkip) {
    CacheHelper.setBool(key: CacheStrings.skip, value: isSkip);
  }

  // ---------- settings notify ----------
  static late bool setNotifyAcc;

  // get
  static void _getSetNotifyAcc() {
    setNotifyAcc = CacheHelper.getBool(key: CacheStrings.setNotifyAcc) ?? false;
  }

  // set
  static void setSetNotifyAcc(bool setNotifyAcc) {
    CacheHelper.setBool(key: CacheStrings.setNotifyAcc, value: setNotifyAcc);
  }

  // --------
  static late bool setNotifyProm;

  // get
  static void _getSetNotifyProm() {
    setNotifyProm =
        CacheHelper.getBool(key: CacheStrings.setNotifyProm) ?? false;
  }

  // set
  static void setSetNotifyProm(bool setNotifyProm) {
    CacheHelper.setBool(key: CacheStrings.setNotifyProm, value: setNotifyProm);
  }

  // -------- setting lang
  static late String setLang;

  // get
  static void _getSetLang() {
    setLang = CacheHelper.getString(key: CacheStrings.setLang) ?? 'EN';
  }

  // set
  static void setSetLang(String setLang) {
    CacheHelper.setString(key: CacheStrings.setLang, value: setLang);
  }

  // -------- setting Address
  static late String setAdr;

  // get
  static void _getSetAdr() {
    setAdr = CacheHelper.getString(key: CacheStrings.setAdr) ?? '';
  }

  // set
  static void setSetAdr(String setAdr) {
    CacheHelper.setString(key: CacheStrings.setAdr, value: setAdr);
  }

  // -------- Login
  static late bool isLogin;

  // get
  static void _getIsLogin() {
    isLogin = CacheHelper.getBool(key: CacheStrings.isLogin) ?? false;
  }

  // set
  static void setIsLogin(bool islogin) {
    isLogin = islogin;
    CacheHelper.setBool(key: CacheStrings.isLogin, value: islogin);
  }
}
