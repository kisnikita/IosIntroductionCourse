//
//  UIView + Pin.swift
//  Seminar2
//
//  Created by Никита Кислов on 22.09.2023.
//

import UIKit

extension UIView {
    enum ConstraintMode{
        case equal // ==
        case grOE // greaterOrEqual >=
        case lsOE // lessOrEqual <=
    }
    
    // MARK: - Pin left
    @discardableResult
    func pinLeft(
        to otherView: UIView,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, const)
    }
    
    @discardableResult
    func pinLeft(
        to anchor: NSLayoutXAxisAnchor,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, anchor, const)
    }
    
    // MARK: - Pin right
    @discardableResult
    func pinRight(
        to otherView: UIView,
        const: Double = -1,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, const)
    }
    
    @discardableResult
    func pinRight(
        to anchor: NSLayoutXAxisAnchor,
        const: Double = -1,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, anchor, const)
    }
    
    // MARK: - Pin top
    @discardableResult
    func pinTop(
        to otherView: UIView,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, otherView.topAnchor, topAnchor, const)
    }
    
    @discardableResult
    func pinTop(
        to anchor: NSLayoutYAxisAnchor,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, anchor, const)
    }
    // MARK: - Pin bottom
    @discardableResult
    func pinBottom(
        to otherView: UIView,
        const: Double = -1,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, otherView.bottomAnchor, bottomAnchor, const)
    }
    
    @discardableResult
    func pinBottom(
        to anchor: NSLayoutYAxisAnchor,
        const: Double = -1,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, anchor, const)
    }
    
    // MARK: - Pin center
    @discardableResult
    func pinCenterX(
        to otherView: UIView,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, const)
    }
    
    @discardableResult
    func pinCenterX(
        to anchor: NSLayoutXAxisAnchor,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, anchor, const)
    }
    
    // MARK: - Pin center
    @discardableResult
    func pinCenterY(
        to otherView: UIView,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, const)
    }
    
    @discardableResult
    func pinCenterY(
        to anchor: NSLayoutYAxisAnchor,
        const: Double = 0,
        mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, anchor, const)
    }
    
    // MARK: - Pin width
        @discardableResult
        func pinWidth(
            to otherView: UIView,
            multiplier: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, multiplier)
        }
        
        @discardableResult
        func pinWidth(
            to anchor: NSLayoutYAxisAnchor,
            multiplier: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinConstraint(mode: mode, centerYAnchor, anchor, multiplier)
        }
    // MARK: - Pin height
        @discardableResult
        func pinHeight(
            to otherView: UIView,
            multiplier: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, multiplier)
        }
        
        @discardableResult
        func pinHeight(
            to anchor: NSLayoutYAxisAnchor,
            multiplier: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinConstraint(mode: mode, centerYAnchor, anchor, multiplier)
        }
    // MARK: - Set width
        @discardableResult
        func setWidth(
            to otherView: UIView,
            const: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinDimension(mode: mode, widthAnchor, constant: const)
        }
    // MARK: - Set height
        @discardableResult
        func setHeight(
            to otherView: UIView,
            const: Double = 0,
            mode: ConstraintMode = .equal
        ) -> NSLayoutConstraint {
            pinDimension(mode: mode, heightAnchor , constant: const)
        }
    // MARK: - Private methods
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(
        mode: ConstraintMode,
        _ firstConstraint: AnyAnchor,
        _ secondConstraint: AnyAnchor,
        _ constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: const)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: const)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: const)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinConstraint(
        mode: ConstraintMode,
        _ firstConstraint: NSLayoutDimension,
        _ secondConstraint: NSLayoutDimension,
        _ multiplier: Double = 0
    ) -> NSLayoutConstraint {
        let mult = CGFloat(multiplier)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, multiplier: mult)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, multiplier: mult)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, multiplier: mult)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinDimension(
        mode: ConstraintMode,
        _ dimension: NSLayoutDimension,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = dimension.constraint(equalToConstant: const)
        case .grOE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case .lsOE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }
        
        result.isActive = true
        return result
    }
}
