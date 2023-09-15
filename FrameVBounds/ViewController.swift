//
//  ViewController.swift
//  FrameVBounds
//
//  Created by Rijo Samuel on 14/09/23.
//

import UIKit

class ViewController: UIViewController {
	
	var parentView: UIView!
	var childView: UIView!
	var frameLabel: UILabel!
	var boundsLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		createParentView()
		createChildView()
		createFrameLabel()
		createBoundsLabel()
		createButton()
	}
	
	func createParentView() {
		parentView = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
		parentView.backgroundColor = .red
		self.view.addSubview(parentView)
	}
	
	func createChildView() {
		childView = UIView(frame: CGRect(x: 60, y: 70, width: 250, height: 250))
		childView.backgroundColor = .green
		parentView.addSubview(childView)
		setInsets()
	}
	
	func createFrameLabel() {
		frameLabel = UILabel(frame: CGRect(x: 40, y: view.frame.size.height - 490, width: view.frame.size.width - 80, height: 200))
		frameLabel.numberOfLines = 0
		frameLabel.text =
  """
   Frame:
   Parent x: \(parentView.frame.origin.x) || Child x: \(childView.frame.origin.x)
   Parent y: \(parentView.frame.origin.y) || Child y: \(childView.frame.origin.y)
   Parent height: \(parentView.frame.size.height) || Child height: \(childView.frame.size.height)
   Parent width: \(parentView.frame.size.width) || Child width: \(childView.frame.size.width)
  """
		frameLabel.backgroundColor = .yellow
		view.addSubview(frameLabel)
	}
	
	func createBoundsLabel() {
		boundsLabel = UILabel(frame: CGRect(x: 40, y: view.frame.size.height - 280, width: view.frame.size.width - 80, height: 200))
		boundsLabel.numberOfLines = 0
		boundsLabel.text =
  """
   Bounds:
   Parent x: \(parentView.bounds.origin.x) || Child x: \(childView.bounds.origin.x)
   Parent y: \(parentView.bounds.origin.y) || Child y: \(childView.bounds.origin.y)
   Parent height: \(parentView.bounds.size.height) || Child height: \(childView.bounds.size.height)
   Parent width: \(parentView.bounds.size.width) || Child width: \(childView.bounds.size.width)
  """
		boundsLabel.backgroundColor = .systemPink
		view.addSubview(boundsLabel)
	}
	
	func createButton() {
		let button = UIButton(type: .system)
		button.frame = CGRect(x: view.frame.size.width/2 - 40, y: view.frame.size.height - 80, width: 80, height: 40)
		button.setTitle("Rotate", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		view.addSubview(button)
	}
	
	func rotate() {
		childView.transform = CGAffineTransform(rotationAngle: .pi/4)
	}
	
	@objc func buttonTapped() {
		rotate()
		setFrameBoundsText()
	}
	
	func setFrameBoundsText() {
		frameLabel.text =
  """
   Frame:
   Parent x: \(parentView.frame.origin.x) || Child x: \(childView.frame.origin.x)
   Parent y: \(parentView.frame.origin.y) || Child y: \(childView.frame.origin.y)
   Parent height: \(parentView.frame.size.height) || Child height: \(childView.frame.size.height)
   Parent width: \(parentView.frame.size.width) || Child width: \(childView.frame.size.width)
  """
		boundsLabel.text =
  """
   Bounds:
   Parent x: \(parentView.bounds.origin.x) || Child x: \(childView.bounds.origin.x)
   Parent y: \(parentView.bounds.origin.y) || Child y: \(childView.bounds.origin.y)
   Parent height: \(parentView.bounds.size.height) || Child height: \(childView.bounds.size.height)
   Parent width: \(parentView.bounds.size.width) || Child width: \(childView.bounds.size.width)
  """
	}
	
	func setInsets() {
		let binary = 0b1010
		let octal = 0o777
		let hexadecimal = 0x4D2
		let decimal = -123
		childView.layer.borderWidth = 10
		childView.layer.borderColor = UIColor.black.cgColor
	}
}

