//
//  CardViewModel.swift
//  CreditCard
//
//  Created by Kenya Alvarez on 08/05/23.
//

import Foundation
import CoreData

class CardViewModel : ObservableObject{
    @Published var name = ""
    @Published var credit = ""
    @Published var type = ""
    
    let limit: Int = 16
    @Published var number : String = ""{
        didSet{
            if number.count > limit{
                number = String(number.prefix(limit))
            }
        }
    }
    
    func saveCard(context : NSManagedObjectContext, completion: @escaping (_ done: Bool) -> Void){
        
        if name.isEmpty || number.isEmpty || credit.isEmpty || credit.isEmpty{
            completion(false)
        }else {
            let newCard = Cards(context:context)
            newCard.number = number
            newCard.name = name
            newCard.type = type
            newCard.id = UUID()
            newCard.credit = Int16(credit) ?? 0
            
            do{
                try context.save()
                print("guardo")
                completion(true)
            }catch let error as NSError{
                print("No guardo", error.localizedDescription)
                completion(false)
            }
        }
    }
}
