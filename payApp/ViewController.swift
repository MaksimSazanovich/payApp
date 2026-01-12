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
    
    private lazy var textStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var payButton: UIButton = {
        $0.setTitle("поддержать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .darkGreen
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        return $0
    }(UIButton(primaryAction: payButtonAction))
    
    private lazy var payButtonAction = UIAction { _ in
        print(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .main
        setCircles()
        setPersonImage()
        setText()
        setPayVariants()
        setPayButton()
    }
    
    //MARK: Set view
    private func setCircles() {
        let circle1 = createCircle(frame: CGRect(x: view.frame.width - 76, y: -28, width: 100, height: 100))
        let circle2 = createCircle(frame: CGRect(x: 83, y: 100, width: 67, height: 67))
        let circle3 = createCircle(frame: CGRect(x: view.frame.width - 202, y: 216, width: 286, height: 286))
        let circle4 = createCircle(frame: CGRect(x: 83, y: view.frame.height - 328, width: 56, height: 56))
        let circle5 = createCircle(frame: CGRect(x: view.frame.width - 121, y: view.frame.height - 217, width: 97, height: 97))
        
        [circle1, circle2, circle4, circle3, circle5].forEach { item in
            view.addSubview(item)
        }
    }
    
    private func setPersonImage() {
        view.addSubview(personImage)
        personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setText() {
        view.addSubview(textStack)
        
        let pageTitle = createLabel(size: 30, weight: .bold, text: "Приложение и все его функции бесплатные")
        let pageSubtitle = createLabel(size: 16, weight: .regular, text: "все средства идут на улучшение и поддержку проекта")
        
        textStack.addArrangedSubview(pageTitle)
        textStack.addArrangedSubview(pageSubtitle)
        
        NSLayoutConstraint.activate([
            textStack.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 30),
            textStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setPayVariants() {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 0
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hStack)
        
        PayVariants.allCases.forEach { variant in
            hStack.addArrangedSubview(createPayVariant(variant: variant))
        }
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: textStack.bottomAnchor, constant: 60),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setPayButton() {
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
    
    func createPayVariant(variant: PayVariants) -> UIView {
        let payView = UIView()
        payView.translatesAutoresizingMaskIntoConstraints = false
        payView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        payView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        payView.layer.cornerRadius = 21
        payView.tag = variant.rawValue
        //gesture
        
        switch variant {
        case .small:
            payView.backgroundColor = .orange
            payView.layer.borderWidth = 2
            payView.layer.borderColor = UIColor.white.cgColor
        case .middle:
            payView.backgroundColor = .pink
        case .big:
            payView.backgroundColor = .darkGreen
        }
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let sumLabel = createLabel(size: 31, weight: .bold, text: "\(variant.rawValue)")
        let sumDescription = createLabel(size: 16, weight: .light, text: "рублей")
        
        vStack.addArrangedSubview(sumLabel)
        vStack.addArrangedSubview(sumDescription)
        
        payView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: payView.topAnchor, constant: 23),
            vStack.bottomAnchor.constraint(equalTo: payView.bottomAnchor, constant: -23),
            vStack.leadingAnchor.constraint(equalTo: payView.leadingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: payView.trailingAnchor, constant: -10)
        ])
        
        return payView
    }
}

