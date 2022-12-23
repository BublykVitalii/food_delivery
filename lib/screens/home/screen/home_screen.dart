import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/cart/screen/cubit/cart_cubit.dart';

import 'package:food_delivery/utils/localization_extensions.dart';

import 'package:food_delivery/widgets/scaffold_with_drawer.dart';
import 'package:food_delivery/screens/home/screen/cubit/home_cubit.dart';
import 'package:food_delivery/screens/home/screen/widgets/category_tabs.dart';
import 'package:food_delivery/screens/home/screen/widgets/food_category.dart';
import 'package:food_delivery/screens/home/screen/widgets/search_food.dart';
import 'package:food_delivery/screens/home/screen/widgets/top_text.dart';

// ---Parameters---
const _kHeightCart = 360.0;
const _kHeightBox = 100.0;
const _kViewportFraction = 0.8;

class HomeScreen extends StatefulWidget {
  static const _routeName = '/home-screen';

  static PageRoute<HomeScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
            ),
            BlocProvider<CartCubit>(
              create: (BuildContext context) => CartCubit(),
            ),
          ],
          child: const HomeScreen(),
        );
      },
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  HomeCubit get homeCubit => BlocProvider.of<HomeCubit>(context);
  final PageController _pageController = PageController(
    viewportFraction: _kViewportFraction,
  );

  @override
  void initState() {
    super.initState();
    homeCubit.getFoods();

    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index == 0) {
        homeCubit.getCategories(context.localizations.foods);
      } else if (_tabController.index == 1) {
        homeCubit.getCategories(context.localizations.drinks);
      } else if (_tabController.index == 2) {
        homeCubit.getCategories(context.localizations.snacks);
      } else if (_tabController.index == 3) {
        homeCubit.getCategories(context.localizations.sauce);
      } else if (_tabController.index == 4) {
        homeCubit.getCategories(context.localizations.salads);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: ScaffoldWithDrawer(
            withBottomNavBar: true,
            body: ListView(
              children: [
                TopText(text: context.localizations.delicious),
                const SearchFood(),
                CategoryTabs(tabController: _tabController),
                SizedBox(
                  height: _kHeightCart,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: state.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      final food = state.foods[index];
                      return FoodCategory(
                        isLoading: state.status == HomeStatus.loading,
                        food: food,
                      );
                    },
                  ),
                ),
                const SizedBox(height: _kHeightBox),
              ],
            ),
          ),
        );
      },
    );
  }
}
