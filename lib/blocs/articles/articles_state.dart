part of 'articles_cubit.dart';

@immutable
abstract class ArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {
  final List<Article> articles;
  ArticlesSuccess({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ArticlesError extends ArticlesState {
  final String message;
  ArticlesError({required this.message});

  @override
  List<Object> get props => [message];
}
