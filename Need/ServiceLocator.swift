//
//  ServiceLocator.swift
//
//  Created by Nicolas LELOUP on 28/06/2017.
//  Copyright © 2017 Nicolas LELOUP. All rights reserved.
//

import Foundation

// MARK: Constants
private let SLLeveledTitle = "Need | %@"
private let SLProtocolNotRegistered = "=> Service for protocol %@ is not registered."
private let SLOverridingInstanceOfProtocol = "=> %@ protocol overriden has been overriden."

// MARK: Protocols
public protocol ServiceLocator {
  func getService<T>() -> T?
}

// MARK: Class
/// Service locator which can lazy load services
open class LazyServiceLocator: NSObject, ServiceLocator {
  // MARK: Enums
  
  /**
   Registry records types
   
   - Instance: Already instantiated services.
   - Recipe: Services to lazy load.
   */
  enum RegistryRecord {
    
    case Instance(Any)
    case Recipe(() -> Any)
    
    func unwrap() -> Any {
      switch self {
      case .Instance(let instance):
        return instance
      case .Recipe(let recipe):
        return recipe()
      }
    }
  }
  
  //MARK: Class variables
  
  /// Service registry
  fileprivate lazy var registry: Dictionary<String, RegistryRecord> = [:]
  
  // MARK: Private own methods
  
  /**
   Gives the type name of any instance.
   
   - Parameter some: The instance to get the type name.
   - Returns: The type name.
   */
  fileprivate func typeName(_ some: Any) -> String {
    return (some is Any.Type) ? "\(some)" : "\(type(of: (some) as AnyObject))"
  }
  
  // MARK: Public own methods
  
  /**
   Adds a Recipe kind of service to the registry.
   
   - Parameter recipe: Recipe to execute for lazy loading.
   */
  open func addService<T>(_ recipe: @escaping () -> T) {
    let key = typeName(T.self)
    
    guard nil == registry[key] else {
      print(String(format: SLLeveledTitle, "WARNING"))
      print(String(format: SLOverridingInstanceOfProtocol, key))
      
      return
    }
    
    registry[key] = .Recipe(recipe)
  }
  
  /**
   Adds an Instance kind of service to the registry.
   
   - Parameter instance: Instance to store.
   */
  open func addService<T>(_ instance: T) {
    let key = typeName(T.self)
    
    guard nil == registry[key] else {
      print(String(format: SLLeveledTitle, "WARNING"))
      print(String(format: SLOverridingInstanceOfProtocol, key))
      
      return
    }
    
    registry[key] = .Instance(instance)
  }
  
  /**
   Gets a stored service.
   
   - Returns: The instance if it has been found.
   */
  open func getService<T>() -> T? {
    let key = typeName(T.self)
    var instance: T? = nil
    if let registryRecord = registry[key] {
      instance = registryRecord.unwrap() as? T
      
      switch registryRecord {
      case .Recipe:
        if let _ = instance {
          addService(instance)
        }
      default:
        break
      }
    }
    
    if nil == instance {
      print(String(format: SLLeveledTitle, "ERROR"))
      print(String(format: SLProtocolNotRegistered, key))
    }
    
    return instance
  }
}
