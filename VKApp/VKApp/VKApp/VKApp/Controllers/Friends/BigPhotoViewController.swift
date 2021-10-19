//
//  BigPhotoViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 06.09.2021.
//

import UIKit

class BigPhotoViewController: UIViewController {

    @IBOutlet weak var bigView: BigPhotoView!
    
    var bigTappedVC: ((Int) -> IndexPath)?
    var bigPhotoes: [PhotoModel] = []
    var sourceIndexPath: IndexPath = IndexPath()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView.photoes = bigPhotoes.map({$0.photoName})
        bigView.visibleIndex = sourceIndexPath.item
        bigView.namePhoto = bigPhotoes.map({$0.photoName})
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
}
