import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AreaFIltter extends StatefulWidget {
  const AreaFIltter({
    super.key,
  });

  @override
  State<AreaFIltter> createState() => _AreaFIltterState();
}

class _AreaFIltterState extends State<AreaFIltter> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Area (sqft)",
          style: StylesData.font16,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: DropdownSearch<String>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      suffixIconColor: Colors.grey[300],
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: ConstColor.kMainColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hoverColor: Colors.black,
                          hintText: "min",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: ConstColor.kMainColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          // labelText: 'Password',
                        ),
                      )),
                  items: const [],
                  enabled: true,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 45,
                child: DropdownSearch<String>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: StylesData.font12
                        .copyWith(color: ConstColor.kMainColor),
                    dropdownSearchDecoration: InputDecoration(
                      suffixIconColor: Colors.grey[300],
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: ConstColor.kMainColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  popupProps: const PopupProps.menu(
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Max",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          // labelText: 'Password',
                        ),
                      )),
                  items: const [],
                  enabled: true,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
