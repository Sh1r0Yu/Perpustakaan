import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const CustomTab(this.selectedTab, this.onTabChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0), // Berikan jarak agar tidak terlalu dekat dengan elemen lain
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Menjaga jarak antar tab
        children: [
          GestureDetector(
            onTap: () => onTabChanged(0), // Menambahkan logika tab 1
            child: Semantics(
              label: 'Tab 1',
              selected: selectedTab == 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Tab 1',
                  style: TextStyle(
                    fontWeight: selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                    color: selectedTab == 0 ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTabChanged(1), // Menambahkan logika tab 2
            child: Semantics(
              label: 'Tab 2',
              selected: selectedTab == 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Tab 2',
                  style: TextStyle(
                    fontWeight: selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                    color: selectedTab == 1 ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
