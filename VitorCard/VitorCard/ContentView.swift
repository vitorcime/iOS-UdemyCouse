//
//  ContentView.swift
//  VitorCard
//
//  Created by Vitor on 17/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.62, green: 0.85, blue: 0.87)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("vitor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color(red: 0.94, green: 0.89, blue: 0.84), lineWidth: 5)
                    )
                Text("Vitor Cimetan")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(Color(red: 1.00, green: 0.44, blue: 0.44))
                Text("iOS Developer")
                    .foregroundColor(Color(red: 1.00, green: 0.44, blue: 0.44))
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "(11) 1 1111-1111", imageName: "phone.fill")
                InfoView(text: "vitorcimetan@gmail.com", imageName: "envelope.fill")
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


