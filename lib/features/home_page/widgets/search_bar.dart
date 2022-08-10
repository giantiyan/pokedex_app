import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  bool? isIconVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 220,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        controller: _controller,
        decoration: InputDecoration(
          isDense: true,
          fillColor: white,
          filled: true,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: _controller.text.isNotBlank
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    widget.onSearch('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
        ),
        onChanged: widget.onSearch,
      ),
    );
  }
}
