//
//  HomeViewModel.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("debt") var debt = 0
    @AppStorage("debt2") var debt2 = 0
 
    @Published var currencies: [String] = ["EUR/USD", "USD/CHY", "EUR/CHY", "EUR/RUB", "USD/RUB", "EURJPY"]
    @AppStorage("selectedCurrency") var selectedCurrency = ""
    @Published var isGraph: Bool = false
    @Published var isNewCredit: Bool = false
    @Published var isNewDept: Bool = false

    @Published var credName: String = ""
    @Published var credAmount: String = ""
    @Published var credTerm: String = ""
    @Published var currentPeople: String = ""
    
    @Published var whoPays: [String] = ["I'm paying", "Another person"]
    @Published var selectedWhoPays = "I'm paying"
    @Published var amountPayment = ""
    @Published var amountPaymentDate: Date = Date()
    @AppStorage("payments") var payments: [String] = []
    
    @Published var credits: [CreditModel] = []
    @Published var selectedCredit: CreditModel?
    @Published var isDetail: Bool = false
    @Published var isPaymentsDetail: Bool = false

    @AppStorage("familyNames") var familyNames: [String] = []

    func addCredit(selectedUser: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "CreditModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "CreditModel", into: context) as! CreditModel
        
        sub.credName = credName
//        sub.subPrice = Int16(Int(subPrice) ?? 0)
        sub.credAmount = credAmount
        sub.credTerm = credTerm
        sub.selectedUser = selectedUser
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchCredits() {
        
        CoreDataStack.shared.modelName = "CreditModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CreditModel>(entityName: "CreditModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.credits = branch
//            self.subscriptions = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.credits = []
        }
    }
}
