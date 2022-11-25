//
//  WeatherView.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 22.11.2022.
//

import UIKit


class WeatherView: UIView {
    
    private let imageWeatherSun: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let weatherlabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.font = .robotoMedium14()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let discribeWeatherLable: UILabel = {
        let label = UILabel()
        label.text = "Nice weather to work out outside"
        label.numberOfLines = 2
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView () {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(discribeWeatherLable)
        addSubview(weatherlabel)
        addSubview(imageWeatherSun)
        
        
    }
}
    extension WeatherView {
        
        private func setConstraints () {
            NSLayoutConstraint.activate([
                imageWeatherSun.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                imageWeatherSun.centerYAnchor.constraint(equalTo: centerYAnchor),
                imageWeatherSun.widthAnchor.constraint(equalToConstant: 60),
                imageWeatherSun.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            NSLayoutConstraint.activate([
                weatherlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                weatherlabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                weatherlabel.trailingAnchor.constraint(equalTo: imageWeatherSun.leadingAnchor, constant: -10),
                weatherlabel.heightAnchor.constraint(equalToConstant: 20)
            ])
            NSLayoutConstraint.activate([
                discribeWeatherLable.topAnchor.constraint(equalTo: weatherlabel.bottomAnchor, constant: 0),
                discribeWeatherLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                discribeWeatherLable.trailingAnchor.constraint(equalTo: imageWeatherSun.leadingAnchor, constant: -10),
                discribeWeatherLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -5)
            ])
        }
    }

