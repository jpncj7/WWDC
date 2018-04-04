//
//  ResourceRepresentation.swift
//  ConfCore
//
//  Created by Ben Newcombe on 21/01/2018.
//  Copyright © 2018 Guilherme Rambo. All rights reserved.
//

import Foundation
import RealmSwift

public enum ResourceType: String {
    case none
    case guide = "WWDCSessionResourceTypeGuide"
    case documentation = "WWDCSessionResourceTypeDocumentation"
    case sampleCode = "WWDCSessionResourceTypeSampleCode"
    case session = "WWDCSessionResourceRelatedSession"
}

public class ResourceRepresentation: Object {
    @objc public dynamic var identifier = ""
    @objc public dynamic var title = ""
    @objc public dynamic var url = ""
    @objc public dynamic var descriptor = ""
    @objc public dynamic var type = ""

    public override class func primaryKey() -> String? {
        return "identifier"
    }
}
