import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    
    @IBOutlet var zeroPctButton: UIButton!
    
    @IBOutlet var tenPctButton: UIButton!
    
    @IBOutlet var twentyPctButton: UIButton!
    
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBOutlet var splitnNumberStepper: UIStepper!
    
    @IBOutlet var calculateButton: UIButton!
    
    
    var isSelcted:String=""
    
    var result:Double=0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius=15
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected=true
        isSelcted=sender.titleLabel?.text ?? "0"
        
        if isSelcted=="0%"{
            sender.isSelected=true
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=false
            isSelcted="0.0"
            
        }else if isSelcted=="10%"{
            sender.isSelected=true
            zeroPctButton.isSelected=false
            twentyPctButton.isSelected=false
            isSelcted="0.1"
        }else{
            sender.isSelected=true
            tenPctButton.isSelected=false
            zeroPctButton.isSelected=false
            isSelcted="0.2"
        }
        
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text=String(Int(splitnNumberStepper.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        result = (Double(billTextField.text ?? "0") ?? 0.0) * (1.0+(Double(isSelcted) ?? 0)) / splitnNumberStepper.value
        
        performSegue(withIdentifier: "toResult" , sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result=round(result*100)/100
            destinationVC.splitNumber=Int(splitnNumberStepper.value)
            destinationVC.tipValue=isSelcted
            
        }
    }
}

