import 'package:flutter/material.dart';

class AppStore extends StatefulWidget {
  final Widget child;
  const AppStore({super.key, required this.child});

  @override
  AppStoreState createState() => AppStoreState();
}

class AppStoreState extends State<AppStore> {
  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(child: widget.child);
  }
}

class _InheritedAppState extends InheritedWidget {
  const _InheritedAppState({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
