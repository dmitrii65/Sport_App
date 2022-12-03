//
//  StaticticsViewController.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 30.11.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    private let  nameStatisticsLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.text = "STATISTICS"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesNameLabel = UILabel(text: "Exercises")
    
    
    private lazy var segmentelControl: UISegmentedControl = {
        let segmentelControl = UISegmentedControl(items: ["Week", "Month"])
        segmentelControl.selectedSegmentIndex = 0
        segmentelControl.backgroundColor = .specialGreen
        segmentelControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentelControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        segmentelControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,NSAttributedString.Key.foregroundColor : UIColor.specialGray], for: .selected)
        segmentelControl.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
        segmentelControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentelControl
    }()
    
    private let tableView: UITableView =  {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    let idStatisticsTableViewCell = "idStatisticsTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setDelegates()
        
    }
    
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        view.addSubview(nameStatisticsLabel)
        view.addSubview(segmentelControl)
        view.addSubview(exercisesNameLabel)
        view.addSubview(tableView)
        
        
        tableView.register(StatisticTableViewCell.self, forCellReuseIdentifier: idStatisticsTableViewCell)
    }
    
    private func setDelegates() {
       tableView.dataSource = self
       tableView.delegate = self
    }
    
    @objc private func segmentChange(){
        print("segmentChange")
    }
    
    
}
   

extension StatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idStatisticsTableViewCell, for: indexPath) as? StatisticTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
extension StatisticsViewController:UITableViewDelegate {
    func tableView(_tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}



    extension StatisticsViewController {
         private func setConstraints(){
            
             NSLayoutConstraint.activate([
                nameStatisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameStatisticsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                nameStatisticsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                nameStatisticsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
             ])
             NSLayoutConstraint.activate([
                exercisesNameLabel.topAnchor.constraint(equalTo: segmentelControl.bottomAnchor, constant: 10),
                exercisesNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                exercisesNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
             ])
             NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: exercisesNameLabel.bottomAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
             ])
             NSLayoutConstraint.activate([
                segmentelControl.topAnchor.constraint(equalTo: nameStatisticsLabel.topAnchor, constant: 80),
                segmentelControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                segmentelControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
             
             
             ])
             
        }
        
    }

