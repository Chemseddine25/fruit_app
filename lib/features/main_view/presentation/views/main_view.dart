import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_functions/show_error_bar.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/features/main_view/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/custom_navigation_bart_bottom.dart';
import 'package:fruit_app/features/main_view/presentation/views/widgets/main_view_body.dart';

import '../../domain/repos/favorite_repo.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'Main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(
        getIt.get<FavoriteRepo>(),
      )..getFavorites(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (int value) {
            setState(() {
              currentViewIndex = value;
            });
          },
        ),
        body: SafeArea(
          child: MainViewBlocListern(currentViewIndex: currentViewIndex),
        ),
      ),
    );
  }
}

class MainViewBlocListern extends StatelessWidget {
  const MainViewBlocListern({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
        listener: (BuildContext context, state) {
          if (state is FavoriteAddedSuccessfully) {
            showBar(
              context,
              message: 'تمت العملية بنجاح',
              color: Colors.green,
            );
          }
          if (state is FavoriteFailure) {
            showBar(context, message: 'حدث خطأ', color: Colors.red);
          }
        },
        child: MainViewBody(currentViewIndex: currentViewIndex));
  }
}
