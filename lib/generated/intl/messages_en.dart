// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Welcome ${name}";

  static String m1(gender) =>
      "${Intl.gender(gender, female: 'Hi woman!', male: 'Hi man!', other: 'Hi there!')}";

  static String m2(role) => "${Intl.select(role, {
            'admin': 'Hi admin!',
            'manager': 'Hi manager!',
            'other': 'Hi visitor!',
          })}";

  static String m3(howMany) =>
      "${Intl.plural(howMany, one: '1 message', other: '${howMany} messages')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "pageHomeWelcome": m0,
        "pageHomeWelcomeGender": m1,
        "pageHomeWelcomeRole": m2,
        "pageNotificationsCount": m3,
        "routeHome": MessageLookupByLibrary.simpleMessage("/"),
        "routeOrganizationFilter":
            MessageLookupByLibrary.simpleMessage("/organization-filter"),
        "routeParliament":
            MessageLookupByLibrary.simpleMessage("/andean-parliament"),
        "routePublicHearing":
            MessageLookupByLibrary.simpleMessage("/public-hearing"),
        "txAndeanParliament":
            MessageLookupByLibrary.simpleMessage("Andean Parliament"),
        "txPublicHearing":
            MessageLookupByLibrary.simpleMessage("Public Hearing"),
        "txtAcademicFormation":
            MessageLookupByLibrary.simpleMessage("Academic Formation"),
        "txtAditionalInformation":
            MessageLookupByLibrary.simpleMessage("Aditional Information"),
        "txtApply": MessageLookupByLibrary.simpleMessage("Apply"),
        "txtBasicInformation":
            MessageLookupByLibrary.simpleMessage("Basic Informatión"),
        "txtCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "txtDefaultDescription":
            MessageLookupByLibrary.simpleMessage("Default Description"),
        "txtDefaultTitle":
            MessageLookupByLibrary.simpleMessage("Default Title"),
        "txtDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "txtDetail": MessageLookupByLibrary.simpleMessage("Detail"),
        "txtEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "txtFilterBy": MessageLookupByLibrary.simpleMessage("Search filters :"),
        "txtHome": MessageLookupByLibrary.simpleMessage("JNE"),
        "txtListOfJudgments":
            MessageLookupByLibrary.simpleMessage("List Of Judgments"),
        "txtNew": MessageLookupByLibrary.simpleMessage("New"),
        "txtOk": MessageLookupByLibrary.simpleMessage("OK"),
        "txtPartialPosition":
            MessageLookupByLibrary.simpleMessage("Partial Position"),
        "txtSave": MessageLookupByLibrary.simpleMessage("Save"),
        "txtSignIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "txtSwornDeclaration":
            MessageLookupByLibrary.simpleMessage("Sworn Declaration"),
        "txtWorkExperience":
            MessageLookupByLibrary.simpleMessage("Work Experience"),
        "urlAndeanParliament": MessageLookupByLibrary.simpleMessage(
            "https://cej.jne.gob.pe/Autoridades/ListarConformacionActual"),
        "urlBase": MessageLookupByLibrary.simpleMessage(
            "https://apiplataformaelectoral8.jne.gob.pe/api/v1"),
        "urlPhotoResume": MessageLookupByLibrary.simpleMessage(
            "https://declara.jne.gob.pe/Assets/Fotos-HojaVida"),
        "urlPoliticalGroupSymbol": MessageLookupByLibrary.simpleMessage(
            "https://sroppublico.jne.gob.pe/Consulta/Simbolo/GetSimbolo"),
        "urlPublicHearing": MessageLookupByLibrary.simpleMessage(
            "https://portal.jne.gob.pe/portal/Pagina/Lista_AudienciasPublicas/")
      };
}
