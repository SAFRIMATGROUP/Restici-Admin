import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restici_admin/core/widgets/app_pop_icon.dart';
import 'package:restici_admin/core/widgets/loading_widget/app_loader.dart';
import 'package:restici_admin/core/widgets/package_widgets/app_shimmer.dart';
import 'package:restici_admin/core/widgets/responsive_widgets/responsive_row.dart';
import 'package:restici_admin/core/widgets/shimmer_text_container.dart';
import 'package:restici_admin/core/widgets/side_menu.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(index: 0),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLoader.pagination(strokeWidth: 10,),
                    AppShimmer(child: Text('data'), enabled: true,),

                    ResponsiveRow(
                      wrap: false,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            color: Colors.red,
                          ),
                          Container(
                            width: 300,
                            height: 100,
                            color: Colors.red,
                          ),
                          Container(
                            width: 300,
                            height: 100,
                            color: Colors.red,
                          ),

                          ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
