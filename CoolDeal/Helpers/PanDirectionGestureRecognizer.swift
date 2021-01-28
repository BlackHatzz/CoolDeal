//
//  PanDirectionGestureRecognizer.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/28/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit.UIPanGestureRecognizer


class PanDirectionGestureRecognizer: UIPanGestureRecognizer {
    enum Direction {
        case vertical
        case horizontal
    }
    
    let direction: Direction
    
    init(direction: Direction, target: AnyObject, action: Selector) {
        self.direction = direction
        super.init(target: target, action: action)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        if state == .began {
            let vel = velocity(in: view)
            switch direction {
            case .horizontal where abs(vel.y) > abs(vel.x):
                state = .cancelled
            case .vertical where abs(vel.x) > abs(vel.y):
                state = .cancelled
            default:
                break
            }
        }
    }
}

