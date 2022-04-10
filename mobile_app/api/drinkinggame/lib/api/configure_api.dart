//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ConfigureApi {
  ConfigureApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Changes Role of User for Cardset.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cardSetId (required):
  ///
  /// * [String] eMail (required):
  ///
  /// * [String] body (required):
  Future<Response> cardSetChangeUserRoleWithHttpInfo(String cardSetId, String eMail, String body,) async {
    // Verify required params are set.
    if (cardSetId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: cardSetId');
    }
    if (eMail == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eMail');
    }
    if (body == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: body');
    }

    // ignore: prefer_const_declarations
    final path = r'/configure/cardset/{cardSetId}/user/{e-mail}'
      .replaceAll('{cardSetId}', cardSetId)
      .replaceAll('{e-mail}', eMail);

    // ignore: prefer_final_locals
    Object postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Changes Role of User for Cardset.
  ///
  /// Parameters:
  ///
  /// * [String] cardSetId (required):
  ///
  /// * [String] eMail (required):
  ///
  /// * [String] body (required):
  Future<UserDto> cardSetChangeUserRole(String cardSetId, String eMail, String body,) async {
    final response = await cardSetChangeUserRoleWithHttpInfo(cardSetId, eMail, body,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDto',) as UserDto;
    
    }
    return Future<UserDto>.value();
  }

  /// Gets List of special Users of Cardset.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cardSetId (required):
  Future<Response> getCardSetSpecialUsersWithHttpInfo(String cardSetId,) async {
    // Verify required params are set.
    if (cardSetId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: cardSetId');
    }

    // ignore: prefer_const_declarations
    final path = r'/configure/cardset/{cardSetId}/user'
      .replaceAll('{cardSetId}', cardSetId);

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

  /// Gets List of special Users of Cardset.
  ///
  /// Parameters:
  ///
  /// * [String] cardSetId (required):
  Future<List<UserWithCardSetRole>> getCardSetSpecialUsers(String cardSetId,) async {
    final response = await getCardSetSpecialUsersWithHttpInfo(cardSetId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserWithCardSetRole>') as List)
        .cast<UserWithCardSetRole>()
        .toList(growable: false);

    }
    return Future<List<UserWithCardSetRole>>.value();
  }
}
