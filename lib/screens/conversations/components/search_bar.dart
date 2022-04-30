import 'package:flutter/material.dart';
import 'package:lab6/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Search',
          hintStyle: TextStyle(
            color:
                Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color:
                Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
