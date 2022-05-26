//
//  UIApplicationExtensions.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 26.05.2022.
//

import Foundation
import UIKit

extension UIApplication{
   class func getPresentedViewController() -> UIViewController? {
      var presentViewController = UIApplication.shared.keyWindow?.rootViewController
      while let pVC = presentViewController?.presentedViewController
      {
     presentViewController = pVC
      }

      return presentViewController
   }
}
