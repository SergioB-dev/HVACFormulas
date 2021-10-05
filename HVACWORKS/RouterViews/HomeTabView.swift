//
//  HomeTabView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var storageProvider = StorageProvider.shared
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .environmentObject(storageProvider)
            .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
            .tabItem {
                Image(systemName: "plus.forwardslash.minus")
                Text("HVAC Calculator") 
            }

            NavigationView {
                FormulaPersistenceScreen()
            }
            .environmentObject(storageProvider)
            .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                Text("Saved Formulas")
            }
            NavigationView {
                SettingScreen()
            }
            .environmentObject(storageProvider)
            .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            
            .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
            .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
            
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .environmentObject(StorageProvider())
    }
}
