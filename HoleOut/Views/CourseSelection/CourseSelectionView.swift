//
//  CourseSelectionView.swift
//  HoleOut
//
//  Created by mini on 2025-08-01.
//

import SwiftUI

struct CourseSelectionView: View {
    
    @Binding var selectedTab: Int
    @StateObject private var vm = CourseSelectionViewModel()
    
    var body: some View {
        NavigationStack{
            Group {
                if vm.searchResults.isEmpty {
                    VStack {
                        Spacer()
                        ContentUnavailableView("No courses matching \(vm.searchText)",
                                               image: "flag.slash",
                                               description: Text("Try searching for a different course")
                        )
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStack {
                            ForEach(vm.searchResults, id: \.name) { course in
                                CourseSelectionCard(course: course)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Select Course")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search courses")
            .background(Color("background").ignoresSafeArea())
        }
        
        
    }
}

#Preview {
    let vm = CourseSelectionViewModel()
    CourseSelectionView(selectedTab: .constant(0))
}

