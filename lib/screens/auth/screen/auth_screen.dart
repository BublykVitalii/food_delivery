import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/screen/home_screen.dart';

import 'package:food_delivery/utils/localization_extensions.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';

import 'package:food_delivery/screens/auth/screen/cubit/auth_cubit.dart';
import 'package:food_delivery/screens/auth/screen/widgets/sign_in.dart';
import 'package:food_delivery/screens/auth/screen/widgets/registration.dart';
import 'package:food_delivery/screens/auth/screen/widgets/app_bar_auth.dart';

// ---Parameters---
const _kRadius = 18.0;

class AuthScreen extends StatefulWidget {
  static const _routeName = '/auth-screen';

  static PageRoute<AuthScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const AuthScreen(),
        );
      },
    );
  }

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  AuthCubit get authCubit => BlocProvider.of<AuthCubit>(context);
  String? email;
  String? password;
  String? username;
  bool isPasswordVisible = false;
  bool isPasswordVisibleRegOne = false;

  final _formKeyLogin = GlobalKey<FormState>();
  final _formKeyRegistration = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacement(context, HomeScreen.route);
        }
        if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(_snackBar(
            state.errorMessage!,
          ));
        }
      },
      builder: (context, state) {
        if (state.status == AuthStatus.loading) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: AppColors.lightOrange,
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height / 3),
              child: AppBarAuth(tabController: _tabController),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Form(
                    key: _formKeyLogin,
                    child: SignIn(
                        onSavedUsernameLogin: (value) {
                          username = value;
                        },
                        onSavedPasswordLogin: (value) {
                          password = value;
                        },
                        onPressed: _onPressedLoginUser,
                        isVisible: isPasswordVisible,
                        onShow: (value) {
                          setState(() {
                            isPasswordVisible = !value;
                          });
                        }),
                  ),
                  Form(
                    key: _formKeyRegistration,
                    child: Registration(
                      onSavedUsername: (value) {
                        username = value;
                      },
                      onSavedEmail: (value) {
                        email = value;
                      },
                      onSavedPassword: (value) {
                        password = value;
                      },
                      isVisible: isPasswordVisibleRegOne,
                      onShow: (value) {
                        setState(() {
                          isPasswordVisibleRegOne = !value;
                        });
                      },
                      onPressed: _onPressedSaveRegistration,
                      isLoading: state.status == AuthStatus.loading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onPressedLoginUser() {
    if (_formKeyLogin.currentState!.validate()) {
      _formKeyLogin.currentState!.save();
      authCubit.authorizationUser(
        username!,
        password!,
      );
    }
  }

  void _onPressedSaveRegistration() {
    if (_formKeyRegistration.currentState!.validate()) {
      _formKeyRegistration.currentState!.save();
      authCubit.registerAUsers(
        username!,
        email!,
        password!,
      );
    }
  }

  SnackBar _snackBar(String error) {
    return SnackBar(
      content: Text(
        context.localizations.errorRegistration,
        style: context.theme.textTheme.subtitle1!.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.lightOrange,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kRadius),
      ),
    );
  }
}
