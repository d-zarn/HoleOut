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
            Spacer()
            VStack(alignment: .leading) {
                Text(course.name)
                    .foregroundStyle(Color("text"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal)
                    .padding(.top)
                    .font(.title)
                    .fontWeight(.bold)
                Text(course.address)
                    .foregroundStyle(Color("text-secondary"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .padding(.bottom)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.horizontal)
                .foregroundStyle(Color("text-secondary"))
        }
        .glassEffect()
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    CourseSelectionCard(course: CourseRepository.stBoniface)
}
