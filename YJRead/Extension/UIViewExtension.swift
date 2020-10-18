//
//  UIViewExtension.swift
//  YJRead
//
//  Created by mx_in on 2020/10/19.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

extension UIView{
    var globalPoint :CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }

    var globalFrame :CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
}
