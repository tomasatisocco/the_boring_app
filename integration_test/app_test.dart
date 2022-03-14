import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_boring_app/features/random_activity/display/widgets/custom_elevated_button_widget.dart';
import 'package:the_boring_app/main.dart';

void main(){
  testWidgets('Full app test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    Finder customButton = find.byKey(customButtonKey);
    expect(customButton, findsOneWidget);
    tester.printToConsole('Custom Button Found');
    await tester.tap(customButton);
    await tester.pump(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));

    Finder customButtonHome = find.byKey(customButtonKey);
    expect(customButtonHome, findsOneWidget);
    tester.printToConsole('Custom Button Home Found');
    await tester.tap(customButtonHome);
    await tester.pump(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));

    Finder menuButton = find.byIcon(Icons.menu);
    expect(menuButton, findsOneWidget);
    tester.printToConsole('Menu Button Home Found');
    await tester.tap(menuButton);
    await tester.pump(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));

    Finder textLegalese = find.text('Legalese');
    expect(textLegalese, findsOneWidget);
    tester.printToConsole('Legalese Text Found');

    Finder actionButton = find.byIcon(Icons.flash_on_outlined);
    expect(actionButton, findsOneWidget);
    tester.printToConsole('Flash Button Found');
    await tester.tap(actionButton);
    await tester.pump(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 2));
  });
}