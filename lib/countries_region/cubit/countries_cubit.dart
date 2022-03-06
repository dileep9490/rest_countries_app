import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rest_countries_app/countries_region/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:rest_countries_app/const.dart';
part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial()) {
    getCountries('all');
  }

  void callgetCountries(String request) {
    getCountries(request);
  }

  void getCountries(String request) async {
    emit(CountriesLoading());
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + request));
      List json = jsonDecode(response.body);
      List<Country> countriesList =
          json.map((e) => Country.fromMap(e)).toList();
      emit(CountriesLoaded(countries: countriesList));
    } catch (e) {
      emit(CountriesError());
    }
  }
}
