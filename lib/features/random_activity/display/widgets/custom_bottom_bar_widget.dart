import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Todo: Add the provider SelectedPageProvider

//import '../provider/selected_page_provider.dart';

import 'custom_bottom_bar_icon_widget.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: Add the provider SelectedPageProvider

    int selectedPage =
        0; // = Provider.of<SelectedPageProvider>(context).selectedPage;

    return BottomAppBar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: selectedPage == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: LayoutBuilder(
              builder: (context, box) => SizedBox(
                width: box.maxWidth / 2,
                child: const Divider(
                  height: 0,
                  color: Colors.orangeAccent,
                  thickness: 2,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomBarIconWidget(
                iconDataSelected: Icons.search_outlined,
                iconDataUnselected: Icons.search_outlined,
                callback: () {
                  //Todo: Add the provider SelectedPageProvider

                  // Provider.of<SelectedPageProvider>(context, listen: false)

                  //     .changePage(0);
                },
                isSelected: selectedPage == 0,
              ),
              CustomBottomBarIconWidget(
                iconDataSelected: Icons.menu,
                iconDataUnselected: Icons.menu,
                callback: () {
                  //Todo: Add the provider SelectedPageProvider

                  // Provider.of<SelectedPageProvider>(context, listen: false)

                  //     .changePage(1);
                },
                isSelected: selectedPage == 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
