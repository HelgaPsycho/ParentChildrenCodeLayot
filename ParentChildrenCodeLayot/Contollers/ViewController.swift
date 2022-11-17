//
//  ViewController.swift
//  ParentChildrenCodeLayot
//
//  Created by Ольга Егорова on 01.11.2022.
//

import UIKit
import RAGTextField


class ViewController: UIViewController {
    
    var data: [String] = ["Попсик", "Каша", "Чук", "Туча", "Викуля"]
    var ageData: [String] = ["30", "29", "31", "29", "30"]
    
   
    let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 15
    
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Helvetica", size: 22)
        label.text = "Персональные данные"
        return label
    }()
    
    let nameTextField: RAGTextField = {
        let textField = RAGTextField()
        textField.placeholder = "Имя"
        return textField
    }()
    
    let ageTextField: RAGTextField = {
        let textField = RAGTextField()
        textField.placeholder = "Возраст"
        return textField
    }()
    
    
    let childrenLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.allowsDefaultTighteningForTruncation = false
        label.font = UIFont(name: "helvetica", size: 20)
        label.text = "Дети:"
        return label
        
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Добавить ребенка (макс. 5)", for: .normal)
        let image = UIImage(systemName: "plus")
        image!.withTintColor(.red)
        button.setImage(image, for: .normal)
        button.tintColor = .systemRed
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.systemBrown, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.titleLabel?.textAlignment = .center


        return button
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.systemBrown, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView ()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(parentStackView)
        view.addSubview(bottomView)
        setupParenStackView()
        setupBottomView()
        view.addSubview(tableView)
        setupTableView()
        
    }


    func setupParenStackView () {
        parentStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //почему-то top далеко от края safeArea
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        parentStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        parentStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        setupTextField(textField: nameTextField)
        setupTextField(textField: ageTextField)
        let childrenStackView = UIStackView()
        setupChildrenStackView(stackView: childrenStackView)
    
        parentStackView.addArrangedSubview(titleLabel)
        parentStackView.addArrangedSubview(nameTextField)
        parentStackView.addArrangedSubview(ageTextField)
        parentStackView.addArrangedSubview(childrenStackView)
        
        nameTextField.widthAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 1).isActive = true
        ageTextField.widthAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 1).isActive = true
        childrenStackView.widthAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 1).isActive = true
        childrenLabel.leftAnchor.constraint(equalTo: childrenStackView.leftAnchor, constant: 10).isActive = true
        addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/14).isActive = true
        
        
    }
    
    func setupChildrenStackView(stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing  = 20
        stackView.addArrangedSubview(childrenLabel)
        stackView.addArrangedSubview(addButton)
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
    
    func setupBottomView () {
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/11).isActive = true
        
        bottomView.addSubview(bottomButton as UIView)
        setupBottomButton()
    }
    
    func setupBottomButton (){
        
        bottomButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -20).isActive = true
        bottomButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/14).isActive = true

        
    }
    func setupTableView (){
        tableView.topAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: 2).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return true
        }
        
        internal func textFieldDidEndEditing(_ textField: UITextField) {
            
           //return textField.text!
        }


}
extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {fatalError("could not dequeueReusableCell")}
        cell.nameTextField.text = data[indexPath.row]
        cell.ageTextField.text = ageData[indexPath.row]
        cell.translatesAutoresizingMaskIntoConstraints = true
        cell.heightAnchor.constraint(equalToConstant: 150).isActive = true
            return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
    

