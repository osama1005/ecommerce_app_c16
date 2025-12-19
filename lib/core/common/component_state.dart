import 'package:equatable/equatable.dart';

sealed class ComponentState<T> extends Equatable{}

class InitialState<T> extends ComponentState<T>{
  @override
  List<Object?> get props => [];
}

class LoadingState<T> extends ComponentState<T>{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SuccessState<T> extends ComponentState<T>{
  T data ;
  SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState<T> extends ComponentState<T>{
  Exception exception ;
  ErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}



