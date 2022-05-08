//
//  StoryServiceStub.swift
//  NineTestAppTests
//
//  Created by oleygen-private on 08.05.2022.
//

import Foundation

class StoryServiceMock: StoryService {
    func getStories(completion: @escaping (Story?, Error?) -> (Void)) {
        DispatchQueue.global().async {
            guard let fName = Bundle(for: type(of: self)).path(forResource: "StoryJson", ofType: "txt") else {
                completion(nil, nil)
                return
            }
            guard let json = try? String(contentsOfFile: fName) else {
                completion(nil, nil)
                return
            }
            guard let data = json.data(using: .utf8) else {
                completion(nil, nil)
                return
            }
            let decoder = JSONDecoder()
            guard let story = try? decoder.decode(Story.self, from: data) else {
                completion(nil, nil)
                return
            }
            completion(story, nil)
        }
     
    }
    
    
    
}
