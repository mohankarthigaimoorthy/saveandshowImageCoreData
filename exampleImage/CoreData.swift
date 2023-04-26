//
//  CoreData.swift
//  exampleImage
//
//  Created by Mohan K on 16/03/23.
//

import Foundation
import CoreData
import UIKit

class DataHelper {
    static let sharedInstance = DataHelper()
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
   
    func exampleImage(data: Data) {
        let imageInstance = Image(context: context)
        imageInstance.img = data
        do {
            try context.save()
            print("Image is saved")
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage() -> [Image] {
        var fetchingImage = [Image]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Image]
        }catch {
            print ("Error while fetching the image")
        }
        return fetchingImage
    }
}
