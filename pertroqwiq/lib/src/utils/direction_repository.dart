import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pertroqwiq/src/features/home/model/direction_model.dart';
import '../utils/.env.dart';

class DirectionRepostory {
  static const String _baseURL =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionRepostory({required Dio dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirection({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(_baseURL, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${origin.latitude}, ${origin.longitude}',
      'key': googleAPIKey
    });

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }

    return null;
  }
}
