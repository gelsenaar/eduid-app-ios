//
//  EduIDValidatedTextStackView.swift
//  eduID
//
//  Created by Jairo Bambang Oetomo on 19/01/2023.
//

import UIKit
import TinyConstraints

class EduIDValidatedTextStackView: UIStackView, UITextFieldDelegate {
    
    let validLabel = UILabel()
    let extraBorderView = UIView()
    let textField = UITextField()
    weak var delegate: ValidatedTextFieldDelegate?
    
    init(regex: String? = nil, title: String, placeholder: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        
        axis = .vertical
        spacing = 6
        
        //MARK: - title
        let label = UILabel()
        label.font = .sourceSansProSemiBold(size: 16)
        label.textColor = .charcoal
        label.text = title
        addArrangedSubview(label)
        
        //MARK: - textfield
        
        textField.font = .sourceSansProRegular(size: 16)
        textField.placeholder = placeholder
        textField.delegate = self
        textField.height(20)
        textField.keyboardType = keyboardType
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no

        //MARK: - textfield border
        extraBorderView.layer.borderWidth = 2
        extraBorderView.layer.borderColor = UIColor.clear.cgColor
        extraBorderView.layer.cornerRadius = 8
        let textFieldParent = UIView()
        extraBorderView.addSubview(textFieldParent)
        addArrangedSubview(extraBorderView)
        extraBorderView.width(to: self)
        extraBorderView.height(52)
        textFieldParent.height(48)
        textFieldParent.center(in: extraBorderView)
        textFieldParent.leading(to: extraBorderView, offset: 2)
        textFieldParent.trailing(to: extraBorderView, offset: -2)
        textFieldParent.layer.cornerRadius = 6
        textFieldParent.layer.borderWidth = 1
        textFieldParent.layer.borderColor = UIColor.tertiary.cgColor
        textFieldParent.addSubview(textField)
        textField.center(in: textFieldParent)
        textField.width(to: self, offset: -24)
        
        //MARK: - validationMessage
        validLabel.font = .sourceSansProSemiBold(size: 12)
        validLabel.textColor = .red
        validLabel.text = "The input doesn't follow regex"
        validLabel.alpha = 0
        addArrangedSubview(validLabel)
        
        height(104)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        extraBorderView.layer.borderColor = UIColor.textfieldFocusColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        extraBorderView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count ?? 0 < 3 || textField.text?.count ?? 0 > 20 {
            validLabel.alpha = 1
            delegate?.updateValidation(with: false, from: tag)
        } else {
            validLabel.alpha = 0
            delegate?.updateValidation(with: true, from: tag)
        }
        return true
    }
    
    //MARK: -resign keyboard responder
    override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
    }
}

protocol ValidatedTextFieldDelegate: AnyObject {
    
    func updateValidation(with value: Bool, from tag: Int)
}
