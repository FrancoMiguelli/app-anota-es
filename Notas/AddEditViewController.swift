
import UIKit
import CoreData

class AddEditViewController: UIViewController {
    
    
    @IBOutlet weak var tvSave: UITextView!
    
    var anotacao: NSManagedObject!
    
    @IBAction func btnSave(_ sender: Any) {
        
        let text = tvSave.text
        let api = API()
        if anotacao != nil {
            api.editNote(anotacao: anotacao, nota: text!)
        }else {
            api.saveNote(nota: text!)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tvSave.becomeFirstResponder()
        
        if anotacao != nil {
            let textRequest = anotacao.value(forKey: "text")
            self.tvSave.text = String(describing: textRequest!)
        }else {
            self.tvSave.text = ""
        }
    }
    

   

}
