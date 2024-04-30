import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavigationTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const MyNavigationTab({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 148 : 120,
        height: isSelected ? 60 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected
              ? const Color.fromARGB(255, 45, 54, 59)
              : const Color.fromARGB(255, 45, 54, 59),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(216, 39, 39, 39),
              spreadRadius: 3,
              blurRadius: 7,
              offset: isSelected ? const Offset(3, 3) : const Offset(1, 1),
            ),
          ],
        ),
        curve: Curves.easeInOut,
        child: Center(
          child: Transform.scale(
            scale: isSelected ? 1.1 : 1.0,
            child: Text(
              title,
              style: GoogleFonts.bayon(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 18,
                color: isSelected
                    ? const Color.fromARGB(255, 199, 41, 49)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
