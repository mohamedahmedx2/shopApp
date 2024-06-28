import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shop_app/shop_layout_home.dart';
import 'package:shop_app/modules/shop_app/register_screen/register_screen.dart';
import 'package:shop_app/modules/shop_app/shop_login/cubit/cubit.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import '../../../shared/components/components.dart';
import 'cubit/state.dart';

class ShopLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state)
        {
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel.status){
              print('message: ${state.loginModel.message}');
              print('token: ${state.loginModel.data.token}');
              showToast(text: state.loginModel.message, state: ToastStates.SUCCESS);

              CacheHelper.saveData(key: 'token', value:state.loginModel.data.token).then((value)
              {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  ShopLayout()),
                      (route) {
                    return false;
                  },
                );
              });

            } else
            {
              showToast(text: state.loginModel.message, state: ToastStates.ERROR);

            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                          // Theme.of(context).textTheme.headline5!.copyWith(
                          //       color: Colors.black,
                          //     ),
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                         TextFormField(
                          controller: emailController,
                          decoration:  InputDecoration(
                            label: const Text(
                              'Email Address',
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email adders';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // defaultFormField(
                        //   functionOnSub2: (value) {
                        //     if (formKey.currentState!.validate()) {
                        //       ShopLoginCubit.get(context).userLogin(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //       );
                        //     }
                        //     return null;
                        //   },
                        //   control1: emailController,
                        //   type: TextInputType.text,
                        //   validate: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'please enter your email adders';
                        //     }
                        //   },
                        //   label1: 'Email Address',
                        //   prefix1: Icons.email_outlined,
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        // TextFormField(
                        //   onFieldSubmitted: (value)
                        //   {
                        //     if (formKey.currentState!.validate()) {
                        //       ShopLoginCubit.get(context).userLogin(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //       );
                        //     }
                        //   },
                        //   controller: passwordController,
                        //   obscureText:  ShopLoginCubit.get(context).isPassword,
                        //   decoration:  InputDecoration(
                        //     suffix: ShopLoginCubit.get(context).suffix,
                        //     suffixIcon:  suffix != null ? IconButton(
                        //       onPressed: () {
                        //         ShopLoginCubit.get(context).suffix;
                        //       },
                        //       icon: Icon(
                        //         suffix,
                        //       ),
                        //     ) : null,
                        //    prefixIcon: Icon(Icons.lock),
                        //    // suffix: const Icon(Icons.visibility_outlined),
                        //  //   prefix: const Icon(Icons.lock),
                        //     label: const Text(
                        //       'password',
                        //     ),
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(20)
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'password is too short';
                        //     }
                        //     return null;
                        //   },
                        //   keyboardType: TextInputType.visiblePassword,
                        // ),
                        defaultFormField(
                          scureText: ShopLoginCubit.get(context).isPassword,
                          control1: passwordController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          suffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label1: 'password',
                          prefix1: Icons.lock,
                          suffix2: ShopLoginCubit.get(context).suffix,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUppercase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 16.5,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()),
                                );
                              },
                              child: const Text(
                                'Register',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
