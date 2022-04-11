# drinkinggame_api.api.FeedbackApi

## Load the API package
```dart
import 'package:drinkinggame_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserFeedback**](FeedbackApi.md#getuserfeedback) | **GET** /feedback | 
[**sendFeedback**](FeedbackApi.md#sendfeedback) | **POST** /feedback | 


# **getUserFeedback**
> BuiltList<FeedbackDto> getUserFeedback()



Gets all User Feedback

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getFeedbackApi();

try {
    final response = api.getUserFeedback();
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeedbackApi->getUserFeedback: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;FeedbackDto&gt;**](FeedbackDto.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendFeedback**
> sendFeedback(feedbackDto)



Saves user Feedback

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = DrinkinggameApi().getFeedbackApi();
final FeedbackDto feedbackDto = ; // FeedbackDto | 

try {
    api.sendFeedback(feedbackDto);
} catch on DioError (e) {
    print('Exception when calling FeedbackApi->sendFeedback: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedbackDto** | [**FeedbackDto**](FeedbackDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

