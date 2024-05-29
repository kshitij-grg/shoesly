part of 'shoe_bloc.dart';

sealed class ShoeState extends Equatable {
  const ShoeState();
  
  @override
  List<Object> get props => [];
}

final class ShoeInitial extends ShoeState {}
