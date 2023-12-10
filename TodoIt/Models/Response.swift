//
//  Response.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let data: T?
    let success: Bool
    let message: String
}
