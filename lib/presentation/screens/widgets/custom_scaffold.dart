import 'package:flutter/material.dart';

import '../../../core/enum/custom_scaffold_enum.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      required this.appBartitle,
      required this.costomScaffoldEnum,
      required this.safeAreaChild,
      this.bottomNavigationBar,
      this.actions,
      this.leading, 
      this.floatingActionButton});

  final String appBartitle;
  final CustomScaffoldEnum costomScaffoldEnum;
  final Widget safeAreaChild;
  final NavigationBar? bottomNavigationBar;
  final List<Widget>? actions;
  final Widget? leading;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    switch (costomScaffoldEnum) {
      case CustomScaffoldEnum.scaffoldWithoutAppBarNSafeArea:
        return scaffoldWithoutAppBarNSafeArea();
      case CustomScaffoldEnum.scaffoldWithSafeAreaWithoutAppBar:
        return scaffoldWithSafeAreaWithoutAppBar();
      case CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar:
        return scaffoldWithSafeAreaWithAppBar();
    }
  }

  // If we want to show full screen behind status bar then use this method.
  Scaffold scaffoldWithoutAppBarNSafeArea() {
    return Scaffold(
      body: safeAreaChild,
    );
  }

  // If we want to show witout app bar with safe area.
  Scaffold scaffoldWithSafeAreaWithoutAppBar() {
    return Scaffold(
      body: SafeArea(child: safeAreaChild),      
    );
  }

  // If we want to show app bar with safe area.
  Scaffold scaffoldWithSafeAreaWithAppBar() {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBartitle),
        actions: actions,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: leading,
        ),
        leadingWidth: 52,        
      ),
      body: SafeArea(child: safeAreaChild),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
