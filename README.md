# EasyRequest
A simple framework for `Swift` that makes easy the communication with your Backend server.

<br>

### Example

```swift
class UseEasyRequest: EasyRequestProtocol {
	
	var easyRequest: EasyRequest

	// Example init for you class
	init () {
		var easyRequest = EasyRequest(baseUrl: "http://localhost:3000")
		easyRequest.addCommonHeader(key: "application/x-www-form-urlencoded", value: "Content-Type")
	}

	// Any request function called when you want to do server request
	func anyRequest () {
		
		// Your parameters for send to server
		var parameters:[[String:String]] = []
		parameters.append(["any-parameter":"value-of-parameter"])
		parameters.append(["any-parameter2":"value-of-parameter2"])

		self.easyRequest.executeRequest(
			to: "api/itens", 
			withParameters: parameters, 
			usingMethod: .get, 
			andSpecificHeaders: nil, 	// Can be [[String:String]] 
			sending: nil 	
			// Can be any attribute of Data type
		)
	}

	func delegateEasyRequestSuccess() {
		// Do anything when request is success ...
	}

	func delegateEasyRequestError(error: Error) {
		// Do anything when request is fail ...
	}
}
```  
<br>

### Methods

- ###### Init method with baseUrl that will be used in all requests.  

	If you want to request `http://localhost:3000/api/any-path` you need to set baseUrl with `http://localhost:3000` for after just pass `api/any-path` when you do the request.
```swift
var easyRequest = EasyRequest(baseUrl: String)
```  
<br>

- ###### Add Common Header with the key and value  

	Common headers that will be send in request when specific headers are not informated.  
	This is for add new Commons Headers passing the key and the value, for send to request url.
```swift
easyRequest.addCommonHeader(key: String, value: String)
```  
<br>

- ###### Remove Common Header that already added

	Needed to pass the name of the key that you want to remove.
```swift
easyRequest.removeCommonHeader(named: String)
```  
<br>


- ###### Setting many Common Headers in the same time.

	Needed to pass an array of dictionary with keys and correspondent values.
```swift
easyRequest.setCommonHeaders(headers: [[String: String]])
```  
<br>

- ###### Finally execute the request

	This method will send the request for your server.  
	Parameters:   
	- `to` that will be your `api/any-path`, exemplified in init method.
	- `withParameters` is an array of dictionary with string key and string value.
	- `usingMethod` is an enum to select your http request method type. (See Enum EasyRequestMethods)
	- `andSpecificHeaders` are your headers to use just in this request. If you passed this information, the Common Headers are ignored in this request. Otherwise, with this parameter is `nil`, the common headers are sended. 
	- `sending` if you needed to send anything in body request, this is the parameter that you put the informations.
```swift
easyRequest.executeRequest(
	to: String, 
	withParameters: [[String: String]], 
	usingMethod: EasyRequestMethods, 
	andSpecificHeaders: [[String: String]], 
	sendingBody: Data?
)
```  
<br>


### Protocol EasyRequestDelegate


- ###### Delegate Request Success Done

	This delegate will be call when you request execute with success.
	Contains the attributes:
	- `body` response body from your server.
	- `headers` headers are returned from you server.
	- `status` request status code.  

**Obs:** Any status code can return. Success refers to requisition are done with success, making possible to you decide what do with any response status code.
```swift
func delegateEasyRequestSuccess(
	body: Data?, 
	headers: [AnyHashable: Any], 
	status: Int
)
```  
<br>

- ###### Delegate Request Fail
	
	This delegate will be call when you request can`t be done.  
	The attribute is generical Error contains informations about the error when the request return.
```swift
func delegateEasyRequestError(error: Error)
```  
<br>

### Enum EasyRequestMethods

Enum that contains default http request methods.

```swift
EasyRequestMethods.get
EasyRequestMethods.post
EasyRequestMethods.put
EasyRequestMethods.delete
EasyRequestMethods.patch
```