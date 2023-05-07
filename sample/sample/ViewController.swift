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



