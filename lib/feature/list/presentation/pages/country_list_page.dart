import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/country.dart';
import '../../domain/usecases/get_countries.dart';
import '../../data/repositories/country_repository_impl.dart';

class CountryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = CountryRepositoryImpl();
    final getCountries = GetCountries(repository);

    return BlocProvider(
      create: (context) => CountryBloc(getCountries),
      child: Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: BlocBuilder<CountryBloc, List<Country>>(
          builder: (context, countries) {
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  title: Text(country.countryName),
                  subtitle: Text(country.region),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
