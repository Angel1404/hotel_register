// import 'package:shared_preferences/shared_preferences.dart';

// import '../../routes/app_pages.dart';

// class PreferenciasUsuario {
//   static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

//   factory PreferenciasUsuario() {
//     return _instancia;
//   }

//   PreferenciasUsuario._internal();

//   late SharedPreferences _prefs;

//   initPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   // GET y SET del Unbording
//   bool get unBording {
//     return _prefs.getBool('unBording') ?? false;
//   }

//   set unBording(bool value) {
//     _prefs.setBool('unBording', value);
//   }

//   // GET y SET de la ultima pg
//   String get ultimaPagina => _prefs.getString('ultimaPagina') ?? Routes.HOME;

//   set ultimaPagina(String value) => _prefs.setString('ultimaPagina', value);
//   // GET y SET de la ultima pg
//   String get email => _prefs.getString('email') ?? ' ';

//   set email(String value) {
//     _prefs.setString('email', value);
//   }

//   // GET y SET password
//   String get password => _prefs.getString('password') ?? ' ';

//   set password(String value) {
//     _prefs.setString('password', value);
//   }

//   // GET y SET ListPdfs
//   List<String>? get pdfsList => _prefs.getStringList('rateApp') ?? [];

//   set pdfsList(List<String>? values) {
//     _prefs.setStringList('rateApp', values ?? []);
//   }

//   Future clearPref() async {
//     await _prefs.clear();
//   }
// }
