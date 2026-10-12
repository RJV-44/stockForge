import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool showAppBar;
  final Color? backgroundColor;
  final Color? titleColor;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.showAppBar = true,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? const Color(0xFFFFFFFF),
      appBar: showAppBar
          ? AppBar(
              backgroundColor: const Color(0xFFF7FAF7),
              elevation: 0,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              leading: leading ??
                  (Navigator.canPop(context)
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF181D19),
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      : null),
              title: Text(
                title,
                style: TextStyle(
                  color: titleColor ?? const Color(0xFF006C44),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              actions: actions,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  height: 1,
                  thickness: 0.8,
                  color: Color(0xFFE5E7EB),
                ),
              ),
            )
          : null,
      drawer: drawer,
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: body,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar != null
          ? SafeArea(
              top: false,
              child: bottomNavigationBar!,
            )
          : null,
    );
  }
}
