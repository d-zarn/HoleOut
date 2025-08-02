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
                            Text("Put some cards here dawg")
                        }
                    }
                }
            }
            .navigationTitle("Select Course")
            .searchable(text: $vm.searchText, prompt: "Search courses")
        }
        
    }
}

#Preview {
    let vm = CourseSelectionViewModel()
    CourseSelectionView(selectedTab: .constant(0))
}
