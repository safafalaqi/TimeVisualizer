//
//  KeywordTableViewControllerDelegate.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 19/12/2021.
//

import Foundation


protocol KeywordViewControllerDelegate : class{
    
    func keywordAdded(by controller:KeywordViewController, keyword k: String , at indexPath:NSIndexPath?)
}
