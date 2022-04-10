# drinkinggame_api.api.CardsetApi

## Load the API package
```dart
import 'package:drinkinggame_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addCardSet**](CardsetApi.md#addcardset) | **POST** /cardset | 
[**deleteCardSet**](CardsetApi.md#deletecardset) | **DELETE** /cardset/{id} | 
[**editCardSet**](CardsetApi.md#editcardset) | **PUT** /cardset | 
[**favorCardSet**](CardsetApi.md#favorcardset) | **POST** /cardset/favor/{id} | 
[**getCardSetById**](CardsetApi.md#getcardsetbyid) | **GET** /cardset/{id} | 
[**getTopCardSets**](CardsetApi.md#gettopcardsets) | **GET** /cardset | 
[**reportCardSet**](CardsetApi.md#reportcardset) | **POST** /cardset/report/{id} | 
[**searchCardSets**](CardsetApi.md#searchcardsets) | **GET** /cardset/search | 


# **addCardSet**
> CardSetDto addCardSet(cardSetDto)



Adds Cardset with corresponding Cards.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final cardSetDto = CardSetDto(); // CardSetDto | 

try {
    final result = api_instance.addCardSet(cardSetDto);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->addCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetDto** | [**CardSetDto**](CardSetDto.md)|  | 

### Return type

[**CardSetDto**](CardSetDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCardSet**
> deleteCardSet(id)



Adds Cardset with corresponding Cards.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final id = id_example; // String | 

try {
    api_instance.deleteCardSet(id);
} catch (e) {
    print('Exception when calling CardsetApi->deleteCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editCardSet**
> CardSetDto editCardSet(cardSetDto)



Edits Cardset with corresponding Cards.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final cardSetDto = CardSetDto(); // CardSetDto | 

try {
    final result = api_instance.editCardSet(cardSetDto);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->editCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetDto** | [**CardSetDto**](CardSetDto.md)|  | 

### Return type

[**CardSetDto**](CardSetDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **favorCardSet**
> CardSetBasicDto favorCardSet(id)



Favors Cardset.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final id = id_example; // String | 

try {
    final result = api_instance.favorCardSet(id);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->favorCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**CardSetBasicDto**](CardSetBasicDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCardSetById**
> CardSetDto getCardSetById(id)



Returns a Cardset by it's id with cards.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final id = id_example; // String | 

try {
    final result = api_instance.getCardSetById(id);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->getCardSetById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**CardSetDto**](CardSetDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTopCardSets**
> List<CardSetBasicDto> getTopCardSets(start)



Returns a list of 20 Cardsets sorted by likes.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final start = 56; // int | Sets amount of skipped sets

try {
    final result = api_instance.getTopCardSets(start);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->getTopCardSets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**| Sets amount of skipped sets | 

### Return type

[**List<CardSetBasicDto>**](CardSetBasicDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportCardSet**
> CardSetBasicDto reportCardSet(id)



Reports Cardset.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final id = id_example; // String | 

try {
    final result = api_instance.reportCardSet(id);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->reportCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**CardSetBasicDto**](CardSetBasicDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCardSets**
> List<CardSetBasicDto> searchCardSets(query, start)



Returns a list of 20 Cardsets similar to query.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CardsetApi();
final query = query_example; // String | Sets start point
final start = 56; // int | Sets start point

try {
    final result = api_instance.searchCardSets(query, start);
    print(result);
} catch (e) {
    print('Exception when calling CardsetApi->searchCardSets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Sets start point | 
 **start** | **int**| Sets start point | 

### Return type

[**List<CardSetBasicDto>**](CardSetBasicDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

