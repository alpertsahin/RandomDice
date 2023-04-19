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
   
    let neonLogo = UIImage(named: "neonButton2")
    let randomButton = UIButton(type: .custom)
    
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
        
        
        let background = UIImage(named: "mainLogo2")!
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
        leftDiceIV.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width/3.5).isActive = true

        // Dikey eksen için constraint (ekranın ortası)
        leftDiceIV.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 50).isActive = true

        // Genişlik constraint'i
        leftDiceIV.widthAnchor.constraint(equalToConstant: 130).isActive = true

        // Yükseklik constraint'i
        leftDiceIV.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        
        // Yatay eksen için constraint (ekranın sağ yarısı)
        rightDiceIV.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width/3.5).isActive = true

        // Dikey eksen için constraint (ekranın ortası)
        rightDiceIV.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true

        // Genişlik constraint'i
        rightDiceIV.widthAnchor.constraint(equalToConstant: 130).isActive = true

        // Yükseklik constraint'i
        rightDiceIV.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        
        
        //buton configure
        randomButton.setTitle("ZAR AT", for: UIControl.State.normal)
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(randomButton)
        randomButton.setTitleColor(.magenta, for: .normal)
        randomButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        randomButton.setBackgroundImage(neonLogo, for: .normal)
        randomButton.layer.cornerRadius = 100
        
        
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
        let duration = Double(Double(arc4random_uniform(UInt32(0.05))) + 0.05)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.leftDiceIV.image = self.items[firstDice]
            self.rightDiceIV.image = self.items[secondDice]
            
        }
        
        let firstDice1 = Int(arc4random_uniform(6))
        let secondDice1 = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false

        let duration1 = Double(Double(arc4random_uniform(UInt32(0.2))) + 0.2) //

        DispatchQueue.main.asyncAfter(deadline: .now() + duration1) {
            self.leftDiceIV.image = self.items[firstDice1]
            self.rightDiceIV.image = self.items[secondDice1]
            
        }
        
        let firstDice2 = Int(arc4random_uniform(6))
        let secondDice2 = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false

        let duration2 = Double(Double(arc4random_uniform(UInt32(0.4))) + 0.4)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration2) {
            self.leftDiceIV.image = self.items[firstDice2]
            self.rightDiceIV.image = self.items[secondDice2]
            
        }
        
        let firstDice3 = Int(arc4random_uniform(6))
        let secondDice3 = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false
        
        let duration3 = Double(Double(arc4random_uniform(UInt32(0.8))) + 0.8)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration3) {
  
            self.leftDiceIV.image = self.items[firstDice3]
            self.rightDiceIV.image = self.items[secondDice3]
           
           
        }
        
        
        let firstDice4 = Int(arc4random_uniform(6))
        let secondDice4 = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false

        let duration4 = Double(Double(arc4random_uniform(UInt32(1.3))) + 1.3)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration4) {
            self.leftDiceIV.image = self.items[firstDice4]
            self.rightDiceIV.image = self.items[secondDice4]
            
        }
        
        let firstDice5 = Int(arc4random_uniform(6))
        let secondDice5 = Int(arc4random_uniform(6))
        randomButton.setTitle("BEKLE...", for: .normal)
        randomButton.isEnabled = false

        let duration5 = Double(Double(arc4random_uniform(UInt32(1.7))) + 1.7)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration5) {
            self.randomButton.setTitle("ZAR AT", for: .normal)
            self.leftDiceIV.image = self.items[firstDice5]
            self.rightDiceIV.image = self.items[secondDice5]
            self.randomButton.isEnabled = true
            
        }
        print(firstDice5)
        print(secondDice5)
    }


}

