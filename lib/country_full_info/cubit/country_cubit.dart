import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rest_countries_app/const.dart';

import '../model/country.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  Future<void> getCountryFullInfo({required String id}) async {
    emit(CountryLoading());
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + 'alpha/$id'));
      Map<String, dynamic> reqresponse = jsonDecode(response.body)[0];

      Country country = Country.fromMap(reqresponse);

      emit(CountryLoaded(country: country));
    } catch (e) {
      emit(CountryError(error: e.toString()));
    }
  }
}
