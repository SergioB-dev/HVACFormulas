//
//  HomeView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/25/21.
//

import SwiftUI

struct HomeView: View {
    
    let chapters = Chapter.allChapters
    let testData = ["1", "2", "3", "4", "5"]
    var body: some View {
                LazyVGrid(columns: chapterGrid) {
                    ForEach(Array(zip(chapters.indices, chapters)), id: \.0) { index, chapter in
                            ChapterView(chapter: chapter, index: index)
                    }
                }.padding()
                .padding(.bottom, 40)
            
        
    }
    let chapterGrid = [GridItem(.flexible(minimum: 100, maximum: .infinity)),
                       GridItem(.flexible(minimum: 100, maximum: .infinity))]
    
  
    
    struct ChapterView: View {
        @State private var selection: Int? = nil
        @State private var animate = false
        let chapter: Chapter
        let index: Int
        
    
        
        let goodColors = [Color(hue: 0.4, saturation: 0.8, brightness: 0.5, opacity: 1), Color(hue: 0.1, saturation: 0.89, brightness: 1, opacity: 1), Color(hue: 1, saturation: 0.8, brightness: 0.7, opacity: 1), Color(hue: 0.6, saturation: 0.89, brightness: 0.7, opacity: 1)
        ]
        var body: some View {
 
                VStack {
                    Text(chapter.name).bold()
                        .frame(maxWidth: .infinity)
                        .lineLimit(3)
                        .padding(.top, 40)
                        .padding()
                        .font(.custom("", size: 20))
                        .foregroundColor(.white)
                    
                    Divider()
                    Spacer()
                        HStack {
                            Text("Scroll to see more ")
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            Image(systemName: "arrow.right")
                        }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<chapter.content.count) { index in
                                Text(chapter.content[index]).foregroundColor(.white)
                                    .fontWeight(.black)
                                    .frame(width: UIScreen.main.bounds.width * 0.38)
                                    .padding()
                                    .background(Color.black.opacity(0.2))
                                    .cornerRadius(7)
                            }
                        }
                    }
                    if chapter.inCurrentVersion {
                        NavigationLink(
                            destination: AirFormulaMainView(),
                            tag: 0,
                            selection: $selection,
                            label: {EmptyView()})
                        NavigationLink(
                            destination: FanLawView(),
                            tag: 1,
                            selection: $selection,
                            label: {EmptyView()})
                        NavigationLink(
                            destination: MultiEntryElectricView(),
                            tag: 2,
                            selection: $selection,
                            label: {EmptyView()})
                        Button(action: {
                            self.selection = index
                        }) { Text("Go").foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                        }.padding()
                    }
                    Spacer()
                    if !chapter.inCurrentVersion {
                        Text("Coming soon!").foregroundColor(.white)
                    } else {
                        Text("Available").foregroundColor(.white)
                    }
                   Spacer()
                }.frame(width: UIScreen.main.bounds.width * 0.45,
                        height: UIScreen.main.bounds.height * 0.4)
                .background(goodColors[index])
                .cornerRadius(10)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.animate = true
                    }
                }
            
        }
    }
    
  
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
