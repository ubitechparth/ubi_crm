abstract class IApiService {
  /// Makes a POST request to the provided [endpoint] with the provided [payload].
  /// The [payload] is a map that is converted to JSON.
  /// Returns the response as a [Future].
  Future<dynamic> post({
    required String endpoint,
    required Map<String, dynamic> payload,
  });

}
