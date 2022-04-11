# drinkinggame_api.api.ConfigureApi

## Load the API package
```dart
import 'package:drinkinggame_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cardSetChangeUserRole**](ConfigureApi.md#cardsetchangeuserrole) | **PUT** /configure/cardset/{cardSetId}/user/{e-mail} | 
[**getCardSetSpecialUsers**](ConfigureApi.md#getcardsetspecialusers) | **GET** /configure/cardset/{cardSetId}/user | 


# **cardSetChangeUserRole**
> UserDto cardSetChangeUserRole(cardSetId, eMail, body)



Changes Role of User for Cardset.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getConfigureApi();
final String cardSetId = cardSetId_example; // String | 
final String eMail = eMail_example; // String | 
final String body = ; // String | 

try {
    final response = api.cardSetChangeUserRole(cardSetId, eMail, body);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ConfigureApi->cardSetChangeUserRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetId** | **String**|  | 
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

# **getCardSetSpecialUsers**
> BuiltList<UserWithCardSetRole> getCardSetSpecialUsers(cardSetId)



Gets List of special Users of Cardset.

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getConfigureApi();
final String cardSetId = cardSetId_example; // String | 

try {
    final response = api.getCardSetSpecialUsers(cardSetId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ConfigureApi->getCardSetSpecialUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cardSetId** | **String**|  | 

### Return type

[**BuiltList&lt;UserWithCardSetRole&gt;**](UserWithCardSetRole.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

