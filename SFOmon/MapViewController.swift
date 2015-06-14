import UIKit
import CoreLocation
import CoreMotion
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapview: MKMapView!
    var manager = CLLocationManager()
    var locations = [Dictionary<String,AnyObject>]()
    let server = Requests(server: "http://172.31.59.112:3000")
    
    override func viewDidLoad() {
        var nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 26)!,  NSForegroundColorAttributeName: UIColor.blackColor()]
        nav?.tintColor = UIColor.blackColor()
        self.navigationController?.barHideOnTapGestureRecognizer
        let connection = server.isConnectedToNetwork()
        if !connection {
            println("Not Connected To Server")
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        mapview.delegate = self
        mapview.mapType = MKMapType.Standard
        mapview.showsUserLocation = true
        let locValue:CLLocationCoordinate2D = manager.location.coordinate
        
        let overlaypos = CLLocationCoordinate2DMake(37.621001, -122.384615)
        let overlayposxy = MKMapPointForCoordinate(overlaypos)
        let mapRect = MKMapRectMake(overlayposxy.x, overlayposxy.y, 2000, 2715)
        let overlay = ParkMapOverlay(loc: overlaypos, rect: mapRect)
        mapview.addOverlay(overlay)
        
        let latitude:CLLocationDegrees = 37.617355
        let longitude: CLLocationDegrees = -122.382055
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        println(latitude, longitude)
        let viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.0000000001, 0.0000000001);
        
        self.mapview.setRegion(viewRegion, animated: true)
        
        mapview.camera.heading = 70
        mapview.showsBuildings = false
        mapview.showsPointsOfInterest = false
        
        server.getRequestWithReturnedArray(relativeUrl: "/coordinates"){
            returnedData in
            for object in returnedData {
                self.locations.append([
                    "latitude": object["latitude"] as! Double,
                    "longitude": object["longitude"] as! Double,
                    "name": object["name"] as! String
                    ])
            }
        }
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        //        let locValue:CLLocationCoordinate2D = manager.location.coordinate
        //
        //        let latitude:CLLocationDegrees = locValue.latitude
        //        let longitude: CLLocationDegrees = locValue.longitude
        //        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        //        let viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.0000000001, 0.0000000001);
        //        let adjustedRegion = mapview.regionThatFits(viewRegion)
        
        //Random chance to fight pokemon
        let random = arc4random_uniform(10)
        println(random)
        if random == 9 {
            performSegueWithIdentifier("gameStartSegue", sender: nil)
            manager.stopUpdatingLocation()
        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is ParkMapOverlay {
            let magicMountainImage = UIImage(named: "SFOPokemon")
            let overlayView = ParkMapOverlayView(overlay: overlay, overlayImage: magicMountainImage!)
            return overlayView
        } else {
            let circleView = MKCircleRenderer(overlay: overlay)
            circleView.strokeColor = .redColor()
            circleView.fillColor = .blackColor()
            return circleView
        }
    }
    
    //    func distanceFormula(coordinates: CLLocationCoordinate2D, locations: [Dictionary<String,AnyObject>]) {
    //        let distance: Double!
    //        for locationA in locations {
    //
    //        }
    //    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

