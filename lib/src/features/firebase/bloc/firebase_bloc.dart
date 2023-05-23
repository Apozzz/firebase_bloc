import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial()) {
    on<FirebaseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
