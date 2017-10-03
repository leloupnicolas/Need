//
// Created by Nicolas LELOUP on 03/10/2017.
//

import Foundation
import UIKit

open class ServicesInjectionAwareViewController: UIViewController {
  open func getService<T>() -> T {
    let appDelegate: ServicesRegistry = UIApplication.shared.delegate as! ServicesRegistry

    return appDelegate.serviceLocator.getService()!
  }
}
