//
//  ContentView.swift
//  Shared
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 20 , content: {
            ContentHeaderView()
            ChapetersListView(viewModel: QuranChaptersListModelView())
            Spacer()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}
