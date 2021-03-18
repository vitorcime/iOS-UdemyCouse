//
//  DetailView.swift
//  H4XOR News
//
//  Created by Vitor on 17/03/21.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com.br")
            .previewLayout(.sizeThatFits)
    }
}


