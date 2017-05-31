//
//  EasyRequestError.swift
//  EasyRequest
//
//  Created by Guilherme Baldissera on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation

struct EasyRequestErrors : Error {
	
	enum EasyRequestErrors : String {
		case notfound = "Error 404 Not Found"
		case error = "Error 400 Error"
		case internalerror = "Error 500 Internal Error"
	}
	
	var error: EasyRequestErrors
}
