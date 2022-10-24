import 'package:flutter/material.dart';

class AppStore extends StatefulWidget {
  final Widget child;

  const AppStore({super.key, required this.child});

  @override
  AppStoreState createState() => AppStoreState();

  static AppStoreState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppState>()
            as _InheritedAppState)
        .data;
  }
}

class AppStoreState extends State<AppStore> {
  String testingData = 'Testing Data (:';
  String testingData2 = 'Testing Data 2 (:';
  String testingData3 = 'Testing Data 3 (:';

  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(data: this, child: widget.child);
  }
}

class _InheritedAppState extends InheritedWidget {
  final AppStoreState data;

  const _InheritedAppState({required Widget child, required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
