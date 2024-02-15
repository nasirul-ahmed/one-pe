import '/_helpers/size_utils.dart';
import '/models/service_model.dart';

import '/_helpers/themes/my_colors.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<ServiceModel> services;
  CustomSearchDelegate(this.services);

  List<ServiceModel> _filterData(String query) {
    print("query " + query);
    return services
        .where((data) =>
            data.name.toLowerCase().contains(query.toLowerCase()) ||
            data.desc.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Widget> generateSerachWidgetList(List<ServiceModel> list) {
    return list
        .map((service) => TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(service.name),
              ),
            ))
        .toList();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(toolbarHeight: 90),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        focusColor: MyColors.black900,
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: const Color.fromRGBO(30, 31, 32, 0.2),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => super.searchFieldStyle;

  // ignore: unnecessary_overrides
  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      super.searchFieldDecorationTheme;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(services.toString());
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(services.toString());
    return query.isEmpty
        ? Container(
            padding: getPadding(left: 20, top: 10),
            child: const Center(
              child: Text("Search an Item"),
            ),
          )
        : _buildSearchResults(query);
  }

  Widget _buildSearchResults(query) {
    print(services.toString());
    List<ServiceModel> filteredData = _filterData(query);

    if (filteredData.isEmpty) {
      return const Center(child: Text('No results found.'));
    }

    return ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (__, index) {
          return Padding(
            padding: getPadding(left: 20, right: 20, top: 10),
            child: TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(filteredData[index].name),
              ),
            ),
          );
        });
  }
}
