//
//  GameData.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/21.
//

import Foundation


class GameData: ObservableObject, Codable {
	// MARK: properties
    @Published var sceneType = SceneType.normal
    @Published var sceneName = "outOfPalace"
	@Published var subSceneName = "outOfPalace"
    @Published var variables = Array.init(repeating: 0, count: 100)
	private var _cachedNormalSceneName: String?
	private var _cachedNormalScene: Dictionary<String, NormalScene>?
    
    // MARK: codable
    enum Ck: CodingKey {
        case sceneType, sceneName, subSceneName, variables
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Ck.self)
        
        try container.encode(sceneType, forKey: .sceneType)
        try container.encode(sceneName, forKey: .sceneName)
        try container.encode(subSceneName, forKey: .subSceneName)
        try container.encode(variables, forKey: .variables)
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Ck.self)
        
        sceneType = try container.decode(SceneType.self, forKey: .sceneType)
        sceneName = try container.decode(String.self, forKey: .sceneName)
        subSceneName = try container.decode(String.self, forKey: .subSceneName)
        variables = try container.decode([Int].self, forKey: .variables)
    }
	
	// MARK: calculated properties
	var normalScenes: Dictionary<String, NormalScene> {
		if sceneName == _cachedNormalSceneName {
			return _cachedNormalScene ?? Dictionary()
		} else {
			let fileName = sceneName + "_normal"
			_cachedNormalSceneName = sceneName
			_cachedNormalScene = Bundle.main.load(from: fileName)
			return _cachedNormalScene ?? Dictionary()
		}
	}
}
