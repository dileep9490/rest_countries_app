import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rest_countries_app/all_countries/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:rest_countries_app/const.dart';
part 'all_countries_state.dart';

class AllCountriesCubit extends Cubit<AllCountriesState> {
  AllCountriesCubit() : super(AllCountriesInitial());

  Future<void> getAllCountries() async {
    try {
      emit(AllCountriesLoading());
      http.Response response = await http.get(Uri.parse(baseUrl + 'all'));
      List json = jsonDecode(response.body);
      List<Country> countriesList =
          json.map((e) => Country.fromMap(e)).toList();
      emit(AllCountriesLoaded(countries: countriesList));
    } catch (e) {
      emit(AllCountriesError());
    }
  }
}