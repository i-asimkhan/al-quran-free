//
//  ChapterDetailsView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ChapterDetailsView: View {
    @ObservedObject var viewModel: ChapterdetailsModelView
    
    
    var body: some View {
        
        GeometryReader {
            geometry in
            
            ScrollView {
                VStack {
                    Text("\(viewModel.verses.getAllVerses())")
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .foregroundColor(Color("textColor"))
                        .font(.largeTitle)
                        .lineSpacing(20)
                        .minimumScaleFactor(0.01)
                    
                       
                }
            }
        }
        
       
        .onAppear() {
            viewModel.fetchBooks()
        }
        .navigationBarHidden(false)
        //.blueNavigation
        //.navigationBarTitleDisplayMode(.inline)
        //.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ChapterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailsView(viewModel: ChapterdetailsModelView(chapterNumber: 1))
    }
}


struct NavigationBarModifier: ViewModifier {
  var backgroundColor: UIColor
  var textColor: UIColor

  init(backgroundColor: UIColor, textColor: UIColor) {
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = textColor
  }

  func body(content: Content) -> some View {
    ZStack{
       content
        VStack {
          GeometryReader { geometry in
             Color(self.backgroundColor)
                .frame(height: 60)
                .edgesIgnoringSafeArea(.top)
              Spacer()
          }
        }
     }
  }
}

extension View {
  func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
    self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
  }
}

extension View {
  var blueNavigation: some View {
    self.navigationBarColor(UIColor.blue, textColor: UIColor.white)
  }
}

class HostingController<Content> : UIHostingController<Content> where Content : View {
  @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
  }
}
