//
//  ProjectViewModel.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI
import CoreData

final class ProjectViewModel: ObservableObject {
    
    @AppStorage("totBud") var totBud: Int = 0
    
    @Published var pphotos: [String] = ["p1"]
    @Published var curPphoto = ""

    @Published var currentProject = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddEx: Bool = false
    @Published var isAddItem: Bool = false

    @Published var prPhoto = ""
    @Published var prName = ""
    @Published var prBudget = ""
    @Published var prDescr = ""
    
    @Published var projects: [ProjModel] = []
    @Published var selectedProject: ProjModel?

    func addProject() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjModel", into: context) as! ProjModel

        loan.prPhoto = prPhoto
        loan.prName = prName
        loan.prBudget = prBudget
        loan.prDescr = prDescr

        CoreDataStack.shared.saveContext()
    }

    func fetchProjects() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjModel>(entityName: "ProjModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.projects = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.projects = []
        }
    }
}

