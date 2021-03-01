//
//  MapView.swift
//  TextFieldExample
//
//  Created by 1v1 on 2021/01/09.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            mapView.delegate = context.coordinator
            return mapView
        }

        func updateUIView(_ view: MKMapView, context: Context) {

        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, MKMapViewDelegate {
            var parent: MapView

            init(_ parent: MapView) {
                self.parent = parent
            }
        }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
