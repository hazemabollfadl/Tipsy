import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var settingsLabel: UILabel!
    
    @IBOutlet var recalculateButton: UIButton!
    
    var result:Double=0.0
    var tipValue:String=""
    var splitNumber:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recalculateButton.layer.cornerRadius=15

        totalLabel.text=String(result)

        settingsLabel.text="Split between \(splitNumber) with \(tipValue)% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


}
