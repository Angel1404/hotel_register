import 'package:get/get.dart';

import 'app_text_translation.dart';

//Clase que manejara la parte de la internalizacion de la app
//Mas info: https://github.com/jonataslaw/getx#internationalization

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          AppTextTranslation.loginText: "Sing In",
          AppTextTranslation.welcomeLoginText: "Hello Again!",
          AppTextTranslation.welcomeLoginLargeText: "Wellcome back you´ve been missed!",
          AppTextTranslation.recoveryPasswordLoginText: "Recovery Password",
          AppTextTranslation.emailLoginText: "Email",
          AppTextTranslation.passwordLoginText: "Password",
          AppTextTranslation.orContinueWithLoginText: "Or continue with",
          AppTextTranslation.notMemberLoginText: "Not a member? ",
          AppTextTranslation.registerNowLoginText: "Register now",
          AppTextTranslation.confirmPasswordText: "Confirm Password",
          AppTextTranslation.newPasswordText: "New password",
          AppTextTranslation.resetPasswordText: "Resset passwod",
          AppTextTranslation.resetPasswordDescriptionText:
              "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
          AppTextTranslation.resetPasswordBtnText: 'Send Instructions',
          AppTextTranslation.createPasswordText: 'Create new passwod',
          AppTextTranslation.createPasswordDescriptionText: "Your new password must be different from previous used passwords.",
          AppTextTranslation.createPasswordBtnText: "Reset Password",
          AppTextTranslation.errorConfirmPasswordText: "Passwords do not match",
          AppTextTranslation.errorConfirmPasswordTextEmpty: "Enter a valid password",
          AppTextTranslation.registerTitleText: "Sing up",
          AppTextTranslation.registerSubTitleText: "Create an account, lt's free",
          AppTextTranslation.emailErrorText: "Enter a valid email address",
          AppTextTranslation.loadingText: "Loading...",

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
          AppTextTranslation.loginText: "Iniciar sesión",
          AppTextTranslation.welcomeLoginText: "Hola de Nuevo!",
          AppTextTranslation.welcomeLoginLargeText: "Bienvenido de nuevo, ¡te hemos echado de menos!",
          AppTextTranslation.recoveryPasswordLoginText: "Recuperar Contraseña",
          AppTextTranslation.emailLoginText: "Correo",
          AppTextTranslation.passwordLoginText: "Contraseña",
          AppTextTranslation.orContinueWithLoginText: "O continuar con",
          AppTextTranslation.notMemberLoginText: "No eres miembro?",
          AppTextTranslation.registerNowLoginText: "registrarse ahora",
          AppTextTranslation.newPasswordText: "Nueva Contraseña",
          AppTextTranslation.confirmPasswordText: "Confirmar contraseña",
          AppTextTranslation.resetPasswordText: "Restablecer contraseña",
          AppTextTranslation.resetPasswordDescriptionText:
              "Introduzca la dirección de correo electrónico asociada a su cuenta y le enviaremos un mensaje con instrucciones para restablecer su contraseña.",
          AppTextTranslation.resetPasswordBtnText: "Enviar instrucciones",
          AppTextTranslation.createPasswordText: "Crear una nueva contraseña",
          AppTextTranslation.createPasswordDescriptionText: "La nueva contraseña debe ser diferente de las anteriores.",
          AppTextTranslation.errorConfirmPasswordText: "Las contraseñas no coinciden",
          AppTextTranslation.createPasswordBtnText: "Restablecer contraseña",
          AppTextTranslation.errorConfirmPasswordTextEmpty: "Digite una contraseña valida",
          AppTextTranslation.registerTitleText: "Regístrate",
          AppTextTranslation.registerSubTitleText: "Crear una cuenta, es gratis",
          AppTextTranslation.emailErrorText: "Ingrese un email valido",
          AppTextTranslation.loadingText: "Cargando...",
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
