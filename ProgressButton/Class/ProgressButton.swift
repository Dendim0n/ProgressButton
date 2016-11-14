//
//  ProgressButton.swift
//  ProgressButton
//
//  Created by 任岐鸣 on 2016/11/11.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit

class ProgressButton: UIButton {
    
    var lblTitle = UILabel.init()
    var progressLayer = CAShapeLayer.init()
    var circleLayer = CAShapeLayer.init()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    
    func setProgress(_ progress: CGFloat) {
        progressLayer.strokeEnd = progress
    }
    
    func clickedToProgress() {
        
        let centerPoint = CGPoint.init(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let circlePathEnd = UIBezierPath()
        circlePathEnd.addArc(withCenter: centerPoint, radius: self.frame.width, startAngle: 0, endAngle: 2.0*CGFloat(M_PI), clockwise: true)
        
        let circlePathStart = UIBezierPath()
        circlePathStart.addArc(withCenter: centerPoint, radius: 0, startAngle: 0, endAngle: 2.0*CGFloat(M_PI), clockwise: true)
        
        self.circleLayer.path = circlePathEnd.cgPath
        
        let anim = CASpringAnimation.init()
        anim.fromValue = circlePathStart.cgPath
        anim.toValue = circlePathEnd.cgPath
        anim.duration = 0.3
        anim.damping = 0.5
//        anim.rep
        
        self.circleLayer.add(anim, forKey: "path")
        
//        UIView.animate(withDuration: 0.3, animations: {
//            self.circleLayer.path = circlePathEnd.cgPath
//        })
        
        //end:
//        progressLayer.strokeEnd = 0
    }
    
    func setColor(_ color: UIColor) {
        progressLayer.strokeColor = color.cgColor
        circleLayer.strokeColor = color.cgColor
        self.layer.borderColor = color.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resetSubLayer()
    }
    
    func commonInit() {
//        self.layer.masksToBounds = true
//        self.clipsToBounds = true
        setUI()
        setSubLayer()
    }
    
    private func setSubLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: bounds.height / 2))
        path.addLine(to: CGPoint.init(x: frame.width, y: bounds.height / 2))
        path.lineWidth = 5
//        progressLayer.frame = self.bounds
        progressLayer.path = path.cgPath
        
        progressLayer.strokeEnd = 1
        progressLayer.strokeStart = 0
        
        
        layer.addSublayer(progressLayer)
        

        let centerPoint = CGPoint.init(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let circlePathStart = UIBezierPath()
        circlePathStart.addArc(withCenter: centerPoint, radius: 0, startAngle: 0, endAngle: 2.0*CGFloat(M_PI), clockwise: true)
        
        
        circleLayer.path = circlePathStart.cgPath
        circleLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(circleLayer)
        
    }
    
    private func resetSubLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: bounds.height / 2))
        path.addLine(to: CGPoint.init(x: frame.width, y: bounds.height / 2))
        path.lineWidth = 5
        progressLayer.path = path.cgPath
    }
    
    private func setUI() {

        layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10.0
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

}
