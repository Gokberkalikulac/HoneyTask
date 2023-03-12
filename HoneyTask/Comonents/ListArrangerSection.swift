//
//  ListArrangerSection.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI

struct ListArrangerSection: View {
    @EnvironmentObject private var taskViewModel : TaskViewModel
    @Namespace var animation
    let arrangersType = ["Today","Later","Completed"]
    var body: some View {
        HStack(spacing:10){
            ForEach(arrangersType,id: \.self) { arranger in
                Text(arranger)
                    .font(.title3)
                    .fontWeight(.medium)
                    .scaleEffect(0.85)
                    .foregroundColor(taskViewModel.currentSection == arranger ? Color.theme.background : Color.theme.red)
                    .padding(.vertical,5)
                    .frame(maxWidth: .infinity)
                    .background {
                        if taskViewModel.currentSection == arranger{
                            Capsule()
                                .fill(Color.theme.accent)
                                .matchedGeometryEffect(id: "ARRANGER", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation {taskViewModel.currentSection = arranger}
                        
                    }
            }
        }
    }
}

struct ListArrangerSection_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ListArrangerSection()
                .environmentObject(TaskViewModel())
                .previewLayout(.sizeThatFits)
            
            ListArrangerSection()
                .environmentObject(TaskViewModel())
                .previewLayout(.sizeThatFits)
        }
    }
}
