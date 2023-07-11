import 'package:clean_framework/clean_framework.dart';

class HomeUIOutput extends Output {
  const HomeUIOutput({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
