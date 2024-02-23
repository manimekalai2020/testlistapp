import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  @override
  Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse('your_api_url_here'));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as Map<String, dynamic>;
      final countries = jsonList['data'] as Map<String, dynamic>;
      return countries.entries.map((e) => Country.fromJson(e.value)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
