//
//  ViewController.swift
//  sample
//
//  Created by thomas on 11/4/23.
//

import UIKit
import POK

class ViewController: UIViewController {
    
    let merchantIdField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Merchant ID"
        tf.backgroundColor = .gray2
        tf.textColor = .black
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    let orderIdField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Order ID"
        tf.backgroundColor = .gray2
        tf.textColor = .black
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Show", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        stack = UIStackView(arrangedSubviews: [merchantIdField, orderIdField, button])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: nil, paddingTop: 0, left: nil, paddingLeft: 0, bottom: nil, paddingBottom: 0, right: nil, paddingRight: 0, width: 280, height: 130)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func handleButtonTapped() {
        guard let merchantId = merchantIdField.text, merchantId != "",
              let orderId = orderIdField.text, orderId != "" else { return }
        
        POKAuth.instance.proceedPayment(merchantId: merchantId, orderId: orderId)

    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}

extension UIView {
    /**
     This function is used to anchor a view component related to other elements in the view hierarchy
     - Parameter top : the top anchor related to another element
     - Parameter paddingTop : the top space between the current element and the top anchor of the other element
     - Parameter left : the left anchor related to another element
     - Parameter paddingLeft : the space between the left side of the element of the current element and the left anchor of the other element
     - Parameter bottom : the bottom anchor of the current element
     - Parameter paddingBottom the space between the bottom of the current element and the bottom anchor of the other element
     - Parameter right : the right anchor related to the other element
     - Parameter paddingRight : the space between the right of the current element and the right anchor of the other element
     - Height width : the height of the current element
     - Parameter width : the height of the current element
     
     * Use the function like this: someElement.anchor(top: someOtherElement.bottomAnchor, paddingTop: 10, left: someOtherElement.leftAnchor,paddingLeft: 10, bottom: nil, paddingBottom: 0, right: someOtherElement.rightAnchor, paddingRight: 40, width: 40, height: 40)
     */
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, left: NSLayoutXAxisAnchor?,paddingLeft: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

