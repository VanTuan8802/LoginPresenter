//
//  Constants.swift
//  AddLibrary
//
//  Created by Nguyễn Tuấn on 07/06/2023.
//

import Foundation
import Alamofire

struct NetWorkConstant{
    static var domin = ""
}

struct APIError{
    var errorCode: String?
    var errorMsg: String?
    var errorKey: String?
    
    static func from(afError:AFError) ->APIError{
        return APIError(errorMsg: afError.errorDescription)
    }
}
