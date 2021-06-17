//
//  ConfigurationType.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation

public enum ConfigurationType {
    case basic(identifier: String)
    case inMemory(identifier: String?)

    func identifier() -> String? {
        switch self {
        case .basic(let identifier): return identifier
        case .inMemory(let identifier): return identifier
        }
    }
}
