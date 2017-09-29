//
//  ServicesInjectionsAware.swift
//
//  Created by Nicolas LELOUP on 28/06/2017.
//  Copyright © 2017 Nicolas LELOUP - Buzznative. All rights reserved.
//

import Foundation
import UIKit

open class ServicesInjectionAware {
  open func getService<T>() -> T {
    let appDelegate: ServicesRegistry = UIApplication.shared.delegate as! ServicesRegistry
    
    return appDelegate.serviceLocator.getService()!
  }
}
