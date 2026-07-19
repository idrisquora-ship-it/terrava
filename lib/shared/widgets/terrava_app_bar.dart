import 'package:flutter/material.dart';

class TerravaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TerravaAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.bottom,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title!),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }
}
