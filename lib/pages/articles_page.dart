import 'package:flutter/material.dart';
import 'package:test_project/blocs/articles/articles_cubit.dart';
import 'package:test_project/constants/color_constants.dart';
import 'package:test_project/function/date_formatting.dart';
import 'package:test_project/themes/text_themes.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Themes.light.textTheme;
    final articlesCubit = context.read<ArticlesCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "User",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<ArticlesCubit, ArticlesState>(
                  bloc: articlesCubit,
                  builder: (context, state) {
                    if (state is ArticlesSuccess) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                right: 16,
                              ),
                              width: 200,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    state.articles[index].title ?? "",
                                    style: textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Flexible(
                                    child: Text(
                                      state.articles[index].content ?? "",
                                      style: textTheme.bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: state.articles.length,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<ArticlesCubit, ArticlesState>(
                  bloc: articlesCubit,
                  builder: (context, state) {
                    if (state is ArticlesSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ColorConstants.tertiaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          state.articles[index].image ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                      child: Text(
                                        state.articles[index].title ?? "",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  state.articles[index].content ?? "",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  formatDate(
                                    state.articles[index].created!.date!,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: state.articles.length,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
