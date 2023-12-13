//
//  CalculatorViewModel.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI
import CoreData

final class CalculatorViewModel: ObservableObject {

    @Published var isResult: Bool = false
    
    @Published var calAmount = ""
    @Published var calTerm = ""
    @Published var calRate = ""
    @Published var calDate: Date = Date()
    @Published var history: [CalculateModel] = []


    var amount: Int { Int(calAmount) ?? 0 }
    var term: Int { Int(calTerm) ?? 1 }
    var rate: Int { Int(calRate) ?? 0 }

    func calculate(amount: Int, term: Int, rate: Int) -> Int {
        
        let percent = amount * rate * term / 100
        
        return percent
    }
    
    func calculate2(amount: Int, term: Int, rate: Int) -> Int {
        
        let mpayment = ((amount * rate * term / 100) + amount) / (term * 12)
        
        return mpayment
    }
    
    func addToHistory(completion: @escaping () -> (Void)) {
                
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "CalculateModel", into: context) as! CalculateModel
        
        flight.calAmount = calAmount
        flight.calTerm = calTerm
        flight.calRate = calRate
//        flight.price = Int16(Int(price) ?? 0)
        flight.calDate = calDate

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CalculateModel>(entityName: "CalculateModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.history = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.history = []
        }
    }
}
