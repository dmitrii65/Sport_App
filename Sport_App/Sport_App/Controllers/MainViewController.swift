//
//  ViewController.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 21.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    private let  userPhotoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .specialGray
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium12()
        button.setImage(UIImage(named: "+"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                             left: 20,
                                             bottom: 15,
                                             right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50,
                                              left: -40,
                                              bottom: 0,
                                              right: 0)
        button.addTarget(self, action: #selector(addWorkoutButtonTapped),
                         for: .touchUpInside)
        button.addShadowView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let userNameLabel:  UILabel =  {
        let label = UILabel ()
        label.text = "Your Name"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return  label
    }()
    
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.text = "Workout Today"
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let idWorkoutTableCell = "idWorkoutTable"
    private let calendarView = CallendarView()
    private let weatherView = WeatherView()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width/2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setContraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idWorkoutTableCell)
        weatherView.addShadowView()
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @objc private func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutViewController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen
        present(newWorkoutViewController, animated: true)
    }
}

//MATK: UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idWorkoutTableCell, for: indexPath) as? WorkoutTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}


    extension  MainViewController {
        private func setContraints(){
            
            NSLayoutConstraint.activate([
                userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
                userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
                userPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
                ])
            
            NSLayoutConstraint.activate([
                calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
                calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                calendarView.heightAnchor.constraint(equalToConstant: 70)
            ])
            NSLayoutConstraint.activate([
                userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
                userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
                userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
                ])
            NSLayoutConstraint.activate([
                addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
                addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
                addWorkoutButton.heightAnchor.constraint(equalToConstant: 80)
            ])
            NSLayoutConstraint.activate([
                weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
                weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 5),
                weatherView.heightAnchor.constraint(equalToConstant: 80)
                
                ])
            NSLayoutConstraint.activate([
                workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
                workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
            
}
}
