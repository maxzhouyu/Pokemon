import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.heroTag,
      required this.onTap});

  final String imageUrl;
  final String name;
  final String heroTag;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue.withOpacity(.3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
