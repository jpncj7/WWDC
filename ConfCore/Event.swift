//
//  Event.swift
//  WWDC
//
//  Created by Guilherme Rambo on 06/02/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

import Cocoa
import RealmSwift

/// Represents a past, present or future WWDC edition (ex: WWDC-2016)
public class Event: Object {

    /// Unique identifier (ex: wwdc2017)
    @objc public dynamic var identifier = ""

    /// Event name
    @objc public dynamic var name = ""

    /// When the event starts
    @objc public dynamic var startDate = Date.distantPast {
        didSet {
            year = Calendar.current.component(.year, from: startDate)
        }
    }

    @objc public dynamic var year = -1

    /// When the event ends
    @objc public dynamic var endDate = Date.distantPast

    /// Is this the current event?
    @objc public dynamic var isCurrent = false

    /// Sessions held at this event
    public let sessions = List<Session>()

    @objc public dynamic var imagesPath = ""

    /// Session instances for schedule
    public var sessionInstances = List<SessionInstance>()

    public override class func primaryKey() -> String? {
        return "identifier"
    }

    public static func make(identifier: String, name: String, startDate: Date, endDate: Date, isCurrent: Bool, imagesPath: String) -> Event {
        let event = Event()

        event.identifier = identifier
        event.name = name
        event.startDate = startDate
        event.endDate = endDate
        event.isCurrent = isCurrent
        event.imagesPath = imagesPath

        return event
    }

    internal static func identifier(from date: Date) -> String {
        let year = Calendar.current.component(.year, from: date)

        return "wwdc\(year)"
    }

}
