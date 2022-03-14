import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:the_boring_app/features/random_activity/display/provider/random_activity_provider.dart';
import 'package:the_boring_app/features/random_activity/display/provider/selected_page_provider.dart';
import 'package:the_boring_app/features/random_activity/display/widgets/skeleton_widget.dart';

void main(){
  testWidgets(
    'When Menu Button Pressed, find the legalese text',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyTestWidget());
      Finder navigationMenuButton = find.byIcon(Icons.menu);
      expect(navigationMenuButton, findsOneWidget);

      await tester.tap(navigationMenuButton);
      await tester.pump();
      Finder textLegalese = find.text('Legalese');

      expect(textLegalese, findsOneWidget);
    });
}

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedPageProvider(),),
        ChangeNotifierProvider(create: (context) => RandomActivityProvider(),),
      ],
      child: const MaterialApp(
        home: SkeletonWidget(),
      ),
    );
  }
}