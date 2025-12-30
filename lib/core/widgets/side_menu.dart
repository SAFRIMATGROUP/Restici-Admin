import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class SideMenu extends StatefulWidget {
  final int index;
   const SideMenu({super.key, required this.index});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;
  List<String> titles = [
    // Général
    'Tableau de bord',
    'Analytiques',

    // Ventes
    'Commandes',
    'Produits',
    'Catégories',
    'Promotions',

    // Clients
    'Clients',
    'Avis',
    'Support',

    // Livraison
    'Expéditions',
    'Retours',

    // Marketing
    'Contenu',

    // Gestion
    'Finances',
    'Employés',
    ];

  List<IconData> selectedIcons = [
    // Général
    IconlyBold.category,
    IconlyBold.chart,

    // Ventes
    IconlyBold.buy,
    CupertinoIcons.cube_box_fill,
    Icons.category_rounded,
    IconlyBold.discount,

    // Clients
    IconlyBold.user_3,
    IconlyBold.star,
    CupertinoIcons.chat_bubble_fill,

    // Livraison
    Icons.local_shipping_rounded,
    Icons.loop_rounded,

    // Marketing
    Icons.file_copy_rounded,

    // Gestion
    CupertinoIcons.money_dollar,
    IconlyBold.user_2,
  ];

  List<IconData> unselectedIcons = [
    // Général
    IconlyLight.category,
    IconlyLight.chart,

    // Ventes
    IconlyLight.buy,
    CupertinoIcons.cube_box,
    Icons.category_outlined,
    IconlyLight.discount,

    // Clients
    IconlyLight.user_1,
    IconlyLight.star,
    CupertinoIcons.chat_bubble,

    // Livraison
    Icons.local_shipping_outlined,
    Icons.loop_rounded,

    // Marketing
    Icons.file_copy_outlined,

    // Gestion
    CupertinoIcons.money_dollar,
    IconlyLight.user,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SideBarAnimated(
      onTap: (s) {
        setState(() {
          selectedIndex = s;
        });
      },
      // sideBarColor: Colors.white,
      // animatedContainerColor: Colors.white,
      widthSwitch: 700,
      mainLogoImage: 'assets/icons/app_icon.png',

      sidebarItems: [
        for(int i = 0; i < titles.length; i++)
          SideBarItem(
            iconSelected:  selectedIcons[i],
            iconUnselected: unselectedIcons[i],
            text: titles[i],
          ),

      ],
    );
  }
}
