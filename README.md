# EasyRequest
A simple framework that makes easy the communication with your Backend


### Example

```swift
class UseEasyRequest: EasyRequestProtocol {
	
	func anyRequest () {
		var easyRequest = EasyRequest(baseUrl: "http://localhost:3000")

		easyRequest.addCommonHeader(key: "application/x-www-form-urlencoded", value: "Content-Type")
		
		var parameters = [[String:String]]

		easyRequest.executeRequest(
			to: "api/itens", 
			withParameters: , 
			usingMethod: .get, 
			andSpecificHeaders: nil, 
			sending: nil
		)
	}

	func delegateEasyRequestSuccess() {
		// Do anything when request is success
	}

	func delegateEasyRequestError(error: EasyRequestErrors) {
		// Do anything when request is fail
	}
}
```

### Methods

```swift
var easyRequest = EasyRequest(baseUrl: String)
```

```swift
easyRequest.addCommonHeader(key: String, value: String)
```

```swift
easyRequest.removeCommonHeader(named: String)
```

```swift
easyRequest.setCommonHeaders(headers: [[String: String]])
```

```swift
easyRequest.executeRequest(
	to: String, 
	withParameters: [[String: String]], 
	usingMethod: EasyRequestMethods, 
	andSpecificHeaders: [[String: String]], 
	sending: Data?
)
```


### Protocol EasyRequestDelegate


delegate that returns success request. Contains the response body.

```swift
func delegateEasyRequestSuccess()
```

delegate that returns fail request. Contains the response body, the status code, the error message and ...

```swift
func delegateEasyRequestError(error: EasyRequestErrors)
```

### Enum EasyRequestMethods

Enum that contains default http request methods.

```swift
EasyRequestMethods.get
EasyRequestMethods.post
EasyRequestMethods.put
EasyRequestMethods.delete
EasyRequestMethods.patch
```