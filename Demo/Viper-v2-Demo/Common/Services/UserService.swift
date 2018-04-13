//
//  UserService.swift
//  Pokedex
//
//  Created by Filip Beć on 28/04/2017.
//  Copyright © 2017 Filip Beć. All rights reserved.
//

import UIKit
import Alamofire
import Japx

typealias LoginCompletionBlock = (DataResponse<JSONAPIObject<User>>) -> (Void)

class UserService: NSObject {

    @discardableResult
    func loginUser(with email: String, password: String, completion: @escaping LoginCompletionBlock) -> DataRequest {

        let parameters: Parameters = [
            "data": [
                "type": "session",
                "attributes": [
                    "email": email,
                    "password": password
                ]
            ]
        ]

        return Alamofire.request(
            "https://pokeapi.infinum.co/api/v1/users/login",
            method: .post,
            parameters: parameters
        ).pokedexValidate().responseCodableJSONAPI(completionHandler: completion)
    }

}
