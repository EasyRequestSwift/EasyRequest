//
//  EasyRequestProtocol.swift
//  EasyRequest
//
//  Created by Guilherme Baldissera on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation

enum EasyRequestMethods : String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
	case patch = "PATCH"
}

protocol EasyRequestDelegate {
	func delegateEasyRequestSuccess()
	func delegateEasyRequestError(error: EasyRequestErrors)
}

class EasyRequest {
	
	// MARK: - Attributes
	private var url: String!
	private var parameters: [[String:String]]?
	private var body: Data?
	private var headers : [[String: String]]?
	
	// MARK: - Select Method
	func selectMethod(_ method: EasyRequestMethods) {
		// Set request method
	}
	
	// MARK: - Add Parameters
	func addParameter(key: String!, value: String!) {
		// Function to add String Parameter to use in request
	}
	
	func addParameter(key: String!, value: Int!) {
		// Function to add Int Parameter to use in request
	}
	
	func addParameter(key: String!, value: Float!) {
		// Function to add Float Parameter to use in request
	}
	
	// MARK: - Add Headers
	func addHeader(key: String!, value: String!) {
		// Function to add Headers to use in request
	}
	
	// MARK: - Add Body
	func addBody(data: Data) {
		// Function to add Body information to use in request
	}
	
	// MARK: - Requests
	func executeRequest() {
		// Execute request withou parameters, use url setted in addUrl
	}
	
	func executeRequest(url: String!) {
		// Execute request with url
		// set self.url
	}
	
	func executeRequest(url: String!, parameters: [[String:String]]) {
		// Execute request with url and parameters
		// set self.url
		// set self.parameters
	}
	
	private func doRequest() {
		// Function to finally execute request to url informatted
	}
	
}




