//
//  SceneIndex.swift
//  OhaiPrototope
//
//  Created by Andy Matuschak on 2/6/15.
//  Copyright (c) 2015 Marcos Ojeda. All rights reserved.
//

import Foundation

struct Scene {
	let name: String
	let constructor: () -> AnyObject // what *are* types, anyway?

	static let sceneIndex: [Scene] = [
		Scene(name: "Touch animators", constructor: { TouchAnimators() }),
		Scene(name: "Shadow light source", constructor: { ShadowLightsource() }),
		Scene(name: "Touch events", constructor: { TouchEvents() }),
		Scene(name: "Touch unicorns", constructor: { TouchUnicorns() }),
		Scene(name: "Scale and rotate", constructor: { ScaleAndRotateGesturePlaypen() }),
		Scene(name: "Throw cats", constructor: { ThrowCats() }),
		Scene(name: "Particles", constructor: { TouchParticles() })
	]
}
