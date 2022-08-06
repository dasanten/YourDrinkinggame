# drinkinggame_api.api.ModerratingApi

## Load the API package
```dart
import 'package:drinkinggame_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**banUser**](ModerratingApi.md#banuser) | **POST** /moderating/ban/{userId} | 
[**getBannedUsers**](ModerratingApi.md#getbannedusers) | **GET** /moderating/ban/ | 
[**modRemoveCard**](ModerratingApi.md#modremovecard) | **DELETE** /moderating/card/{cardId} | 
[**modRemoveCardSet**](ModerratingApi.md#modremovecardset) | **DELETE** /moderating/cardSet/{cardSetId} | 
[**setUserRole**](ModerratingApi.md#setuserrole) | **POST** /moderating/role/{e-mail} | 
[**unbanUser**](ModerratingApi.md#unbanuser) | **PUT** /moderating/unban/{userId} | 


# **banUser**
> UserDto banUser(userId)



Bans User.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();
final String userId = userId_example; // String | 

try {
    final response = api.banUser(userId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->banUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserDto**](UserDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBannedUsers**
> BuiltList<UserDto> getBannedUsers()



Gets all currently banned Users

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();

try {
    final response = api.getBannedUsers();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->getBannedUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserDto&gt;**](UserDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modRemoveCard**
> modRemoveCard(cardId)



Remove Card as Moderator.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();
final String cardId = cardId_example; // String | 

try {
    api.modRemoveCard(cardId);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->modRemoveCard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **modRemoveCardSet**
> modRemoveCardSet(cardSetId)



Remove Cardset as Moderator.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();
final String cardSetId = cardSetId_example; // String | 

try {
    api.modRemoveCardSet(cardSetId);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->modRemoveCardSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setUserRole**
> UserDto setUserRole(eMail, body)



Changes User role.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();
final String eMail = eMail_example; // String | 
final String body = ; // String | 

try {
    final response = api.setUserRole(eMail, body);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->setUserRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eMail** | **String**|  | 
 **body** | **String**|  | 

### Return type

[**UserDto**](UserDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unbanUser**
> UserDto unbanUser(userId)



Unbans User.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getModerratingApi();
final String userId = userId_example; // String | 

try {
    final response = api.unbanUser(userId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ModerratingApi->unbanUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserDto**](UserDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

