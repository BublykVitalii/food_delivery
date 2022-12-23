import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/screens/search/screen/cubit/search_cubit.dart';
import 'package:food_delivery/screens/search/screen/widgets/app_bar_search.dart';
import 'package:food_delivery/screens/search/screen/widgets/food_detail.dart';
import 'package:food_delivery/screens/search/screen/widgets/not_found_food.dart';

// ---Parameters---
const _kRadius = Radius.circular(30);

class SearchScreen extends StatefulWidget {
  static const _routeName = '/search-screen';

  static PageRoute get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const SearchScreen();
      },
    );
  }

  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? inputValue;
  final _formKeyInputValue = GlobalKey<FormState>();
  SearchCubit get searchCubit => BlocProvider.of<SearchCubit>(context);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Form(
                key: _formKeyInputValue,
                child: AppBarSearch(
                  inputValue: (value) {
                    inputValue = value;
                    searchCubit.getCategories(inputValue!);
                  },
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: _kRadius,
                  topRight: _kRadius,
                ),
              ),
              child: state.foods.isEmpty
                  ? const NotFoundFood()
                  : FoodDetail(foods: state.foods),
            ),
          ),
        );
      },
    );
  }
}
