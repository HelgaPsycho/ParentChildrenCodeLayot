//
//  TableViewCell.swift
//  ParentChildrenCodeLayot
//
//  Created by Ольга Егорова on 04.11.2022.


//Create a UITableViewCell Programmatically

//https://stevenpcurtis.medium.com/create-a-uitableviewcell-programmatically-88d453380dcf
//

import UIKit
import RAGTextField

class TableViewCell: UITableViewCell {
    
    lazy var externalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.spacing = 20
        return stackView
        
    }()
    
    lazy var internalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
    
        return stackView
        
    }()
    
    lazy var nameTextField: RAGTextField = {
        let textField = RAGTextField()
        textField.placeholder = "Имя"
        return textField
    }()
    
    lazy var ageTextField: RAGTextField = {
        let textField = RAGTextField()
        textField.placeholder = "Возраст"
        return textField
    }()
    
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.titleLabel?.textAlignment = .center
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(externalStack)
        externalStack.addArrangedSubview(internalStack)
        externalStack.addArrangedSubview(deleteButton)
        setupExternalStack()
        setupDeleteButton()
        internalStack.addArrangedSubview(nameTextField)
        internalStack.addArrangedSubview(ageTextField)
        setupInternalStack()
        setupTextField(textField: nameTextField)
        setupTextField(textField: ageTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField (textField: RAGTextField){
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholderColor = .lightGray
        textField.transformedPlaceholderColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.textPaddingMode = .textAndPlaceholder
        textField.textAlignment = .left
        textField.textPadding.left = 10
    }
    
    
    
    func setupExternalStack() {
        externalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        externalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        externalStack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        externalStack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
    }
    
    func setupDeleteButton(){
        deleteButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        }
    
    func setupInternalStack() {
        internalStack.topAnchor.constraint(equalTo: externalStack.topAnchor).isActive = true
        internalStack.bottomAnchor.constraint(equalTo: externalStack.bottomAnchor).isActive = true
        internalStack.leftAnchor.constraint(equalTo: externalStack.leftAnchor).isActive = true
    }
}
