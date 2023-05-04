import 'package:get/get.dart';

import 'app_text_translation.dart';

//Clase que manejara la parte de la internalizacion de la app
//Mas info: https://github.com/jonataslaw/getx#internationalization

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          AppTextTranslation.emailLoginText: "Email",
          AppTextTranslation.passwordLoginText: "Password",
          AppTextTranslation.registerTitleText: "Sing up",
          AppTextTranslation.registerSubTitleText: "Create an account, lt's free",
          AppTextTranslation.emailErrorText: "Enter a valid email address",

          //
          AppTextTranslation.leerDerechosHText: "Read hotel's rights and obligations",
          AppTextTranslation.titleFormularioText: "Hotel registration card",
          AppTextTranslation.nameFieldText: "Name",
          AppTextTranslation.direccionFieldText: "Adress",
          AppTextTranslation.cityFieldText: "City",
          AppTextTranslation.countryFieldText: "Contry",
          AppTextTranslation.phoneFieldText: "Phone",
          AppTextTranslation.errFieldText: "The fields are required",
          AppTextTranslation.errImageFirmaText: "Signature is required",
          AppTextTranslation.succefullText: "Registration Successful",
          AppTextTranslation.searchCountryText: "Search for a country",
          AppTextTranslation.saveCountryCityText: "Save",
          AppTextTranslation.intentarDeNuevoText: "Try again",
          AppTextTranslation.noRegistersText: "No registers",
          AppTextTranslation.errReadRightsAndObligationsText: "It is mandatory to read the Rights and Obligations.",
          AppTextTranslation.firmaText: "Signature",
          AppTextTranslation.viewPdfText: "View PDFs",
        },
        "es_ES": {
          AppTextTranslation.emailLoginText: "Correo",
          AppTextTranslation.passwordLoginText: "Contraseña",

          AppTextTranslation.registerTitleText: "Regístrate",
          AppTextTranslation.registerSubTitleText: "Crear una cuenta, es gratis",
          AppTextTranslation.emailErrorText: "Ingrese un email valido",
          //
          AppTextTranslation.leerDerechosHText: "Leer derechos y obligaciones del hotel",
          AppTextTranslation.titleFormularioText: "Tarjeta de registro hotelero",
          AppTextTranslation.nameFieldText: "Nombre",
          AppTextTranslation.direccionFieldText: "Dirección",
          AppTextTranslation.cityFieldText: "Ciudad",
          AppTextTranslation.countryFieldText: "Pais",
          AppTextTranslation.phoneFieldText: "Teléfono",
          AppTextTranslation.errFieldText: "Los campos son obligatorios",
          AppTextTranslation.errImageFirmaText: "La firma es obligatoria",
          AppTextTranslation.succefullText: "Registro Exitoso",
          AppTextTranslation.searchCountryText: "Buscar un país",
          AppTextTranslation.saveCountryCityText: "Guardar",
          AppTextTranslation.intentarDeNuevoText: "Cargar nuevamente",
          AppTextTranslation.noRegistersText: "No hay registros",
          AppTextTranslation.errReadRightsAndObligationsText: "Es oligatorio leer los Derechos y obligaciones.",
          AppTextTranslation.firmaText: "Firma",
          AppTextTranslation.viewPdfText: "Ver PDFs",
        }
      };
}

// Future<Map<String, String>> decodeTranslation(String assets) async {
//   String jsonString = await rootBundle.loadString(assets);
//   return json.decode(jsonString);
// }
