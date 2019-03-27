import Foundation
import MapKit

class HydrantUpdate: NSObject, NSCoding {
    
    let coordinate: CLLocationCoordinate2D
    let imageKey: String
    let date: Date
    //comment is optional
    var comment: String?
    
    init(coordinate: CLLocationCoordinate2D, comment: String?) {
        self.coordinate = coordinate
        //32 Character unique string
        self.imageKey = UUID().uuidString
        //Generates current date
        self.date = Date()
        self.comment = comment
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(coordinate.latitude, forKey: "coordinate_latitude")
        aCoder.encode(coordinate.longitude, forKey: "coordinate_longitude")
        aCoder.encode(imageKey, forKey: "imageKey")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(comment, forKey: "comment")
    }
    
    required init?(coder aDecoder: NSCoder) {
        let latitude = aDecoder.decodeDouble(forKey: "coordinate_latitude")
        let longitude = aDecoder.decodeDouble(forKey: "coordinate_longitude")
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        imageKey = aDecoder.decodeObject(forKey: "imageKey") as! String
        date = aDecoder.decodeObject(forKey: "date") as! Date
        comment = aDecoder.decodeObject(forKey: "comment") as? String
    }
    
}
