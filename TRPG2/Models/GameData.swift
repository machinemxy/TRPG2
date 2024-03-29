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
	private var cachedNormalSceneName: String?
	private var cachedNormalScene: Dictionary<String, NormalScene>?
    private var cachedCheckSceneName: String?
    private var cachedCheckScene: Dictionary<String, CheckScene>?
    
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
		if sceneName == cachedNormalSceneName {
			return cachedNormalScene ?? Dictionary()
		} else {
			let fileName = sceneName + "_normal"
			cachedNormalSceneName = sceneName
			cachedNormalScene = Bundle.main.load(from: fileName)
			return cachedNormalScene ?? Dictionary()
		}
	}
    
    var checkScenes: Dictionary<String, CheckScene> {
        if sceneName == cachedCheckSceneName {
            return cachedCheckScene ?? Dictionary()
        } else {
            let fileName = sceneName + "_check"
            cachedCheckSceneName = sceneName
            cachedCheckScene = Bundle.main.load(from: fileName)
            return cachedCheckScene ?? Dictionary()
        }
    }
    
    // MARK: function
    func copy(from gd: GameData) {
        sceneType = gd.sceneType
        sceneName = gd.sceneName
        subSceneName = gd.subSceneName
        variables = gd.variables
    }
}
