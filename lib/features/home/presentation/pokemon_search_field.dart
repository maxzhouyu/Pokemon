import 'package:flutter/cupertino.dart';

class PokemonSearchField extends CupertinoNavigationBar {
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return const Text('PokemonSearchField');
  }

  const PokemonSearchField({super.key, required this.onChanged});
}
