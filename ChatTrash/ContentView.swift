//
//  ContentView.swift
//  ChatTrash
//
//  Created by 三谷大典 on 2020/06/23.
//  Copyright © 2020 三谷大典. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                
                VStack {
                    Image(systemName: "person.circle.fill")
                    .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 12)
                    
                    TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    if name != "" {
                        NavigationLink(destination: MessageView(name: name)) {
                            HStack {
                                Text("Join")
                                Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .frame(width: 100, height: 54)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(27)
                        .padding(.bottom, 15)
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
