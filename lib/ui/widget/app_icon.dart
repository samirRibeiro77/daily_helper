import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData _icon;
  final Color _color;

  AppIcon(this._icon, this._color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Icon(
          _icon,
          size: 150.0,
          color: _color
      ),
    );
  }
}
