import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../const.dart';
import '../../country_full_info/model/country.dart';
import 'package:http/http.dart' as http;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchName({required String countryName}) async {
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl + 'name/$countryName'));
      Map<String, dynamic> reqresponse = jsonDecode(response.body)[0];

      Country country = Country.fromMap(reqresponse);

      emit(SearchLoaded(country: country));
    } catch (e) {
      emit(const SearchError(error: "Enter Only The Country Name"));
    }
  }
}
