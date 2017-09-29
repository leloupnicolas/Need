//
//  ServicesRegistry.swift
//
//  Created by Nicolas LELOUP on 28/06/2017.
//  Copyright © 2017 Nicolas LELOUP. All rights reserved.
//

import Foundation

// MARK: Class
/// Registry which can contain all services available through the app
public protocol ServicesRegistry {
  var serviceLocator: ServiceLocator { get }

  func processRegistration()
}
