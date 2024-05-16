// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_movie_app/src/api/constant/api_constant.dart';

class ApiService {
  final Dio dioService;

  

  ApiService({required this.dioService});

  
}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});


final baseOptionProvider = Provider<BaseOptions>((ref) {
  return BaseOptions(
    baseUrl: ApiConstant.base,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );
});