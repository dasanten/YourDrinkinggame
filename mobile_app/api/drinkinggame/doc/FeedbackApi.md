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
> List<FeedbackDto> getUserFeedback()



Gets all User Feedback

### Example
```dart
import 'package:drinkinggame_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FeedbackApi();

try {
    final result = api_instance.getUserFeedback();
    print(result);
} catch (e) {
    print('Exception when calling FeedbackApi->getUserFeedback: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<FeedbackDto>**](FeedbackDto.md)

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
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FeedbackApi();
final feedbackDto = FeedbackDto(); // FeedbackDto | 

try {
    api_instance.sendFeedback(feedbackDto);
} catch (e) {
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

