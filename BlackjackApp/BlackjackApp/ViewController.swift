//
//  ViewController.swift
//  BlackjackApp
//
//  Created by System Administrator on 5/13/18.
//  Copyright © 2018 Universidad de Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HouseCard1: CardView!
    @IBOutlet weak var HouseCard2: CardView!
    @IBOutlet weak var HouseCard3: CardView!
    @IBOutlet weak var HouseCard4: CardView!
    @IBOutlet weak var PlayerCard1: CardView!
    @IBOutlet weak var PlayerCard2: CardView!
    @IBOutlet weak var PlayerCard3: CardView!
    @IBOutlet weak var PlayerCard4: CardView!
    
    // Game flags...
    private var _gameIsOver: Bool = true;
    private var _isPlayerTurn: Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PlayerCard1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "TapOnPlayerCard1:"));
        PlayerCard2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "TapOnPlayerCard2:"));
        PlayerCard3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "TapOnPlayerCard3:"));
        PlayerCard4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "TapOnPlayerCard4:"));
        
        Blackjack();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Initializes game
    func Blackjack() {
        _gameIsOver = false;
        
        let deck = Deck();
        
        HouseCard1.CardObject = deck.DrawCard();
        HouseCard1.RevealCard();
        HouseCard2.CardObject = deck.DrawCard();
        HouseCard2.RevealCard();
        HouseCard3.CardObject = deck.DrawCard();
        HouseCard3.HideCard();
        HouseCard4.CardObject = deck.DrawCard();
        HouseCard4.HideCard();
        PlayerCard1.CardObject = deck.DrawCard();
        PlayerCard1.RevealCard();
        PlayerCard2.CardObject = deck.DrawCard();
        PlayerCard2.RevealCard();
        PlayerCard3.CardObject = deck.DrawCard();
        PlayerCard3.HideCard();
        PlayerCard4.CardObject = deck.DrawCard();
        PlayerCard4.HideCard();
    }
    
    // Analyzes the state of the game and makes the house play or ends the game
    func ProcessPlay() {
        var houseTotal = GetHouseTotal();
        var playerTotal = GetPlayerTotal();
        
        // 1. Check for Blackjack
        if houseTotal == 21 {
            _gameIsOver = true
            
            if playerTotal == 21 {
                // Print tie
            } else {
                // Print house wins
            }
            
            return;
        } else if playerTotal == 21 {
            _gameIsOver = true
            
            if houseTotal == 21 {
                // Print tie
            } else {
                // Print player wins
            }
            
            return;
        }
        
        // 2. Check for busting
        
    }
    
    // Helpers...
    func GetHouseTotal() -> Int {
        var total = 0
        var numberOfAces = 0;
        
        if HouseCard1.CardObject!.IsAce {
            numberOfAces += 1;
        } else {
            total += HouseCard1.CardObject!.Weight;
        }
        
        if HouseCard2.CardObject!.IsAce {
            numberOfAces += 1;
        } else {
            total += HouseCard2.CardObject!.Weight;
        }
        
        if HouseCard3.CardIsRevealed {
            if HouseCard3.CardObject!.IsAce {
                numberOfAces += 1;
            } else {
                total += HouseCard3.CardObject!.Weight;
            }
        }
        
        if HouseCard4.CardIsRevealed {
            if HouseCard4.CardObject!.IsAce {
                numberOfAces += 1;
            } else {
                total += HouseCard4.CardObject!.Weight;
            }
        }
        
        if numberOfAces > 0 {
            return total + GetOptimalAcesContribution(total, numberOfAces);
        } else {
            return total;
        }
    }
    
    func GetPlayerTotal() -> Int {
        var total = 0
        var numberOfAces = 0;
        
        if PlayerCard1.CardObject!.IsAce {
            numberOfAces += 1;
        } else {
            total += PlayerCard1.CardObject!.Weight;
        }
        
        if PlayerCard2.CardObject!.IsAce {
            numberOfAces += 1;
        } else {
            total += PlayerCard2.CardObject!.Weight;
        }
        
        if PlayerCard3.CardIsRevealed {
            if PlayerCard3.CardObject!.IsAce {
                numberOfAces += 1;
            } else {
                total += PlayerCard3.CardObject!.Weight;
            }
        }
        
        if PlayerCard4.CardIsRevealed {
            if PlayerCard4.CardObject!.IsAce {
                numberOfAces += 1;
            } else {
                total += PlayerCard4.CardObject!.Weight;
            }
        }
        
        if numberOfAces > 0 {
            return total + GetOptimalAcesContribution(total, numberOfAces);
        } else {
            return total;
        }
    }
    
    func GetOptimalAcesContribution(total: Int, _ numberOfAces: Int) -> Int {
        // TODO
        
        return 0;
    }
    
    // Game actions...
    func TapOnPlayerCard1(sender: UITapGestureRecognizer) {
        // Nothing
    }
    
    func TapOnPlayerCard2(sender: UITapGestureRecognizer) {
        // Nothing
    }
    
    func TapOnPlayerCard3(sender: UITapGestureRecognizer) {
        if _gameIsOver {
            return;
        }
    }
    
    func TapOnPlayerCard4(sender: UITapGestureRecognizer) {
        if _gameIsOver {
            return;
        }
    }
    
    @IBAction func TapOnStandButton(sender: UIButton) {
        if _gameIsOver {
            return;
        }
    }
    
    @IBAction func TapOnResetButton(sender: UIButton) {
        Blackjack();
    }
        
}

