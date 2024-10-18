import 'package:flutter/material.dart';

void navigate({required BuildContext context, required Widget child}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));
}

void removeNavigate({required BuildContext context, required Widget child}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => child),
    (route) => false, // Remove all routes in the stack
  );
}
