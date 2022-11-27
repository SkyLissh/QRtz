import "package:flutter/material.dart";
import "package:country_picker/country_picker.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

class CountryDropdown extends StatefulWidget {
  final void Function(Country)? onSelect;

  const CountryDropdown({Key? key, this.onSelect}) : super(key: key);

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  Country? _selected;

  @override
  void initState() {
    super.initState();
  }

  void _onSelect(Country country) {
    setState(() {
      _selected = country;
    });

    widget.onSelect?.call(country);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => showCountryPicker(
          context: context,
          showPhoneCode: true,
          countryListTheme: _CountryListTheme.formContext(context),
          onSelect: _onSelect,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FeatherIcon(
              FeatherIcons.chevronDown,
              size: 16,
              strokeWidth: 3,
            ),
            const SizedBox(width: 5),
            Text(_selected?.flagEmoji ?? "🇺🇸",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 5),
            Text(
              "+${_selected?.phoneCode ?? '1'}",
              style: TextStyle(color: colors.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}

class _CountryListTheme {
  static CountryListThemeData formContext(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return CountryListThemeData(
      backgroundColor: colors.background,
      bottomSheetHeight: 500.0,
      inputDecoration: InputDecoration(
        hintText: "Search country",
        prefixIcon: const Padding(
          padding: EdgeInsets.all(15.0),
          child: FeatherIcon(FeatherIcons.search),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.onBackground),
        ),
      ),
    );
  }
}
