//
//  InteractiveTransition.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

final class InteractiveTransition: UIPercentDrivenInteractiveTransition {

	var viewController: UIViewController? {
		didSet {
			let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handle(_:)))
			recognizer.edges = [.left]
			viewController?.view.addGestureRecognizer(recognizer)
		}
	}

	var isStarted: Bool = false
	private var shouldFinish: Bool = false

    @objc func handle(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        
        case .began:
            self.isStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
            
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = (translation.x + translation.y / 2) / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            self.shouldFinish = progress > 0.10
            self.update(progress)
            
        case .ended:
            self.isStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
            
        case .cancelled:
            self.isStarted = false
            self.cancel()
            
        default: return
		}
	}
}
