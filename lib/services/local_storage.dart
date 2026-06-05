// local_storage.dart es para manejar el almacenamiento local
// de datos en la aplicación utilizando SharedPreferences.
//SharedPreferences es una biblioteca de Flutter que permite almacenar datos de 
//forma persistente en el dispositivo del usuario.
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future configPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
