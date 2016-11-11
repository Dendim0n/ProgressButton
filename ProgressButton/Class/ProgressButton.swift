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
        progressLayer.strokeEnd = 0
    }
    
    func setColor(_ color: UIColor) {
        progressLayer.strokeColor = color.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resetSubLayer()
    }
    
    private func commonInit() {
        setSubLayer()
    }
    
    private func setSubLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: frame.midY))
        path.addLine(to: CGPoint.init(x: frame.maxX, y: frame.midY))
        progressLayer.path = path.cgPath
        layer.addSublayer(progressLayer)
    }
    
    private func resetSubLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: frame.midY))
        path.addLine(to: CGPoint.init(x: frame.maxX, y: frame.midY))
        progressLayer.path = path.cgPath
    }
    
    private func setUI() {

        layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10.0
        
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

}
