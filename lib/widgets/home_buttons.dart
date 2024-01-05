import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color color;
  final VoidCallback onPressed;
  const HomeButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton.filled(
          onPressed: () {},
          style: IconButton.styleFrom(
            fixedSize: const Size.fromRadius(32),
            backgroundColor: color.withOpacity(0.2),
          ),
          color: color,
          icon: Icon(iconData),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
