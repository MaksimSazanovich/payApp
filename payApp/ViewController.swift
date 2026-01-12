//
//  ViewController.swift
//  payApp
//
//  Created by Maksim on 12.01.26.
//

import UIKit

class ViewController: UIViewController {

    private lazy var personImage: UIImageView = {
        $0.image = .img1
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        $0.widthAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .main
        setCircles()
        setPersonImage()
        setText()
    }
    
    //MARK: Set view
    private func setCircles() {
        let circle1 = createCircle(frame: CGRect(x: view.frame.width - 76, y: -28, width: 100, height: 100))
        let circle2 = createCircle(frame: CGRect(x: 83, y: 100, width: 67, height: 67))
        let circle3 = createCircle(frame: CGRect(x: view.frame.width - 202, y: 216, width: 286, height: 286))
        let circle4 = createCircle(frame: CGRect(x: 83, y: view.frame.height - 272, width: 56, height: 56))
        let circle5 = createCircle(frame: CGRect(x: view.frame.width - 121, y: view.frame.height - 217, width: 97, height: 97))
        
        [circle1, circle2, circle4, circle3, circle5].forEach { item in
            view.addSubview(item)
        }
    }
    
    private func setPersonImage() {
        view.addSubview(personImage)
        personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setText() {
        
    }
    
    //MARK: Create view
    private func createCircle(frame: CGRect) -> UIView {
        let circle = UIView()
        circle.backgroundColor = .circle
        circle.frame = frame
        circle.layer.cornerRadius = frame.width / 2
        return circle
    }
    
    func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.textColor = .white
        label.font =  UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
}

