import 'package:flutter/cupertino.dart';

class PokemonSearchField extends CupertinoNavigationBar {
  final ValueChanged<String> onChanged;

  const PokemonSearchField({super.key, required this.onChanged});
}
