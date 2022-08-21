import 'cache_helper.dart';
import 'cache_strings.dart';

class CacheGet {
  static void init() {
    _getSkipIntro();
    _getSetNotifyAcc();
    _getSetNotifyProm();
    _getSetLang();
    _getSetAdr();
  }

  // ---------- on boarding view (skip) ----------
  static late final bool skipIntro;

  // get
  static void _getSkipIntro() {
    skipIntro = CacheHelper.getBool(key: CacheStrings.skip) ?? false;
  }

  // set
  static void setSkipIntro(bool isSkip) {
    CacheHelper.setBool(key: CacheStrings.skip, value: isSkip);
  }

  // ---------- settings notify ----------
  static late final bool setNotifyAcc;

  // get
  static void _getSetNotifyAcc() {
    setNotifyAcc = CacheHelper.getBool(key: CacheStrings.setNotifyAcc) ?? false;
  }

  // set
  static void setSetNotifyAcc(bool setNotifyAcc) {
    CacheHelper.setBool(key: CacheStrings.setNotifyAcc, value: setNotifyAcc);
  }

  // --------
  static late final bool setNotifyProm;

  // get
  static void _getSetNotifyProm() {
    setNotifyProm = CacheHelper.getBool(key: CacheStrings.setNotifyProm) ?? false;
  }

  // set
  static void setSetNotifyProm(bool setNotifyProm) {
    CacheHelper.setBool(key: CacheStrings.setNotifyProm, value: setNotifyProm);
  }

  // -------- setting lang
  static late final String setLang;

  // get
  static void _getSetLang() {
    setLang = CacheHelper.getString(key: CacheStrings.setLang) ?? 'EN';
  }

  // set
  static void setSetLang(String setLang) {
    CacheHelper.setString(key: CacheStrings.setLang, value: setLang);
  }

  // -------- setting Address
  static late final String setAdr;

  // get
  static void _getSetAdr() {
    setAdr = CacheHelper.getString(key: CacheStrings.setAdr) ?? '';
  }

  // set
  static void setSetAdr(String setAdr) {
    CacheHelper.setString(key: CacheStrings.setAdr, value: setAdr);
  }

}
