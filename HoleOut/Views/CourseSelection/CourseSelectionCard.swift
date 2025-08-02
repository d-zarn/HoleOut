//
//  CourseSelectionCard.swift
//  HoleOut
//
//  Created by mini on 2025-08-01.
//

import SwiftUI

struct CourseSelectionCard: View {
    
    var course: Course
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(course.name)
                    .foregroundStyle(Color("text"))
                    .padding(.horizontal)
                    .padding(.top)
                    .font(.title)
                    .fontDesign(.serif)
                Text(course.address)
                    .foregroundStyle(Color("text-secondary"))
                    .padding(.bottom)
                    .padding(.horizontal)
                
            }
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.horizontal)
                .foregroundStyle(Color("text-secondary"))
        }
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color("background-secondary"))
        )
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    CourseSelectionCard(course: CourseRepository.stBoniface)
}
