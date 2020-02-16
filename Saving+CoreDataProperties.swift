//
//  Saving+CoreDataProperties.swift
//  SavingImgCoreData
//
//  Created by Frank Bara on 2/15/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//
//

import Foundation
import CoreData


extension Saving {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saving> {
        return NSFetchRequest<Saving>(entityName: "Saving")
    }

    @NSManaged public var username: String?
    @NSManaged public var imageD: Data?
    @NSManaged public var favo: Bool
    @NSManaged public var descriptions: String?

}
