// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `/`
  String get routeHome {
    return Intl.message(
      '/',
      name: 'routeHome',
      desc: '',
      args: [],
    );
  }

  /// `/organization-filter`
  String get routeOrganizationFilter {
    return Intl.message(
      '/organization-filter',
      name: 'routeOrganizationFilter',
      desc: '',
      args: [],
    );
  }

  /// `/public-hearing`
  String get routePublicHearing {
    return Intl.message(
      '/public-hearing',
      name: 'routePublicHearing',
      desc: '',
      args: [],
    );
  }

  /// `https://apiplataformaelectoral8.jne.gob.pe/api/v1`
  String get urlBase {
    return Intl.message(
      'https://apiplataformaelectoral8.jne.gob.pe/api/v1',
      name: 'urlBase',
      desc: '',
      args: [],
    );
  }

  /// `https://portal.jne.gob.pe/portal/Pagina/Lista_AudienciasPublicas/`
  String get urlPublicHearing {
    return Intl.message(
      'https://portal.jne.gob.pe/portal/Pagina/Lista_AudienciasPublicas/',
      name: 'urlPublicHearing',
      desc: '',
      args: [],
    );
  }

  /// `JNE`
  String get txtHome {
    return Intl.message(
      'JNE',
      name: 'txtHome',
      desc: '',
      args: [],
    );
  }

  /// `Basic Informatión`
  String get txtBasicInformation {
    return Intl.message(
      'Basic Informatión',
      name: 'txtBasicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Work Experience`
  String get txtWorkExperience {
    return Intl.message(
      'Work Experience',
      name: 'txtWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Academic Formation`
  String get txtAcademicFormation {
    return Intl.message(
      'Academic Formation',
      name: 'txtAcademicFormation',
      desc: '',
      args: [],
    );
  }

  /// `Partial Position`
  String get txtPartialPosition {
    return Intl.message(
      'Partial Position',
      name: 'txtPartialPosition',
      desc: '',
      args: [],
    );
  }

  /// `Sworn Declaration`
  String get txtSwornDeclaration {
    return Intl.message(
      'Sworn Declaration',
      name: 'txtSwornDeclaration',
      desc: '',
      args: [],
    );
  }

  /// `List Of Judgments`
  String get txtListOfJudgments {
    return Intl.message(
      'List Of Judgments',
      name: 'txtListOfJudgments',
      desc: '',
      args: [],
    );
  }

  /// `Aditional Information`
  String get txtAditionalInformation {
    return Intl.message(
      'Aditional Information',
      name: 'txtAditionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Default Title`
  String get txtDefaultTitle {
    return Intl.message(
      'Default Title',
      name: 'txtDefaultTitle',
      desc: '',
      args: [],
    );
  }

  /// `Default Description`
  String get txtDefaultDescription {
    return Intl.message(
      'Default Description',
      name: 'txtDefaultDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get txtCancel {
    return Intl.message(
      'Cancel',
      name: 'txtCancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get txtDelete {
    return Intl.message(
      'Delete',
      name: 'txtDelete',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get txtDetail {
    return Intl.message(
      'Detail',
      name: 'txtDetail',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get txtEdit {
    return Intl.message(
      'Edit',
      name: 'txtEdit',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get txtNew {
    return Intl.message(
      'New',
      name: 'txtNew',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get txtOk {
    return Intl.message(
      'OK',
      name: 'txtOk',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get txtSave {
    return Intl.message(
      'Save',
      name: 'txtSave',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get txtSignIn {
    return Intl.message(
      'Sign in',
      name: 'txtSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Filter by :`
  String get txtFilterBy {
    return Intl.message(
      'Filter by :',
      name: 'txtFilterBy',
      desc: '',
      args: [],
    );
  }

  /// `Public Hearing`
  String get txPublicHearing {
    return Intl.message(
      'Public Hearing',
      name: 'txPublicHearing',
      desc: '',
      args: [],
    );
  }

  /// `https://declara.jne.gob.pe/Assets/Fotos-HojaVida`
  String get urlPhotoResume {
    return Intl.message(
      'https://declara.jne.gob.pe/Assets/Fotos-HojaVida',
      name: 'urlPhotoResume',
      desc: '',
      args: [],
    );
  }

  /// `https://sroppublico.jne.gob.pe/Consulta/Simbolo/GetSimbolo`
  String get urlPoliticalGroupSymbol {
    return Intl.message(
      'https://sroppublico.jne.gob.pe/Consulta/Simbolo/GetSimbolo',
      name: 'urlPoliticalGroupSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}`
  String pageHomeWelcome(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeWelcome',
      desc: '',
      args: [name],
    );
  }

  /// `{gender, select, male {Hi man!} female {Hi woman!} other {Hi there!}}`
  String pageHomeWelcomeGender(String gender) {
    return Intl.gender(
      gender,
      male: 'Hi man!',
      female: 'Hi woman!',
      other: 'Hi there!',
      name: 'pageHomeWelcomeGender',
      desc: '',
      args: [gender],
    );
  }

  /// `{role, select, admin {Hi admin!} manager {Hi manager!} other {Hi visitor!}}`
  String pageHomeWelcomeRole(Object role) {
    return Intl.select(
      role,
      {
        'admin': 'Hi admin!',
        'manager': 'Hi manager!',
        'other': 'Hi visitor!',
      },
      name: 'pageHomeWelcomeRole',
      desc: '',
      args: [role],
    );
  }

  /// `{howMany, plural, one{1 message} other{{howMany} messages}}`
  String pageNotificationsCount(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 message',
      other: '$howMany messages',
      name: 'pageNotificationsCount',
      desc: '',
      args: [howMany],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
