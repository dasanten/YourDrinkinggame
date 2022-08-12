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
[**getNewestCardSetVersions**](CardsetApi.md#getnewestcardsetversions) | **GET** /cardset/version | 
[**getTopCardSets**](CardsetApi.md#gettopcardsets) | **GET** /cardset | 
[**reportCardSet**](CardsetApi.md#reportcardset) | **POST** /cardset/report/{id} | 
[**searchCardSets**](CardsetApi.md#searchcardsets) | **GET** /cardset/search | 


# **addCardSet**
> CardSetDto addCardSet(cardSetDto)



Adds Cardset with corresponding Cards.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final CardSetDto cardSetDto = ; // CardSetDto | 

try {
    final response = api.addCardSet(cardSetDto);
    print(response);
} catch on DioError (e) {
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
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final String id = id_example; // String | 

try {
    api.deleteCardSet(id);
} catch on DioError (e) {
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
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final CardSetDto cardSetDto = ; // CardSetDto | 

try {
    final response = api.editCardSet(cardSetDto);
    print(response);
} catch on DioError (e) {
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
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final String id = id_example; // String | 

try {
    final response = api.favorCardSet(id);
    print(response);
} catch on DioError (e) {
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
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final String id = id_example; // String | 

try {
    final response = api.getCardSetById(id);
    print(response);
} catch on DioError (e) {
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

# **getNewestCardSetVersions**
> BuiltList<CardSetDto> getNewestCardSetVersions(cardSetVersionDto)



Returns a list of all cardsets that have a new version.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final CardSetVersionDto cardSetVersionDto = ; // CardSetVersionDto | 

try {
    final response = api.getNewestCardSetVersions(cardSetVersionDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CardsetApi->getNewestCardSetVersions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetVersionDto** | [**CardSetVersionDto**](CardSetVersionDto.md)|  | 

### Return type

[**BuiltList&lt;CardSetDto&gt;**](CardSetDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTopCardSets**
> BuiltList<CardSetBasicDto> getTopCardSets(start)



Returns a list of 20 Cardsets sorted by likes.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final int start = 56; // int | Sets amount of skipped sets

try {
    final response = api.getTopCardSets(start);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CardsetApi->getTopCardSets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**| Sets amount of skipped sets | 

### Return type

[**BuiltList&lt;CardSetBasicDto&gt;**](CardSetBasicDto.md)

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
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final String id = id_example; // String | 

try {
    final response = api.reportCardSet(id);
    print(response);
} catch on DioError (e) {
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
> BuiltList<CardSetBasicDto> searchCardSets(query, start)



Returns a list of 20 Cardsets similar to query.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getCardsetApi();
final String query = query_example; // String | Sets start point
final int start = 56; // int | Sets start point

try {
    final response = api.searchCardSets(query, start);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CardsetApi->searchCardSets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Sets start point | 
 **start** | **int**| Sets start point | 

### Return type

[**BuiltList&lt;CardSetBasicDto&gt;**](CardSetBasicDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

