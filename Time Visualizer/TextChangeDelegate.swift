//
//  TextChangeDelegate.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 20/12/2021.
//

import Foundation


protocol TextChangeDelegate : class{
    
    func didChangeText(text:String, indexPath:IndexPath)
}
