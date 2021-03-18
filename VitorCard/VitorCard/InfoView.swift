//
//  InfoView.swift
//  VitorCard
//
//  Created by Vitor on 17/03/21.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50, alignment: .center)
            .foregroundColor(Color(red: 0.96, green: 0.75, blue: 0.75))
            .overlay(
                HStack {
                    Image(systemName: imageName)
                    Text(text).foregroundColor(.black)
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
