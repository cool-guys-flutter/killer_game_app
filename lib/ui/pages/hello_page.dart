import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/user_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:killer_game_app/providers/theme.dart';

class HelloPage extends ConsumerStatefulWidget {
  HelloPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends ConsumerState<HelloPage> {
  int _currentPage = 0;
  final int _pageCount = 7;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: (themeMode == ThemeMode.dark ? Colors.white : Color(0x212121)),
    ) ,
      backgroundColor:
          (themeMode == ThemeMode.dark ? Colors.white : Color(0x212121)),
      body: PageView.builder(
        itemCount: _pageCount,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return _buildPageContent(
              index); // Функция для построения содержимого каждой страницы
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pageCount, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 70,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Color(0xffFF0000) : Colors.grey,
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return _pageZeroContent();
      case 1:
        return _pageOneContent();
      case 2:
        return _pageTwoContent();
      case 3:
        return _pageThreeContent();
      case 4:
        return _pageFourContent();
      case 5:
        return _pageFiveContent();
      case 6:
        return _pageSixContent();
      // Добавьте остальные страницы по аналогии
      default:
        return _pageZeroContent(); // Возвращаем первую страницу, если индекс вне диапазона
    }
  }

  Widget _pageZeroContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое первой страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 329,
          height: 120,
          child: Text(
            AppLocalizations.of(context)!.greating,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 34,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageOneContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое первой страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/phone.svg',
          width: 400,
          height: 400,
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
          semanticsLabel: "Phone",
        ),
        SizedBox(
          width: 329,
          height: 105,
          child: Text(
            AppLocalizations.of(context)!.rule_1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 150,
            child: Text(
              AppLocalizations.of(context)!.description_1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))
      ],
    );
  }

  Widget _pageTwoContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое второй страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/aim.svg',
          width: 300,
          height: 300,
          semanticsLabel: "Aim",
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
        ),
        SizedBox(
          width: 329,
          height: 29,
          child: Text(
            AppLocalizations.of(context)!.rule_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 200,
            child: Text(
              AppLocalizations.of(context)!.description_2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))
      ],
    );
  }

  Widget _pageThreeContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое второй страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/gun.svg',
          width: 300,
          height: 300,
          semanticsLabel: "Aim",
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
        ),
        SizedBox(
          width: 329,
          height: 29,
          child: Text(
            AppLocalizations.of(context)!.rule_3,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 200,
            child: Text(
              AppLocalizations.of(context)!.description_3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))
      ],
    );
  }

  Widget _pageFourContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое второй страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/silence.svg',
          width: 300,
          height: 300,
          semanticsLabel: "Aim",
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
        ),
        SizedBox(
          width: 329,
          height: 29,
          child: Text(
            AppLocalizations.of(context)!.rule_4,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 200,
            child: Text(
              AppLocalizations.of(context)!.description_4,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))
      ],
    );
  }

  Widget _pageFiveContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое второй страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/new_target.svg',
          width: 300,
          height: 300,
          semanticsLabel: "Aim",
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
        ),
        SizedBox(
          width: 329,
          height: 29,
          child: Text(
            AppLocalizations.of(context)!.rule_5,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 200,
            child: Text(
              AppLocalizations.of(context)!.description_5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))
      ],
    );
  }

  Widget _pageSixContent() {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // Содержимое второй страницы
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/images/winner.svg',
          width: 300,
          height: 300,
          semanticsLabel: "Aim",
          color:(themeMode == ThemeMode.dark ? Colors.black : Colors.white),
        ),
        SizedBox(
          width: 329,
          height: 68,
          child: Text(
            AppLocalizations.of(context)!.rule_6,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        SizedBox(
            width: 333,
            height: 200,
            child: Text(
              AppLocalizations.of(context)!.description_6,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
                fontSize: 18,
                fontFamily: 'Playwrite NG Modern',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
        OutlinedButton(
          onPressed: () {
            ref.read(userProvider.notifier).userReadRules();
            Navigator.pushNamed(context, "/");
          },
          child: Text(
            AppLocalizations.of(context)!.next,
            style: TextStyle(
              color:
                  (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
              fontSize: 25,
            ),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor:
                (themeMode == ThemeMode.dark ? Colors.black : Colors.white),
            minimumSize: Size(250, 70), // Установите цвет текста кнопки
            side: BorderSide.none, // Убирает границу кнопки
          ),
        ),
      ],
    );
  }
}
