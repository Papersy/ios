//
//  ViewController.swift
//  calculator
//
//  Created by user224043 on 11/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorText: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var calcText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        calcText = ""
        calculatorText.text = ""
        calculatorResult.text = ""
    }

    @IBAction func clearAllBtn(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if(!calcText.isEmpty){
            calcText.removeLast()
            calculatorText.text = calcText
        }
    }
    
    func addToCalcText(value:String){
        calcText = calcText + value
        calculatorText.text = calcText
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        addToCalcText(value: "*")
    }
    @IBAction func divideBtn(_ sender: Any) {
        addToCalcText(value: "/")
    }
    @IBAction func minusBtn(_ sender: Any) {
        addToCalcText(value: "-")
    }
    @IBAction func plusBtn(_ sender: Any) {
        addToCalcText(value: "+")
    }
    @IBAction func procentBtn(_ sender: Any) {
        addToCalcText(value: "%")
    }
    @IBAction func dotBtn(_ sender: Any) {
        addToCalcText(value: ".")
    }
    @IBAction func getResultBtn(_ sender: Any) {
        if(validInput()){
            let checkedTextForText = calcText.replacingOccurrences(of: "%", with: "*0.01*")
            let expression = NSExpression(format: checkedTextForText)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math nased on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in calcText{
            if(specialCharacter(char: char)){
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndex{
            if(index == 0){
                return false
            }
            
            if(index == calcText.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "+"){
            return true;
        }
        if(char == "/"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func zeroBtn(_ sender: Any) {
        addToCalcText(value: "0")
    }
    @IBAction func oneBtn(_ sender: Any) {
        addToCalcText(value: "1")
    }
    @IBAction func twoBtn(_ sender: Any) {
        addToCalcText(value: "2")
    }
    @IBAction func threeBtn(_ sender: Any) {
        addToCalcText(value: "3")
    }
    @IBAction func fourBtn(_ sender: Any) {
        addToCalcText(value: "4")
    }
    @IBAction func fiveBtn(_ sender: Any) {
        addToCalcText(value: "5")
    }
    @IBAction func sixBtn(_ sender: Any) {
        addToCalcText(value: "6")
    }
    @IBAction func sevenBtn(_ sender: Any) {
        addToCalcText(value: "7")
    }
    @IBAction func eightBtn(_ sender: Any) {
        addToCalcText(value: "8")
    }
    @IBAction func nineBtn(_ sender: Any) {
        addToCalcText(value: "9")
    }
    
    
}

