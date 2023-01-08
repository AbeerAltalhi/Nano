//
//  nanoApp.swift
//  nano
//
//  Created by Abeer on 12/06/1444 AH.
//

import SwiftUI

@main
struct nanoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
