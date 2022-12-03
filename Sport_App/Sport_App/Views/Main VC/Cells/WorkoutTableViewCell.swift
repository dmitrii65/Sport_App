//
//  WorkoutTableViewCell.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 25.11.2022.
//

import UIKit


class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let workoutBackgroundImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBackground
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let imageWorkoutView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.image = UIImage(named: "powerCell")?.withRenderingMode(.alwaysTemplate)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium22()
        label.textColor = .specialBlack
        label.text = "Pull Ups"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutResultLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.text = "Reps: 10"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     
    private let workoutSetsLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium16()
        label.text = "Sets: 2"
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.addShadowView()
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.addShadowView()
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self,
                         action: #selector(startButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var labelStackView = UIStackView()
        
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        backgroundColor = .clear
        selectionStyle = .none
            
        addSubview(backgroundCell)
        addSubview(workoutBackgroundImageView)
        addSubview(imageWorkoutView)
        addSubview(workoutNameLabel)
        
        
        labelStackView = UIStackView(arrangedSubviews: [workoutSetsLabel, workoutResultLabel],
                                     axis: .horizontal , spacing: 10)
        addSubview(labelStackView)
        contentView.addSubview(startButton)
        
    }
                                     
    
    
    @objc private func startButtonTapped() {
        print("startButtonTapped")
    }
    
}
extension WorkoutTableViewCell{
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            workoutBackgroundImageView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutBackgroundImageView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            imageWorkoutView.topAnchor.constraint(equalTo: workoutBackgroundImageView.topAnchor, constant: 10),
            imageWorkoutView.leadingAnchor.constraint(equalTo: workoutBackgroundImageView.leadingAnchor, constant: 10),
            imageWorkoutView.trailingAnchor.constraint(equalTo: workoutBackgroundImageView.trailingAnchor, constant: -10),
            imageWorkoutView.bottomAnchor.constraint(equalTo: workoutBackgroundImageView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo:workoutBackgroundImageView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
            labelStackView.leadingAnchor.constraint(equalTo: workoutBackgroundImageView.trailingAnchor, constant: 10),
            labelStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: -3),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundImageView.trailingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 30),
            //startButton.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: 0)
        
        ])
    }
}
