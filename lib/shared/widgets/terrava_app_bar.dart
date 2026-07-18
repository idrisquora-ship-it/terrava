import 'package:flutter/material.dart';

class TerravaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TerravaAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title!),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
    );
  }
}
