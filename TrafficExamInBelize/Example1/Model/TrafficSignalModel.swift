//
//  TrafficSignalModel.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 20/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

enum Title: String{
    case trafficTitle = "What does it mean?"
    case projectNameTitle = "What is the project name"
    case projectYear = "How long is the project"
    case projectContent = "What is the project field"
    case projectCounty = "What countries are cooperating for this porject"
}

struct TrafficSignal {
    var signImage: UIImage
    var rightAnswer: String
    var wrongAnswer1: String
    var wrongAnswer2: String
    var title: String
    static func getTrafficSigns() -> [TrafficSignal] {
        return [
            TrafficSignal(signImage: #imageLiteral(resourceName: "img0"), rightAnswer: "No-Entry", wrongAnswer1: "Entry", wrongAnswer2: "Stop", title: Title.trafficTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "img1"), rightAnswer: "No-Parking", wrongAnswer1: "No-Painting", wrongAnswer2: "No-Sleeping", title: Title.trafficTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "img2"), rightAnswer: "Stop", wrongAnswer1: "No-Stop", wrongAnswer2: "Keep-Going", title: Title.trafficTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "img3"), rightAnswer: "Two-Way", wrongAnswer1: "One-Way", wrongAnswer2: "No-Way", title: Title.trafficTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "img4"), rightAnswer: "No-U-Turn", wrongAnswer1: "U-Turn", wrongAnswer2: "Y-Turn", title: Title.trafficTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "img5"), rightAnswer: "Narrow-to-Wide", wrongAnswer1: "Wide-to-Narrow", wrongAnswer2: "Narrow-to-Narrow", title: Title.trafficTitle.rawValue),
            
            TrafficSignal(signImage: #imageLiteral(resourceName: "project_name"), rightAnswer: "", wrongAnswer1: "", wrongAnswer2: "Food Project", title: Title.projectNameTitle.rawValue),
            TrafficSignal(signImage: #imageLiteral(resourceName: "project_name"), rightAnswer: "Motor Vehicle Registriction and License System Project 🚗", wrongAnswer1: "Genetic Improvement in Sheep and Goat Project", wrongAnswer2: "Overseas Profeesional Mandarin Teaching Project", title: Title.projectNameTitle.rawValue),
             TrafficSignal(signImage: #imageLiteral(resourceName: "project_country"), rightAnswer: "Taiwan🇹🇼 & Belize🇧🇿", wrongAnswer1: "Japan & Belize", wrongAnswer2: "America & Belize", title: Title.projectCounty.rawValue),
              TrafficSignal(signImage: #imageLiteral(resourceName: "project_years"), rightAnswer: "Four Years 4️⃣", wrongAnswer1: "Five Years", wrongAnswer2: "Six Years", title: Title.projectYear.rawValue),
               TrafficSignal(signImage: #imageLiteral(resourceName: "project_contents"), rightAnswer: "Traffic 🚗", wrongAnswer1: "Health", wrongAnswer2: "Food", title: Title.projectContent.rawValue),
        ]
    }
}

