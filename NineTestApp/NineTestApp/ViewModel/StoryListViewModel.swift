//
//  StoryListViewModel.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation

class StoryListViewModel {
    var items: Box<[Asset]>? = Box(value: [])
    var error: Box<Error>? = Box(value: nil)
    var isLoading: Box<Bool> = Box(value: false)
    let service: StoryService
    
    init(storyService: StoryService) {
        self.service = storyService
    }
    
    func fetch() {
        self.isLoading.value = true
        self.service.getStories { story, error in
            if let story = story {
                self.items?.value = story.assets.sorted(by: { asset1, asset2 in
                    asset1.timeStamp > asset2.timeStamp
                })
            } else if let error = error {
                self.error?.value = error
            }
            self.isLoading.value = false
        }
    }
}
