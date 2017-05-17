//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Matthew Rodriguez on 5/10/17.
//  Copyright © 2017 MatthewRodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    var result = false
    
    @IBOutlet weak var label: UILabel!
   
    
    @IBAction func CrossAction(_ sender: AnyObject) {
        if (gameState[sender.tag-1]==0 && gameIsActive==true){
        
            gameState[sender.tag-1]=activePlayer
            
            if (activePlayer != 3){
                if (activePlayer==1){
                    sender.setImage(UIImage(named:"Cross.png"),for: UIControlState())
                    activePlayer=2
                }//end if
            
                else{
                    sender.setImage(UIImage(named:"Nought.png"),for: UIControlState())
                    activePlayer=1
                }//end else
        }//end if
        }
        for combinations in winningCombo
        {
            if (gameState[combinations[0]] !=  0 && gameState[combinations[0]]==gameState[combinations[1]] && gameState[combinations[1]]==gameState[combinations[2]])
            {
                gameIsActive=false
                if gameState[combinations[0]] == 1{
                    label.text = "Cross wins!"
                    //CrossWLabel.text = CrossWLabel.text! + "\(crossWin+1)"
                }
                else{
                    label.text = "Circle wins!"
                    //CircleWinLabel.text = CircleWinLabel.text! + "\(circleWin+1)"
                }
                playAgain.isHidden=false
                label.isHidden=false
                result = true
                activePlayer=3
            }
        }//end WIN loop
        
        gameIsActive=false
        
        for x in gameState
        {
            if x == 0
            {
                gameIsActive=true
                break
            }
        }//end TIE loop
        
        if gameIsActive==false
        {
            label.text = "Tie game"
            label.isHidden=false
            playAgain.isHidden=false
            result = true
            activePlayer=3
        }
        
    }
    
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgainButton(_ sender: AnyObject) {
   gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive=true
        activePlayer=1
        result=false
        
        playAgain.isHidden=true
        label.isHidden=true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

