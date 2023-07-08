import 'package:flutter/material.dart';
import 'package:movies_app/MyTheme.dart';
import 'package:movies_app/category/category_screen_viewModel.dart';
import 'package:movies_app/category/genreStack.dart';
import 'package:provider/provider.dart';

import 'category_films_screen.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'category_screen';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryScreenViewModel viewModel = CategoryScreenViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getGenres();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryScreenViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.genresList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.yellowColor,
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, CategoryFilmsScreen.routeName,arguments:'${viewModel.genresList![index].id}');
                    },
                    child: GenreStack(genre: viewModel.genresList![index]));
              },
              itemCount: viewModel.genresList?.length,
            );
          }
        },
      ),
    );
  }
}
