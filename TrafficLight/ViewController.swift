//
//  ViewController.swift
//  TrafficLight
//
//  Created by Владислав on 12.01.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var actionButton: UIButton!
    
    private let offLight: CGFloat = 0.2
    private let onLight: CGFloat = 1
    private var currentLight: Light = .green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.alpha = offLight
        greenView.alpha = offLight
        yellowView.alpha = offLight
        
        redView.layer.cornerRadius = redView.layer.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.layer.frame.height / 2
        greenView.layer.cornerRadius = greenView.layer.frame.height / 2
    }
    
    @IBAction func actionLight(_ sender: Any) {
        actionButton.setTitle("Next", for: .normal)
        switch currentLight {
        case .red:
            currentLight = .yellow
            redView.alpha = offLight
            yellowView.alpha = onLight
        case .yellow:
            currentLight = .green
            yellowView.alpha = offLight
            greenView.alpha = onLight
        case .green:
            currentLight = .red
            greenView.alpha = offLight
            redView.alpha = onLight
        }
    }
    
}

// MARK: - Light
extension ViewController {
    private enum Light {
        case red
        case yellow
        case green
    }
}
