//
//  ResultState.swift
//  ApiNews_v1.0
//
//  Created by emm on 16/02/2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
