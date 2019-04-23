//
//  CustomButton.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-22.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

}
