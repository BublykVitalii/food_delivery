import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class UIScreen extends StatefulWidget {
  static const _routeName = '/ui';

  const UIScreen({Key? key}) : super(key: key);

  static PageRoute<UIScreen> getRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) => const UIScreen(),
    );
  }

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.uiScreen),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DividerTheme(
                data: context.theme.dividerTheme
                    .copyWith(color: Colors.transparent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    _buildIcons(),
                    const Divider(),
                    _buildSearchButton(),
                    const Divider(),
                    Row(
                      children: [
                        _buildAppBarButton(),
                        const SizedBox(width: 20),
                        _buildSubAppBarButton(),
                      ],
                    ),
                    const Divider(),
                    _buildEmailField(),
                    const Divider(),
                    _buildPasswordField(),
                    const Divider(),
                    Container(
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._buildText(),
                        ],
                      ),
                    ),
                    const Divider(),
                    ..._buildButtons(),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcons() {
    return Container(
      color: Colors.purple,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          children: [
            const Text('burger'),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/icons/burger/burger_menu.png',
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/offer_promo.png'),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/orders.png'),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/privacy.png'),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/profile.png'),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/right_arrow.png'),
            const SizedBox(height: 5),
            Image.asset('assets/images/icons/burger/security.png'),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            const Text('down bar'),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/icons/down_bar/favorite.png',
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/icons/down_bar/history.png',
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/icons/down_bar/home.png',
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/icons/down_bar/my_profile.png',
              color: Colors.white,
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            const Text('all other'),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/icons/search.png',
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/icons/shop_cart.png',
              color: Colors.white,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ]),
    );
  }

  List<Widget> _buildText() {
    final textTheme = context.theme.textTheme;

    return [
      Text('Headline 1', style: textTheme.headline1),
      Text('Headline 2', style: textTheme.headline2),
      Text('Headline 3', style: textTheme.headline3),
      Text('Headline 4', style: textTheme.headline4),
      Text('Headline 5', style: textTheme.headline5),
      Text('Subtitle 1', style: textTheme.subtitle1),
      Text('Subtitle 2', style: textTheme.subtitle2),
      Text('Body Text 1', style: textTheme.bodyText1),
      Text('Body Text 2', style: textTheme.bodyText2),
      Text('Button', style: textTheme.button),
      Text('Captions', style: textTheme.caption),
    ];
  }

  List<Widget> _buildButtons() {
    return [
      Container(
        width: 500,
        height: 230,
        color: context.theme.colorScheme.primary,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextButton(
              onPressed: null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 25),
                child: Text(context.localizations.getStarted),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 25),
                child: Text(context.localizations.login),
              ),
              style: context.theme.textButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.theme.colorScheme.secondary),
                foregroundColor: MaterialStateProperty.all<Color>(
                    context.theme.colorScheme.background),
              ),
            ),
          ],
        ),
      ),
      const Divider(),
      const Divider(),
    ];
  }

  Widget _buildEmailField() {
    return TextFormField(
      style: context.theme.textTheme.button,
      decoration: InputDecoration(
        labelText: context.localizations.emailAddress,
        focusColor: Colors.black,
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscuringCharacter: '*',
      style: context.theme.textTheme.button,
      decoration: InputDecoration(
        labelText: context.localizations.password,
        focusColor: Colors.black,
      ),
    );
  }

  Widget _buildAppBarButton() {
    return Column(
      children: [
        Text(context.localizations.login),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.center,
          width: 134,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3.0,
                style: BorderStyle.solid,
                color: context.theme.colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubAppBarButton() {
    return Column(
      children: [
        Text(
          context.localizations.foods,
          style: context.theme.textTheme.bodyText1!.copyWith(
            color: context.theme.colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          width: 87,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: 3.0,
                  style: BorderStyle.solid,
                  color: context.theme.colorScheme.secondary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    const searchIcon = 'assets/images/icons/search.png';

    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFFEFEEEE),
        ),
      ),
      onPressed: () {},
      child: ListTile(
        leading: Image.asset(searchIcon),
        title: TextField(
          decoration: InputDecoration(
            hintText: context.localizations.search,
            hintStyle: context.theme.textTheme.button!
                .copyWith(color: context.theme.colorScheme.onError),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
