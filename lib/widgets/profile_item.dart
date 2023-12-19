import 'package:flutter/material.dart';
import '../donnee_fixes/couleurs.dart';

Widget itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 5),
              color: Couleurs.d,
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      tileColor: Colors.white,
    ),
  );
}
