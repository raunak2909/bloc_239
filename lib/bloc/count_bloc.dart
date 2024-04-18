import 'package:bloc_239/bloc/count_event.dart';
import 'package:bloc_239/bloc/count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CountBloc extends Bloc<CountEvent, int>{

  CountBloc() : super(0){

    on<IncrementCount>((event, emit){
      /// you will build the logic for the above event
      emit(state + 1);
      
    });
    
    on<DecrementCount>((event, emit) {
      if(state>0){
        emit(state - 1);
      }
    });

  }

}