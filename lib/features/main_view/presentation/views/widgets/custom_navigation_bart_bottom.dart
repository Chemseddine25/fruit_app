import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/active_icon.dart';

import '../../../domain/entities/bottom_navigation_bar_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

int selectedIndex = 0;

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 70,
        decoration: const ShapeDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navigationBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;

            return Expanded(
              flex: index == selectedIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  widget.onItemTapped(index);

                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: NavigationIcon(
                    isSelected: index == selectedIndex,
                    bottomNavigationBarEntity: entity),
              ),
            );
          }).toList(),
        ));
  }
}

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            text: bottomNavigationBarEntity.name,
            image: bottomNavigationBarEntity.activeIcon,
          )
        : InactiveIcon(icon: bottomNavigationBarEntity.inActiveIcon);
  }
}
