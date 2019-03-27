import Foundation
import UIKit

class ImageStore {
    
    func setImage(_ image: UIImage, forKey key: String) {
        let url = imageURL (forKey: key)
        if let data = image.jpegData(compressionQuality: 0.5) {
            let _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    func image(forKey key: String) -> UIImage? {
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        return imageFromDisk
    }
    
    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(key)
    }
}
