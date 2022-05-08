//
//  StoryServiceImpl.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation

class StoryServiceImpl: StoryService {
    func getStories(completion: @escaping (Story?, Error?) -> (Void)) -> Void  {
        guard let url = TestAppAPI.storyURL else {
            return completion(nil, NSError(domain: "Incorrect URL", code: 0))
        }
        
        URLSession.shared.dataTask(with: url ) { data, response, error in
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 200 && response.statusCode < 300 {
                    let decoder = JSONDecoder()
                    
                    guard let data = data else {
                        completion(nil, NSError(domain: "No data in response", code: 0))
                        return
                    }
                    guard let story = try? decoder.decode(Story.self, from: data) else {
                        completion(nil, NSError(domain: "Can't map data into Story", code: 0))
                        return
                    }
                    completion(story, nil)
                } else {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }            
        }.resume()
    }
}

