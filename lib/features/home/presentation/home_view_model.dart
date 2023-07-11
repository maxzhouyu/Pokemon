import 'package:clean_framework/clean_framework.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
