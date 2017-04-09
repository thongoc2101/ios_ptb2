//
//  ViewController.swift
//  ptb2
//
//  Created by Phan Thi Ngoc Cam on 4/9/17.
//  Copyright © 2017 ngoccam. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var txtA: UITextField!
    
    @IBOutlet var txtB: UITextField!
    @IBOutlet var txtC: UITextField!
    
    @IBOutlet var buttonGiaiPT: UIButton!
    @IBOutlet var buttonReset: UIButton!
    
    @IBOutlet var txtKetQua: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // add a comment
        txtA.delegate = self
        txtB.delegate = self
        txtC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func GiaiPTBac2(a: Double, b: Double, c: Double) -> String {
            if abs(a) < 0.00001 {
                let X = (-c/b)
                return "X = \(X)"
            }
            let denta = (b*b - (4*a*c))
            if denta == 0 {
                let kq = (-b/(2*a))
                return "Phương trình có 1 nghiệm\(kq)"
            }
            if denta < 0 {
                return "Phương trình vô nghiệm"
            }
            let sq = sqrt(denta)
            let x1 = (-b + sq) / (2 * a)
            let x2 = (-b - sq) / (2 * a)
            return "X1 = \(x1)\nX2 = \(x2)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
    @IBAction func txtA(_ sender: Any) {
    }
    @IBAction func btnGiaiPT(_ sender: Any) {
        view.endEditing(true)
        let a : Float = Float(txtA.text!)!
        
        let b : Float = Float(txtB.text!)!
        let c : Float = Float(txtC.text!)!
        let buttonGiaiPT = GiaiPTBac2(a: Double(a), b: Double(b), c: Double(c))
        txtKetQua.text = buttonGiaiPT
    }
    @IBAction func btnReset(_ sender: Any) {
        txtA.text = ""
        txtB.text = ""
        txtC.text = ""
    }
}

