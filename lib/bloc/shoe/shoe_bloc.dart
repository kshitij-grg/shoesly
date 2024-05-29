import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(ShoeInitial()) {
    on<ShoeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
