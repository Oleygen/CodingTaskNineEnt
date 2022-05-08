//
//  StoryService.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation

protocol StoryService {
    func getStories(completion: @escaping (Story?, Error?) -> (Void)) -> Void
}
