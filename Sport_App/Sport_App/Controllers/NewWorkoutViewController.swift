//
//  NewWorkoutViewController.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 02.12.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.text = "NEW WORKOUT"
       label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.layer.cornerRadius = 10
        textField.borderStyle = .none
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
       return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.setTitle("SAVE", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    
    private let nameLabel = UILabel(text: "Name")
    private let dateofRepeatLabel = UILabel(text: "Date and repeat")
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let dateOfRepeatView = DateOfRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
        
    }
    private func setViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateofRepeatLabel)
        view.addSubview(dateOfRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
    }
    
    @objc private func closeButtonTapped () {
        dismiss(animated: true)
    }
    @objc private func saveButtonTapped() {
        print("saveButtonTapped")
    }
}


extension NewWorkoutViewController {
     private func setConstraints(){
        
         NSLayoutConstraint.activate([
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newWorkoutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            newWorkoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            newWorkoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
         ])
         NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
         ])
         NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
         ])
         NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38)
         ])
         NSLayoutConstraint.activate([
            dateofRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
            dateofRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateofRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
         ])
         NSLayoutConstraint.activate([
            dateOfRepeatView.topAnchor.constraint(equalTo: dateofRepeatLabel.bottomAnchor, constant: 0),
            dateOfRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateOfRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateOfRepeatView.heightAnchor.constraint(equalToConstant: 93)
         ])
         NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateOfRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
         ])
         NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
         ])
         NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 25),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.widthAnchor.constraint(equalToConstant: 345)
         ])
    }
}
