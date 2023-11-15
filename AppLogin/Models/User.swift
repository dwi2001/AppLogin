//
//  User.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
