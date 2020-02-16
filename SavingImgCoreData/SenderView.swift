//
//  SenderView.swift
//  SavingImgCoreData
//
//  Created by Frank Bara on 2/15/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

struct SenderView: View {
    @Environment(\.managedObjectContext) var moc

    @State private var image: Data = .init(count: 0)
    @State private var show = false
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            if self.image.count != 0 {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(uiImage: UIImage(data: self.image)!)
                }
            } else {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "photo.fill")
                        .font(.system(size: 55))
                        .foregroundColor(.gray)
                }
            }
            
            TextField("description...", text: self.$description)
                .padding()
                .background(Color(red: 233/255, green: 234/255, blue: 243/255))
                .cornerRadius(20)
            
            TextField("name...", text: self.$name)
                .padding()
                .background(Color(red: 233/255, green: 234/255, blue: 243/255))
                .cornerRadius(20)
            
            Button(action: {
                let send = Saving(context: self.moc)
                send.username = self.name
                send.descriptions = self.description
                send.imageD = self.image
            }) {
                Text("Send")
                .fixedSize()
                    .frame(width: 250, height: 30)
                    .foregroundColor((self.name.count > 0 && self.description.count > 0 && self.image.count > 0) ? Color.white : Color.black)
                .background((self.name.count > 0 && self.description.count > 0 && self.image.count > 0) ? Color.blue : Color.gray)
                .cornerRadius(13)
            }
        }
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}
