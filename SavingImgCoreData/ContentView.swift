//
//  ContentView.swift
//  SavingImgCoreData
//
//  Created by Frank Bara on 2/15/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Saving.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Saving.username, ascending: true),
        NSSortDescriptor(keyPath: \Saving.imageD, ascending: true),
        NSSortDescriptor(keyPath: \Saving.favo, ascending: true),
        NSSortDescriptor(keyPath: \Saving.descriptions, ascending: true),
        ]
    ) var savings: FetchedResults<Saving>
    
    @State private var image: Data = .init(count: 0)
    @State private var show = false

    
    var body: some View {
        NavigationView {
            List(savings, id: \.self) { save in
                VStack {
                    Image(uiImage: UIImage(data: save.imageD ?? self.image)!)
                    
                    HStack {
                        Text("\(save.descriptions ?? "")")
                        Spacer()
                        
                        Button(action: {
                            save.favo.toggle()
                            try? self.moc.save()
                        }) {
                            Image(systemName: save.favo ? "bookmark.fill": "bookmark")
                        }
                    }
                    
                    Text("\(save.username ?? "")")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    
                }
            }
            .navigationBarTitle("News", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.show.toggle()
            }) {
                Image(systemName: "camera.fill")
            })
        }
        .sheet(isPresented: self.$show) {
            SenderView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
