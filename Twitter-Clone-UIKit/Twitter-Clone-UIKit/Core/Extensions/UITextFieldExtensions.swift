//
//  UITextFieldExtensions.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 25.05.2022.
//

import Foundation
import UIKit
import Combine

extension UITextField {

   func registerPublisher(completion : @escaping (String) -> Void,
                          cancellabel : inout Set<AnyCancellable>, debounceDuration : TimeInterval)  {
      var captureValue : String = ""
      NotificationCenter.default
         .publisher(for: UITextField.textDidChangeNotification, object: self)
         .map( {
            ($0.object as? UITextField)?.text ?? ""
         })
         .receive(on: RunLoop.main)
         .sink { value in
            captureValue = value
            DispatchQueue.main.asyncAfter(deadline: .now() + debounceDuration) {
               if captureValue == value {
                  completion(value)
               }
            }

         }
         .store(in: &cancellabel)
   }
}


