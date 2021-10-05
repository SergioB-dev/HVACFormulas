//
//  HomeTabView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var storageProvider: StorageProvider
    var body: some View {
        TabView {
            HomeView()
                .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
                .tabItem {
                    Image(systemName: "plus.forwardslash.minus")
                    Text("HVAC Calculator")
                }
            FormulaPersistenceScreen()
                
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Saved Formulas")
                }
            SettingScreen()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }.environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .environmentObject(StorageProvider())
    }
}
