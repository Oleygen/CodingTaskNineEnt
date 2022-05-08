//
//  APIClient.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation

struct TestAppAPI {
    private static let baseURLString = "https://bruce-v2-mob.fairfaxmedia.com.au"
    private static let storyEndpointString = "1/coding_test/13ZZQX/full"
    
    static var baseURL = {
        return URL(string: baseURLString)
    }()
    static var storyURL = {
        return URL(string: storyEndpointString, relativeTo: baseURL)
    }()
}
