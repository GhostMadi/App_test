part of 'detail_business_process_bloc.dart';

@immutable
sealed class DetailBusinessProcessEvent {}



class FetchDetailBusinessProcess extends DetailBusinessProcessEvent{
  final String idCompany;
  final String id;

  FetchDetailBusinessProcess({required this.idCompany, required this.id});

}