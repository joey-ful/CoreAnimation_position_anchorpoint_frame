//
//  ViewController.swift
//  CoreAnimation
//
//  Created by 홍정아 on 2021/10/14.
//

import UIKit

class ViewController: UIViewController {

    private var pink: CALayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeSeparator(xPosition: 50)
        makeSeparator(xPosition: 150)
        
        let button = UIButton(type: .custom)
        button.setTitle("애니", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 300, y: 50, width: 50, height: 40)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        pink.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        pink.backgroundColor = UIColor.systemPink.cgColor
        view.layer.addSublayer(pink)
        /// 3번째 buttonTapped()를 활성화할시 주석 풀기
//        pink.frame.origin.x = 50 - pink.frame.size.width / 2
    }
    
    /// 시작 위치 조정, anchorPoint의 x를 0으로 => 이건 position이 frame.origin이 되기 때문에 다른 방식보다 더 이동한다
    @objc private func buttonTapped() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 50 + pink.frame.size.width / 2
        animation.toValue = 150
        animation.duration = 0.5
        pink.anchorPoint = CGPoint(x: 0, y: 0.5)
        pink.frame.origin.x = 150

        pink.add(animation, forKey: "basic")
    }
    
    /// 시작 위치 조정, 도착 위치 frame으로 조정
//    @objc private func buttonTapped() {
//        let animation = CABasicAnimation()
//        animation.keyPath = "position.x"
//        animation.fromValue = 50 + pink.frame.width / 2
//        animation.toValue = 150
//        animation.duration = 0.5
//        pink.frame.origin.x = 150 - pink.frame.width / 2
//
//        pink.add(animation, forKey: "basic")
//    }
    
    /// 시작 위치를 viewDidLoad에서 조정, 도착위치 frame으로 조정
//    @objc private func buttonTapped() {
//        let animation = CABasicAnimation()
//        animation.keyPath = "position.x"
//        animation.fromValue = 50
//        animation.toValue = 150
//        animation.duration = 0.5
//        pink.frame.origin.x = 150 - pink.frame.width / 2
//
//        pink.add(animation, forKey: "basic")
//    }
    
    /// 좌표 마커
    func makeSeparator(xPosition: Int) {
        let separator = UIView(frame: CGRect(x: xPosition, y: 50, width: 1, height: 100))
        separator.backgroundColor = .systemGray
        view.addSubview(separator)
        let label = UILabel()
        label.frame.origin = CGPoint(x: xPosition + 10, y: 50)
        label.text = xPosition.description
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(xPosition)).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(100)).isActive = true
    }
    
    /// 비번 잘못 쳤을 때 애니메이션
//    @objc private func buttonTapped() {
//        let animation = CAKeyframeAnimation()
//        animation.keyPath = "position.x";
//        animation.values = [NSNumber(value: 0), NSNumber(value: 10), NSNumber(value: -10), NSNumber(value: 10), NSNumber(value: 0)]
//        animation.keyTimes = [NSNumber(value: 0), NSNumber(value: 1 / 6.0), NSNumber(value: 3 / 6.0), NSNumber(value: 5 / 6.0), NSNumber(value: 1)]
//        animation.duration = 0.4
//
//        animation.isAdditive = true
//
//        pink.add(animation, forKey: "shake")
//    }
}

