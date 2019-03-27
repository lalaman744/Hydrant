import Foundation
import MapKit

class HydrantAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    let hydrant: HydrantUpdate
    
    //Computed property, created from other properties of this class
    var title: String? {
        return "\(dateFormatter.string(from: hydrant.date)).  \(hydrant.comment ?? "")"
    }
    
    init(hydrant: HydrantUpdate) {
        self.coordinate = hydrant.coordinate
        self.hydrant = hydrant
    }
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()

}
