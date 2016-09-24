//
//  Interpolable+UIKitTests.swift
//  Popsicle
//
//  Created by David Román Aguirre on 17/07/16.
//  Copyright © 2016 David Román Aguirre. All rights reserved.
//

import XCTest
@testable import Popsicle

func ~= (lhs: CGPoint, rhs: CGPoint) -> Bool {
	return lhs.x ~= rhs.x && lhs.y ~= rhs.y
}

func ~= (lhs: CGSize, rhs: CGSize) -> Bool {
	return lhs.width ~= rhs.width && lhs.height ~= rhs.height
}

func ~= (lhs: CGRect, rhs: CGRect) -> Bool {
	return lhs.origin ~= rhs.origin && lhs.size ~= rhs.size
}

extension FloatingPoint {
	var radians: Self { return self * .pi / 180 }
	var degrees: Self { return self * 180 / .pi }
}

func ~= (lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
	return lhs.translationX ~= rhs.translationX
		&& lhs.translationY ~= rhs.translationY
		&& lhs.scaleX ~= rhs.scaleX
		&& lhs.scaleY ~= rhs.scaleY
		&& lhs.angle ~= rhs.angle
}

func ~= (lhs: UIColor, rhs: UIColor) -> Bool {
	var lhsRed = CGFloat()
	var lhsGreen = CGFloat()
	var lhsBlue = CGFloat()
	var lhsAlpha = CGFloat()

	var rhsRed = CGFloat()
	var rhsGreen = CGFloat()
	var rhsBlue = CGFloat()
	var rhsAlpha = CGFloat()

	lhs.getRed(&lhsRed, green: &lhsGreen, blue: &lhsBlue, alpha: &lhsAlpha)
	rhs.getRed(&rhsRed, green: &rhsGreen, blue: &rhsBlue, alpha: &rhsAlpha)

	return lhsRed ~= rhsRed
		&& lhsGreen ~= rhsGreen
		&& lhsBlue ~= rhsBlue
		&& lhsAlpha ~= rhsAlpha
}

class InterpolableUIKitTests: XCTestCase {

	func testInterpolableCGFloat() {
		InterpolableTests.test(
			initialValue: CGFloat(0),
			finalValue: -10,
			interpolatedValues: [0, -2.5, -3.3, -5, -6.6, -7.5, -10],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)

		InterpolableTests.test(
			initialValue: CGFloat(0),
			finalValue: 10,
			interpolatedValues: [0, 2.5, 3.3, 5, 6.6, 7.5, 10],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}

	func testInterpolableCGPoint() {
		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGPoint(x: -10, y: -20),
			interpolatedValues: [
				.zero,
				CGPoint(x: -2.5, y: -5),
				CGPoint(x: -3.3, y: -6.6),
				CGPoint(x: -5, y: -10),
				CGPoint(x: -6.6, y: -13.2),
				CGPoint(x: -7.5, y: -15),
				CGPoint(x: -10, y: -20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)

		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGPoint(x: 10, y: 20),
			interpolatedValues: [
				.zero,
				CGPoint(x: 2.5, y: 5),
				CGPoint(x: 3.3, y: 6.6),
				CGPoint(x: 5,	y: 10),
				CGPoint(x: 6.6, y: 13.2),
				CGPoint(x: 7.5, y: 15),
				CGPoint(x: 10,	y: 20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}

	func testInterpolableCGSize() {
		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGSize(width: -10, height: -20),
			interpolatedValues: [
				.zero,
				CGSize(width: -2.5, height: -5),
				CGSize(width: -3.3, height: -6.6),
				CGSize(width: -5,	height: -10),
				CGSize(width: -6.6, height: -13.2),
				CGSize(width: -7.5, height: -15),
				CGSize(width: -10,	height: -20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)

		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGSize(width: 10, height: 20),
			interpolatedValues: [
				.zero,
				CGSize(width: 2.5,	height: 5),
				CGSize(width: 3.3,	height: 6.6),
				CGSize(width: 5,	height: 10),
				CGSize(width: 6.6,	height: 13.2),
				CGSize(width: 7.5,	height: 15),
				CGSize(width: 10,	height: 20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}

	func testInterpolableCGRect() {
		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGRect(x: -30, y: -50, width: -10, height: -20),
			interpolatedValues: [
				.zero,
				CGRect(x: -7.5, y: -12.5, width: -2.5, height: -5),
				CGRect(x: -9.9, y: -16.5, width: -3.3, height: -6.6),
				CGRect(x: -15, y: -25, width: -5, height: -10),
				CGRect(x: -19.8, y: -33, width: -6.6, height: -13.2),
				CGRect(x: -22.5, y: -37.5, width: -7.5, height: -15),
				CGRect(x: -30, y: -50, width: -10, height: -20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)

		InterpolableTests.test(
			initialValue: .zero,
			finalValue: CGRect(x: 30, y: 50, width: 10, height: 20),
			interpolatedValues: [
				.zero,
				CGRect(x: 7.5, y: 12.5, width: 2.5, height: 5),
				CGRect(x: 9.9, y: 16.5, width: 3.3, height: 6.6),
				CGRect(x: 15, y: 25, width: 5, height: 10),
				CGRect(x: 19.8, y: 33, width: 6.6, height: 13.2),
				CGRect(x: 22.5, y: 37.5, width: 7.5, height: 15),
				CGRect(x: 30, y: 50, width: 10, height: 20)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}

	func testInterpolableCGAffineTransform() {
		InterpolableTests.test(
			initialValue: .identity,
			finalValue: CGAffineTransform.identity.translatedBy(x: 30, y: 50).scaledBy(x: 10, y: 20).rotated(by: CGFloat(50).radians),
			interpolatedValues: [
				.identity,
				CGAffineTransform.identity.translatedBy(x: 7.5, y: 12.5).scaledBy(x: 3.25, y: 5.75).rotated(by: CGFloat(12.5).radians),
				CGAffineTransform.identity.translatedBy(x: 9.9, y: 16.5).scaledBy(x: 3.97, y: 7.27).rotated(by: CGFloat(16.5).radians),
				CGAffineTransform.identity.translatedBy(x: 15, y: 25).scaledBy(x: 5.5, y: 10.5).rotated(by: CGFloat(25).radians),
				CGAffineTransform.identity.translatedBy(x: 19.8, y: 33).scaledBy(x: 6.94, y: 13.54).rotated(by: CGFloat(33).radians),
				CGAffineTransform.identity.translatedBy(x: 22.5, y: 37.5).scaledBy(x: 7.75, y: 15.25).rotated(by: CGFloat(37.5).radians),
				CGAffineTransform.identity.translatedBy(x: 30, y: 50).scaledBy(x: 10, y: 20).rotated(by: CGFloat(50).radians)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}

	func testInterpolableColor() {
		InterpolableTests.test(
			initialValue: UIColor(white: 1, alpha: 0),
			finalValue: UIColor(white: 0, alpha: 1),
			interpolatedValues: [
				UIColor(white: 1, alpha: 0),
				UIColor(white: 0.75, alpha: 0.25),
				UIColor(white: 0.66, alpha: 0.33),
				UIColor(white: 0.5, alpha: 0.5),
				UIColor(white: 0.33, alpha: 0.66),
				UIColor(white: 0.25, alpha: 0.75),
				UIColor(white: 0, alpha: 1)
			],
			times: [0, 0.25, 0.33, 0.5, 0.66, 0.75, 1],
			function: ~=
		)
	}
}
