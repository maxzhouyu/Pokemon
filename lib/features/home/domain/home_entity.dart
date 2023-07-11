import 'package:clean_framework/clean_framework.dart';

class HomeEntity extends Entity {
  const HomeEntity({this.id = ''});

  final String id;

  @override
  List<Object> get props => [id];

  @override
  HomeEntity copyWith({String? id}) {
    return HomeEntity(id: id ?? this.id);
  }
}
