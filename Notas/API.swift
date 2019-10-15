
import CoreData
import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

class API {
    
    
    func saveNote(nota: String) {
        
        let edit = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: context)
        edit.setValue(nota, forKey: "text")
        edit.setValue(Date(), forKey: "date")
        
        do {
            try context.save()
            print("Nota salva com sucesso")
        } catch let erro {
            print("Erro ao salvar nota" + erro.localizedDescription)
        }
        
    }
    
    func editNote(anotacao: NSManagedObject, nota:String) {
           
           
           anotacao.setValue(nota, forKey: "text")
           anotacao.setValue(Date(), forKey: "date")
           
           do {
               try context.save()
               print("Nota editada com sucesso")
           } catch let erro {
               print("Erro ao editar nota" + erro.localizedDescription)
           }
           
       }
    
    
    func listNotes() -> [NSManagedObject] {
        
        var notes: [NSManagedObject] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notas")
        let order = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [order]
        
        do {
            let requestRecovered = try context.fetch(request)
            notes = requestRecovered as! [NSManagedObject]
            
        } catch let erro {
            print("Erro ao recuperar notas \(erro.localizedDescription)")
        }
        
        return notes
        
    }
    
    func deleteNote(index: Int) {
        var array = self.listNotes()
        let indice = index
        let anotacao = self.listNotes()[indice]
        
        context.delete(anotacao)
        array.remove(at: indice)
        
        do {
            try context.save()
        } catch let erro {
            print("erro ao deletar item\(erro)")
        }
        
        
    }
}
