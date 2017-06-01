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
        case sessionError
		case notfound
		case error
		case internalerror
	}
	
	var kind: EasyRequestErrors
    var error: Error
}
