//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FeedbackApi {
  FeedbackApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Gets all User Feedback
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getUserFeedbackWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/feedback';

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Gets all User Feedback
  Future<List<FeedbackDto>> getUserFeedback() async {
    final response = await getUserFeedbackWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<FeedbackDto>') as List)
        .cast<FeedbackDto>()
        .toList(growable: false);

    }
    return Future<List<FeedbackDto>>.value();
  }

  /// Saves user Feedback
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [FeedbackDto] feedbackDto (required):
  Future<Response> sendFeedbackWithHttpInfo(FeedbackDto feedbackDto,) async {
    // Verify required params are set.
    if (feedbackDto == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: feedbackDto');
    }

    // ignore: prefer_const_declarations
    final path = r'/feedback';

    // ignore: prefer_final_locals
    Object postBody = feedbackDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Saves user Feedback
  ///
  /// Parameters:
  ///
  /// * [FeedbackDto] feedbackDto (required):
  Future<void> sendFeedback(FeedbackDto feedbackDto,) async {
    final response = await sendFeedbackWithHttpInfo(feedbackDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
