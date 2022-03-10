import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Todo: Add imports

// import '../provider/random_activity_provider.dart';

// import '../pages/legalese_page.dart';

// import '../pages/random_activity_page.dart';

// import '../provider/selected_page_provider.dart';

import 'custom_bottom_bar_widget.dart';

List<Widget> pages = const [
  //Todo: Add the Pages

  //BuildBody(),

  //IdeaPage(),
];

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: Add the provider SelectedPageProvider

    int selectedPage =
        0; //= Provider.of<SelectedPageProvider>(context).selectedPage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('The Boring App'),
        actions: [
          IconButton(
            onPressed: () async {
              //Todo: Add the provider changePage

              // Provider.of<SelectedPageProvider>(context, listen: false)

              //     .changePage(0);

              //Todo: Add the provider eitherFailureOrActivity.

              // Provider.of<RandomActivityProvider>(context, listen: false)

              //     .eitherFailureOrActivity();
            },
            icon: const Icon(
              Icons.flash_on_outlined,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
