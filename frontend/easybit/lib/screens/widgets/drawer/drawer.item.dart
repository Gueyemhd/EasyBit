import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function onAction;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).primaryColor,
      ),
      trailing: Icon(
        trailingIcon,
        color: Theme.of(context).primaryColor,
      ),
      onTap: (() => onAction()),
    );
  }
}
