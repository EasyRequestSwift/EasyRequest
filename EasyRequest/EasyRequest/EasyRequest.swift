//
//  EasyRequestProtocol.swift
//  EasyRequest
//
//  Created by Guilherme Baldissera on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation

public enum EasyRequestMethods : String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
	case patch = "PATCH"
}

public protocol EasyRequestDelegate {
    func delegateEasyRequestSuccess(body: Data?, headers: [AnyHashable: Any], status: Int)
	func delegateEasyRequestError(error: Error)
}

public class EasyRequest {
	
	// MARK: - Attributes
    private var baseUrl: URL
	private var commonHeaders : [[String: String]] = []
    private var environment: [[String: String]] = []

    public var delegate: EasyRequestDelegate?

    public init(baseUrl: String) {
        self.baseUrl = URL(string: baseUrl)!
    }
	
	// MARK: - Manage Headers
    // Function to add Headers to use in request
	public func addCommonHeader(key: String, value: String) {
        self.commonHeaders.append([key: value])
	}

    // Function to remove header
    public func removeCommonHeader(named name: String) {
        self.commonHeaders = self.commonHeaders.filter() { header in header.keys.first! != name }
    }

    // Function to set all headers at once
    public func setCommonHeaders(headers: [[String: String]]) {
        self.commonHeaders = headers
    }

	// MARK: - Requests
	public func executeRequest(
        to pathUrl: String,
        withParameters params: [[String: String]],
        usingMethod method: EasyRequestMethods,
        andSpecificHeaders specificHeaders: [[String: String]],
        sendingBody body: Data?)
    {
        let urlRequest = createURLRequest(to: "", withParameters: [], usingMethod: .get, andSpecificHeaders: [], sending: nil)

        doRequest(withUrlRequest: urlRequest)

		// Execute request withou parameters, use url setted in addUrl
	}
	
    // Function to finally execute request to url informatted
    private func doRequest(withUrlRequest urlRequest: URLRequest) {
        let session = URLSession(configuration: .default)

        let dataTask = session.dataTask(with: urlRequest, completionHandler: sessionCompletionHandler)

        dataTask.resume()
	}

    private func sessionCompletionHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let errorReceived = error {
            self.delegate?.delegateEasyRequestError(error: errorReceived)
        }

        let headers = (response as! HTTPURLResponse).allHeaderFields
        let status = (response as! HTTPURLResponse).statusCode

        self.delegate?.delegateEasyRequestSuccess(body: data, headers: headers, status: status)
    }

    private func createURLRequest (
        to pathUrl: String,
        withParameters params: [[String: String]],
        usingMethod method: EasyRequestMethods,
        andSpecificHeaders specificHeaders: [[String: String]],
        sending body: Data?) -> URLRequest
    {
        var request = URLRequest(url: URL(string: pathUrl, relativeTo: self.baseUrl)!)
        request.httpMethod = method.rawValue
        request.httpBody = body

        let headers = (specificHeaders.count == 0) ? self.commonHeaders : specificHeaders

        for header in headers {
            request.setValue(header.values.first, forHTTPHeaderField: header.keys.first!)
        }

        return request
    }
}
