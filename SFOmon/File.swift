//
//  File.swift
//  SFOHACK
//
//  Created by Cody Schrank on 6/13/15.
//  Copyright (c) 2015 TheTapAttack. All rights reserved.
//

import UIKit
import MapKit

class ParkMapOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(loc: CLLocationCoordinate2D, rect: MKMapRect) {
        boundingMapRect = rect
        coordinate = loc
    }
}
