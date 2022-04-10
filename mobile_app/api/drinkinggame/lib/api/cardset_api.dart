//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CardsetApi {
  CardsetApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Adds Cardset with corresponding Cards.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CardSetDto] cardSetDto (required):
  Future<Response> addCardSetWithHttpInfo(CardSetDto cardSetDto,) async {
    // Verify required params are set.
    if (cardSetDto == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: cardSetDto');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset';

    // ignore: prefer_final_locals
    Object postBody = cardSetDto;

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

  /// Adds Cardset with corresponding Cards.
  ///
  /// Parameters:
  ///
  /// * [CardSetDto] cardSetDto (required):
  Future<CardSetDto> addCardSet(CardSetDto cardSetDto,) async {
    final response = await addCardSetWithHttpInfo(cardSetDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CardSetDto',) as CardSetDto;
    
    }
    return Future<CardSetDto>.value();
  }

  /// Adds Cardset with corresponding Cards.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> deleteCardSetWithHttpInfo(String id,) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Adds Cardset with corresponding Cards.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> deleteCardSet(String id,) async {
    final response = await deleteCardSetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Edits Cardset with corresponding Cards.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CardSetDto] cardSetDto (required):
  Future<Response> editCardSetWithHttpInfo(CardSetDto cardSetDto,) async {
    // Verify required params are set.
    if (cardSetDto == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: cardSetDto');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset';

    // ignore: prefer_final_locals
    Object postBody = cardSetDto;

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

  /// Edits Cardset with corresponding Cards.
  ///
  /// Parameters:
  ///
  /// * [CardSetDto] cardSetDto (required):
  Future<CardSetDto> editCardSet(CardSetDto cardSetDto,) async {
    final response = await editCardSetWithHttpInfo(cardSetDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CardSetDto',) as CardSetDto;
    
    }
    return Future<CardSetDto>.value();
  }

  /// Favors Cardset.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> favorCardSetWithHttpInfo(String id,) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset/favor/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>[];


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

  /// Favors Cardset.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<CardSetBasicDto> favorCardSet(String id,) async {
    final response = await favorCardSetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CardSetBasicDto',) as CardSetBasicDto;
    
    }
    return Future<CardSetBasicDto>.value();
  }

  /// Returns a Cardset by it's id with cards.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getCardSetByIdWithHttpInfo(String id,) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset/{id}'
      .replaceAll('{id}', id);

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

  /// Returns a Cardset by it's id with cards.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<CardSetDto> getCardSetById(String id,) async {
    final response = await getCardSetByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CardSetDto',) as CardSetDto;
    
    }
    return Future<CardSetDto>.value();
  }

  /// Returns a list of 20 Cardsets sorted by likes.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] start (required):
  ///   Sets amount of skipped sets
  Future<Response> getTopCardSetsWithHttpInfo(int start,) async {
    // Verify required params are set.
    if (start == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: start');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset';

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'start', start));

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

  /// Returns a list of 20 Cardsets sorted by likes.
  ///
  /// Parameters:
  ///
  /// * [int] start (required):
  ///   Sets amount of skipped sets
  Future<List<CardSetBasicDto>> getTopCardSets(int start,) async {
    final response = await getTopCardSetsWithHttpInfo(start,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CardSetBasicDto>') as List)
        .cast<CardSetBasicDto>()
        .toList(growable: false);

    }
    return Future<List<CardSetBasicDto>>.value();
  }

  /// Reports Cardset.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> reportCardSetWithHttpInfo(String id,) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset/report/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['bearerAuth'];
    const contentTypes = <String>[];


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

  /// Reports Cardset.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<CardSetBasicDto> reportCardSet(String id,) async {
    final response = await reportCardSetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CardSetBasicDto',) as CardSetBasicDto;
    
    }
    return Future<CardSetBasicDto>.value();
  }

  /// Returns a list of 20 Cardsets similar to query.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   Sets start point
  ///
  /// * [int] start (required):
  ///   Sets start point
  Future<Response> searchCardSetsWithHttpInfo(String query, int start,) async {
    // Verify required params are set.
    if (query == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: query');
    }
    if (start == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: start');
    }

    // ignore: prefer_const_declarations
    final path = r'/cardset/search';

    // ignore: prefer_final_locals
    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'query', query));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'start', start));

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

  /// Returns a list of 20 Cardsets similar to query.
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   Sets start point
  ///
  /// * [int] start (required):
  ///   Sets start point
  Future<List<CardSetBasicDto>> searchCardSets(String query, int start,) async {
    final response = await searchCardSetsWithHttpInfo(query, start,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CardSetBasicDto>') as List)
        .cast<CardSetBasicDto>()
        .toList(growable: false);

    }
    return Future<List<CardSetBasicDto>>.value();
  }
}
