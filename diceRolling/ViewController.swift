//
//  ViewController.swift
//  diceRolling
//
//  Created by Alper Şahin on 16.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let mainLogo = UIImage(named: "mainLogo")
    let mainLogoIV = UIImageView()
    let randomButton = UIButton()
    
    
    var leftDice = UIImage(named: "dice1")
    var leftDiceIV = UIImageView()
    
    var rightDice = UIImage(named: "dice1")
    var rightDiceIV = UIImageView()
    
    let items = [UIImage(named: "dice1"),UIImage(named: "dice2"),UIImage(named: "dice3"),UIImage(named: "dice4"),UIImage(named: "dice5"),UIImage(named: "dice6")]


    
    override func viewDidLoad() {
        super.viewDidLoad()


        configure()

    }

    func configure(){
        
        
        let background = UIImage(named: "newbackground")!
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = background
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
    
        
        
        leftDiceIV.image = leftDice
        leftDiceIV.translatesAutoresizingMaskIntoConstraints = false
        rightDiceIV.image = rightDice
        rightDiceIV.translatesAutoresizingMaskIntoConstraints = false
        mainLogoIV.image = mainLogo
        mainLogoIV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLogoIV)

        view.addSubview(leftDiceIV)
        view.addSubview(rightDiceIV)
        
        // Yatay eksen için constraint (ekranın sol yarısı)
        leftDiceIV.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width/4).isActive = true

        // Dikey eksen için constraint (ekranın ortası)
        leftDiceIV.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 50).isActive = true

        // Genişlik constraint'i
        leftDiceIV.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // Yükseklik constraint'i
        leftDiceIV.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        // Yatay eksen için constraint (ekranın sağ yarısı)
        rightDiceIV.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width/4).isActive = true

        // Dikey eksen için constraint (ekranın ortası)
        rightDiceIV.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true

        // Genişlik constraint'i
        rightDiceIV.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // Yükseklik constraint'i
        rightDiceIV.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        //buton configure
        randomButton.setTitle("ZAR AT", for: UIControl.State.normal)
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(randomButton)
        randomButton.setTitleColor(.white, for: UIControl.State.normal)
        randomButton.backgroundColor = .black
        randomButton.layer.cornerRadius = 20
        
        // Yatay eksen için constraint (x koordinatı ortası)
        randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        // Dikey eksen için constraint (herhangi bir yere hizalanabilir)
        randomButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true



        // Yükseklik constraint'i
        randomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // Sol imageView constraint'i
        randomButton.leadingAnchor.constraint(equalTo: leftDiceIV.centerXAnchor).isActive = true

        // Sağ imageView constraint'i
        randomButton.trailingAnchor.constraint(equalTo: rightDiceIV.centerXAnchor).isActive = true
        
        // Üst kenar constraint'i
        randomButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 180).isActive = true
        
        randomButton.addTarget(self, action: #selector(zarAtButton), for: .touchUpInside)
     
        
        mainLogoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLogoIV.bottomAnchor.constraint(equalTo: rightDiceIV.topAnchor, constant: -20).isActive = true
        mainLogoIV.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        mainLogoIV.topAnchor.constraint(equalTo: view.topAnchor,constant: 60).isActive = true

    }
    
    
    @objc func zarAtButton() {
            
        let firstDice = Int(arc4random_uniform(6))
        let secondDice = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false
        let duration = Double(arc4random_uniform(2) + 2) // 3-6 saniye arasında rastgele bir süre belirle

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.randomButton.setTitle("Zar At", for: .normal)
            self.leftDiceIV.image = self.items[firstDice]
            self.rightDiceIV.image = self.items[secondDice]
            self.randomButton.isEnabled = true
        }
        
        print(firstDice)
        print(secondDice)
    }
    
    /* @objc func zarAtButton() {
        
        let firstDice = Int(arc4random_uniform(6))
        let secondDice = Int(arc4random_uniform(6))
        
        randomButton.isEnabled = false
        
        let duration = Double(arc4random_uniform(4) + 3) // 3-6 saniye arasında rastgele bir süre belirle

                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    self.randomButton.isEnabled = true // Süre dolduğunda butonu etkinleştir
                }
        
        
   /*    let duration = Double(arc4random_uniform(4) + 3) // 3-6 saniye arası rastgele bir süre belirliyoruz
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.leftDiceIV.image = self.items[firstDice]
            self.rightDiceIV.image = self.items[secondDice]
            self.randomButton.isEnabled = true
            
        } */
    
       
        print(firstDice)
        print(secondDice)
    } */
    
}

