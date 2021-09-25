//
//  ContentHeaderView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack {
            VStack {
                ZStack{
                      Text("Al Quran Free")
                          .font(Font.custom("Avinir-Black",size:17))
                          .foregroundColor(Color("textColor"))
                  }
                Divider()
                    .background(Color("textColor"))
            }
        }
        .background(Color("backgroundColor"))
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
         .environment(\.sizeCategory,.accessibilityExtraExtraLarge)
    }
}
