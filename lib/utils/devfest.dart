import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Devfest {
  static const String app_name = "DevFest LATAM 2020";
  static const String app_version = "Version 0.0.1";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;

  // * Url related
  static String baseUrl = "https://storage.googleapis.com/gdg-devfest";

  static checkDebug() {
    assert(() {
      // baseUrl = "http://127.0.0.1:8000/gdg-devfest/";
      // * Change with your local url if any
      baseUrl = "https://storage.googleapis.com/gdg-devfest";
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Images
  static const String home_img = "assets/images/home_img.jpeg";
  static const String banner_light = "assets/images/banner_light.png";
  static const String banner_dark = "assets/images/banner_dark.png";

  //*  Texts
  static const String welcomeText = "Bienvenid@ a DevFest 2020";
  static const String descText = '''Los DevFests son eventos para desarrolladores organizados por las comunidades llamadas Grupos de Desarrolladores de Google (GDGs) alrededor del mundo. Los GDG se enfocan en el desarrollo de la comunidad local aprendiendo tecnologías de Google y más.''';

  static const String loading_text = "Cargando...";
  static const String try_again_text = "Intentalo de nuevo";
  static const String some_error_text = "Ha ocurrido un error";
  static const String signInText = "Registrarse";
  static const String signInGoogleText = "Iniciar sesión con Google";
  static const String signOutText = "Cerrar Sesión";
  static const String wrongText = "Algo anda mal";
  static const String confirmText = "Confirmar";
  static const String supportText = "Ayuda";
  static const String featureText = "Solicitar una Caracteristica";
  static const String moreFeatureText = "Más sorpresas están en camino.";
  static const String updateNowText = "Actualiza la app para una mejor experiencia.";
  static const String checkNetText = "Parece que has perdido tu conexión a Internet.";

  //* ActionTexts
  static const String agenda_text = "Agenda";
  static const String speakers_text = "Speakers";
  static const String team_text = "Equipo";
  static const String sponsor_text = "Sponsors";
  static const String faq_text = "Preguntas Frecuentes";
  static const String map_text = "Mapa";

  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String displayNamePref = "displayNamePref";
  static const String emailPref = "emailPref";
  static const String phonePref = "phonePref";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";

  //* JSON URLS
  static const String speakersAssetJson = "assets/json/speakers.json";
  static const String sessionsAssetJson = "assets/json/sessions.json";
  static const String teamsAssetJson = "assets/json/teams.json";
}
