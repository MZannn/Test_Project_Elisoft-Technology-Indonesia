import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_project/models/articles_model.dart';
import 'package:test_project/services/api_service.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ApiService _apiService = ApiService();
  ArticlesCubit() : super(ArticlesInitial());

  void getArticles() async {
    try {
      emit(ArticlesLoading());

      final response = await _apiService.get(
        endpoint: 'articles',
        requireToken: true,
      );
      final ArticleModel articleModel = ArticleModel.fromJson(response);
      emit(
        ArticlesSuccess(articles: articleModel.articles!),
      );
    } catch (e) {
      emit(
        ArticlesError(
          message: e.toString(),
        ),
      );
    }
  }
}
