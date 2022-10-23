import 'package:fit_fit_meal/screens/tutorial/pages/first_tutorial_page/first_tutorial_apge.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/second_tutorial_page/second_tutorial_page.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/third_tutorial_page/third_tutorial_page.dart';
import 'package:fit_fit_meal/screens/tutorial/widgets/end_tutorial_button.dart';
import 'package:fit_fit_meal/screens/tutorial/widgets/tutorial_footer.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final double _bottomSheetHeight = 70;
  final _pageController = PageController();
  bool isLastPage = false;

  static const List<Widget> _pages = [
    FirstTutorialPage(),
    SecondTuorialPage(),
    ThirdTutorialPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.only(bottom: _bottomSheetHeight),
        child: PageView(
          controller: _pageController,
          onPageChanged: (pageNumber) => setState(() {
            isLastPage = pageNumber == _pages.length - 1;
          }),
          children: const <Widget>[
            ..._pages,
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? EndTutorialButton(height: _bottomSheetHeight)
          : TutorialFooter(
              height: _bottomSheetHeight,
              pageController: _pageController,
              pageCount: _pages.length,
            ),
    );
  }
}
