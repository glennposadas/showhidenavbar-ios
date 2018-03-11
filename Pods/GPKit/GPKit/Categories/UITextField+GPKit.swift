//
//  UITextField+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func selectedRange() -> NSRange? {
        let beginning = self.beginningOfDocument
        let selectedRange = self.selectedTextRange
        
        if let selectionStart = selectedRange?.start,
            let selectionEnd = selectedRange?.end {
            let location = self.offset(from: beginning, to: selectionStart)
            let length = self.offset(from: selectionStart, to: selectionEnd)
            
            return NSMakeRange(location, length)
        }
        
        return nil
    }
    
    /**
     
     - Validation for TextFields.
     - Call this extension function like this:
     - if (textField.hasContents()) then proceed
     
     */
    
    public func hasContents() -> Bool {
        
        let whitespaceSet = CharacterSet.whitespaces
        
        if self.text == "" || self.text == "" {
            return false
        }
        
        if self.text!.trimmingCharacters(in: whitespaceSet).isEmpty
            || self.text!.trimmingCharacters(in: whitespaceSet).isEmpty {
            return false
        }
        
        return true
    }
    
    /**
     The function to be called for the alert.
     */
    
    public func setupTextFieldWithDelegate(
        delegate: UITextFieldDelegate? = nil,
        textColor: UIColor,
        font: UIFont? = nil,
        placeholderText: String? = nil,
        imageIcon: UIImage?) {
        
        // The half of the height of the superview, which is the textField minus half of the height of imageView
        let y = (self.frame.size.height / 2) - 7.5
        
        let imageView = UIImageView(frame: CGRect(x: 15, y: y, width: 15, height: 15))
        
        if let imageIcon = imageIcon {
            imageView.image = imageIcon
            imageView.contentMode = .scaleAspectFill
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            self.backgroundColor = .clear
        } else {
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }
        
        self.leftViewMode = .always
        self.textColor = textColor
        self.tintColor = textColor
        
        for subview in self.subviews {
            subview.tintColor = textColor
        }
        
        if let delegate = delegate {
            self.delegate = delegate
        }
        
        self.addSubview(imageView)
        
        if let font = font {
            self.font = font
        }
        
        if let placeHolder = placeholderText {
            let localizedPlaceHolder = NSLocalizedString(placeHolder, comment: "")
            let attributedString = NSAttributedString(string: localizedPlaceHolder,
                                                      attributes: [NSAttributedStringKey.foregroundColor: textColor])
            self.attributedPlaceholder = attributedString
        }
    }
    
    /**
     The function to setup a textField for any input type
     */
    
    public func setupTextFieldForInputType(inputType: UIKeyboardType) {
        //self.font = R.font.gothamBook(size: 14.0)
        self.keyboardType = inputType
        
        switch inputType {
        case .default:
            // for default
            self.autocapitalizationType = .words
            self.spellCheckingType = .yes
            self.autocorrectionType = .yes
            
        default:
            // for emails
            self.autocapitalizationType = .none
            self.spellCheckingType = .no
            self.autocorrectionType = .no
        }
    }
}
