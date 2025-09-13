import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onClosePressed;
  final Color? color; // keep this for single-color fallback
  final Gradient? gradient; // 👈 new property

  const CustomAppBar({
    Key? key,
    required this.title,
    this.color,
    this.gradient,
    this.onClosePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: gradient == null ? color : Colors.transparent, // transparent if gradient
      elevation: 0,
      flexibleSpace: gradient != null
          ? Container(
              decoration: BoxDecoration(
                gradient: gradient,
              ),
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.close, color: Colors.grey[600]),
          onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
        ),
      ],
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
