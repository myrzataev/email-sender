
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: InkWell(
            child: Icon(Icons.arrow_drop_down),
            onTap: () {
              showCountryPicker(
                context: context,
                //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                exclude: <String>['KN', 'MF'],
                favorite: <String>['SE'],
                //Optional. Shows phone code before the country name.
                showPhoneCode: true,
                onSelect: (Country country) {
                  print('Select country: ${country.displayName}');
                },
                // Optional. Sets the theme for the country list picker.
                countryListTheme: CountryListThemeData(
                  // Optional. Sets the border radius for the bottomsheet.
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  // Optional. Styles the search field.
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF8C98A8)
                            .withOpacity(0.2),
                      ),
                    ),
                  ),
                  // Optional. Styles the text in the search field
                  searchTextStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              );
            },
          ),
          suffixIcon: Icon(Icons.email),
          hintText: "(555) 000-0000",
          labelText: "Phone",
          border: OutlineInputBorder()),
    );
  }
}
