import 'package:flutter/material.dart';

///
/// [BoxComponent]
///
class BoxComponent extends StatelessWidget {
  ///
  final bool isSelected;

  ///
  final Color color;

  ///
  final VoidCallback onTap;

  ///
  const BoxComponent(
      {super.key,
      required this.isSelected,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedContainer(
            height: BOX_HEIGHT,
            width: BOX_WIDTH,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color, width: 2),
                color:
                    isSelected ? color.withOpacity(0.3) : Colors.transparent),
            duration: const Duration(milliseconds: 400),
          ),
          if (isSelected)
            const Align(
                alignment: Alignment.center, child: Icon(Icons.done, size: 36))
        ],
      ),
    );
  }
}

///
double BOX_HEIGHT = 180;
double BOX_WIDTH = 150;
