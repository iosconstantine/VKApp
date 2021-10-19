//
//  CustomNavigationController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

final class CustomNavControllerInteractiv: UINavigationController {

	let interactiveTransition = InteractiveTransition()

	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
	}
}

extension CustomNavControllerInteractiv: UINavigationControllerDelegate {

	func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

		return interactiveTransition.isStarted ? interactiveTransition : nil
	}

	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		switch operation {
		case .pop:
			if navigationController.viewControllers.first != toVC {
				interactiveTransition.viewController = toVC
			}
			return PopAnimator()
		case .push:
			interactiveTransition.viewController = toVC
			return PushAnimator()
		default:
			return nil
		}
	}
}
