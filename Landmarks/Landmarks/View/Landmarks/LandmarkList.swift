//
//  LandmarkList.swift
//  Landmarks
//
//  Created by maurice.tin on 22/06/22.
//

import SwiftUI

struct LandmarkList: View{
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View{
        NavigationView{
            List{
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            .navigationTitle("Landmarks")
            }
    }
}
}

struct LandmarkList_Previews: PreviewProvider{
    static var previews: some View{
//        ForEach(["iPhone SE (2nd generation)","iPhone XS Max","iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
