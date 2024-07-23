//
//  ExpensiveViewModel.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI
import CoreData

final class ExpensiveViewModel: ObservableObject {
    
    @AppStorage("totBud") var totBud: Int = 0
    
    @Published var pphotos: [String] = ["p1"]
    @Published var curPphoto = ""

    @Published var currentProject = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddEx: Bool = false
    @Published var isAddItem: Bool = false
    
    @Published var exProj = ""
    @Published var exItem = ""
    @Published var exName = ""
    @Published var exSum = ""
    
    @Published var expensives: [ExModel] = []
    @Published var selectedExpensive: ExModel?

    func addExpensive() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExModel", into: context) as! ExModel

        loan.exProj = exProj
        loan.exItem = exItem
        loan.exName = exName
        loan.exSum = exSum

        CoreDataStack.shared.saveContext()
    }

    func fetchExpensives() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExModel>(entityName: "ExModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.expensives = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.expensives = []
        }
    }
}
