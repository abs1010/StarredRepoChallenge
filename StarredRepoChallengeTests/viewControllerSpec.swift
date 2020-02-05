//
//  viewControllerSpec.swift
//  StarredRepoChallengeTests
//
//  Created by Alan Silva on 02/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import StarredRepoChallenge

class viewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("ViewController Layout"){
            
            var sut : ViewController!
            
            context("When instantiates the ViewController") {
                
                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    //sut = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
                }
                
                it("Espero que o layout seja") {
                    //expect(sut).to(recordSnapshot())
                    expect(sut).to(haveValidSnapshot())
                }
                
                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    sut = storyboard.instantiateViewController(identifier: "ViewController")
                    //WindowHelper.showInTestWindow(viewController: sut)
                }
                
                it("Espero que o layout da tableView seja"){
                    //expect(sut.tableView).to(recordSnapshot())
                    //expect(sut.tableView).to(haveValidSnapshot())
                }
                
            }
            
        }
        
    }
    
}
