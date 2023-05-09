//
//  CreditCardApp.swift
//  CreditCard
//
//  Created by Kenya Alvarez on 08/05/23.
//

import SwiftUI

@main
struct CreditCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
