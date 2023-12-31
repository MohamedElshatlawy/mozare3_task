import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/depindancy_injection.dart';
import '../../../core/blocs/generic_cubit/generic_cubit.dart';
import '../../../core/common/app_colors/app_colors.dart';
import '../../fav/view/fav_screen.dart';
import '../../home/view/home_screen.dart';
import 'main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = 'Main Screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = sl<MainScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericCubitState<int>>(
        bloc: viewModel.screenIndex,
        builder: (context, screenIndexStates) {
          return Scaffold(
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(33.0), // adjust to your liking
                  topRight: Radius.circular(33.0), // adjust to your liking
                ),
                color: AppColors.white, // put the color here
              ),
              child: BottomNavigationBar(
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                selectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                iconSize: 30,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.grey.withOpacity(0.3),
                selectedIconTheme:
                    const IconThemeData(color: AppColors.primaryColor),
                unselectedIconTheme:
                    IconThemeData(color: AppColors.grey.withOpacity(0.3)),
                onTap: (value) {
                  viewModel.screenIndexChanged(index: value);
                  viewModel.pageController.jumpToPage(value);
                },
                selectedFontSize: 14.sp,
                currentIndex: screenIndexStates.data,
                backgroundColor: AppColors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: screenIndexStates.data == 0
                          ? AppColors.primaryColor
                          : AppColors.grey.withOpacity(0.3),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: screenIndexStates.data == 1
                          ? AppColors.primaryColor
                          : AppColors.grey.withOpacity(0.3),
                    ),
                    label: "Fav",
                  ),
                ],
              ),
            ),
            body: SizedBox.expand(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewModel.pageController,
                onPageChanged: (index) {},
                children: [
                  HomeScreen(viewModel: viewModel.homeScreenViewModel),
                  FavScreen(viewModel: viewModel.homeScreenViewModel),
                ],
              ),
            ),
            // viewModel.screens[screenIndexStates.data],
          );
        });
  }
}
