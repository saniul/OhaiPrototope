//
//  MainScene.swift
//  OhaiPrototope
//
//  Created by __YOUR_NAME_HERE__ on __DATE__
//  Copyright (c) 2015 Marcos Ojeda. All rights reserved.
//

import Prototope

class MainScene {

    var spinnyLayer: Layer!
    var needyLayer: Layer!

    init(){
        Layer.root.backgroundColor = Color(hue: 0.6, saturation: 0.26, brightness: 0.43)
        makeSpinnyLayer()
        makeNeedyLayer()
    }

    func gimmeSquare(x:Int? = 324) -> Layer! {
        // return a rounded white square at some x value (defaults to 324)

        let tempLayer = Layer(parent: Layer.root)
        tempLayer.width = 100
        tempLayer.height = 100
        tempLayer.backgroundColor = Color(white: 1, alpha: 1)
        tempLayer.cornerRadius = 5
        tempLayer.x = Double(x!)
        tempLayer.y = 512

        return tempLayer
    }

    func makeSpinnyLayer(){
        // touching this layer will rotate it 90 degrees to the right
        spinnyLayer = gimmeSquare()

        spinnyLayer.touchBeganHandler = { _ in
            Layer.animateWithDuration(0.3, curve: .EaseInOut) {
                self.spinnyLayer.rotationDegrees += 90
            }
        }
    }

    func makeNeedyLayer(){
        // this layer will also rotate 90 degrees to the right and recoil
        // from your touch for as long as you press down on it. Letting go
        // will return it to its original state
        needyLayer = gimmeSquare(x:444)

        // starting to touch it will rotate and scale it
        needyLayer.touchBeganHandler = { _ in
            Layer.animateWithDuration(0.7, curve: .EaseInOut) {
                self.needyLayer.rotationDegrees = 90
                self.needyLayer.scale = 0.8
            }
        }

        // letting go restores the values
        needyLayer.touchEndedHandler = { _ in
            Layer.animateWithDuration(0.5, curve: .EaseInOut) {
                self.needyLayer.rotationDegrees = 0
                self.needyLayer.scale = 1
            }
        }
    }

}