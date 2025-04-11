import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/ui/Search/Search_ViewModel.dart';

import '../../../reusableComponats/customTextFormField.dart';
import '../../NewsList/widget/ArticleItem.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "SearchScreen";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      if(textEditingController.text.isNotEmpty)
      context.read<SearchViewModel>().getSearchedArticles(textEditingController.text.trim());
    });

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: REdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: CustomTextFormField(
                  onChange: (){

                    setState(() {

                    });
                  },
                  prefixIcon: ImageManger.searchIcon,
                  controller: textEditingController,
                  hint: StringManger.search,
                )),
            Visibility(visible: textEditingController.text.isNotEmpty,
              child: BlocConsumer<SearchViewModel,SearchState>(
                builder: (context, state) {
                  if(state is LoadingState){
                    return Center( child:  CircularProgressIndicator(color: ColorManger.tertiary,),);
                  }else if(state is ErrorState){
                    return Center(child: Text(state.errorMassage!),);
                  }else if(state is EmptyState){
                    return Center(child: Text("No Articles Found") ,);
                  }else{
                    var response=(state as SuccessState).response;
                    return Expanded(
                      child: Padding(
                        padding: REdgeInsets.all(16),
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              ArticleItem(articles: response[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16.h,
                          ),
                          itemCount: response!.length ?? 0,
                        ),
                      ),
                    );
                  }

                },
                listener: (context, state) {

                },),
            ),
          ],
        ),
      ),
    );
  }
}
