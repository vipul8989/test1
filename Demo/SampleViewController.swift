//
//  ViewController.swift
//  SwiftyPickerPopover
//
//  Created by Yuta Hoshino on 2016/09/14.
//  Copyright © 2016 Yuta Hoshino. All rights reserved.
//

import UIKit
import SwiftyPickerPopover

class SampleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // for keeping selectedRow
    private var selectedRow: Int = 0
    
    @IBAction func tappedStringPickerButton(_ sender: UIButton) {
        /// Replace a string with the string to be display.
        let displayStringFor:((String?)->String?)? = { string in
            if let s = string {
                switch(s){
                case "value 1":
                    return "😊"
                case "value 2":
                    return "😏"
                case "value 3":
                    return "😓"
                default:
                    return s
                }
            }
            return nil
        }
        
        /// Create StringPickerPopover:
       
    }
    
    @IBAction func didTapStringPickerWithImageButton(_ sender: UIButton) {
        /// StringPickerPopover with image:
        
    }
    
    @IBAction func didTapStringPickerClearableButton(_ sender: UIButton) {
        /// StringPickerPopover Clearable:
       
    }
    
    @IBAction func didTapStringPickerWithTextField(_ sender: UITextField) {
               
    }
    
    @IBAction func tappendDatePickerButton(_ sender: UIButton) {
        
        var dateComponent = DateComponents()
        dateComponent.year = -50

        let pastDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        
        DatePickerPopover(title: "DatePicker")
            .setDateMode(.date)
        .setMinimumDate(pastDate!)
        .setMaximumDate(Date())
            .setSelectedDate(Date())
            .setValueChange(action: { _, selectedDate in
                print("current date \(selectedDate)")
            })
            .setDoneButton(action: { popover, selectedDate in print("selectedDate \(selectedDate)")})
            .setCancelButton(action: { _, _ in print("cancel")})
            .appear(originView: sender, baseViewController: self)
    }
    
    @IBAction func tappendDatePickerCanClearButton(_ sender: UIButton) {
        /// DatePickerPopover appears:
        let p = DatePickerPopover(title: "Clearable DatePicker")
            .setLocale(identifier: "en_GB") //en_GB is dd-MM-YYYY. en_US is MM-dd-YYYY. They are both in English.
            .setValueChange(action: { _, selectedDate in
                print("current date \(selectedDate)")
            })
            .setDoneButton(action: { popover, selectedDate in print("selectedDate \(selectedDate)")} )
            .setCancelButton(action: { _, _ in print("cancel")})
            .setClearButton(action: { popover, selectedDate in
                print("clear")
                //Rewind
                popover.setSelectedDate(Date()).reload()
                //Instead, hide it.
//                popover.disappear()
            })
        p.appear(originView: sender, baseViewController: self)
        p.disappearAutomatically(after: 3.0)
    }
    
    @IBAction func tappendDatePickerTime5MinIntButton(_ sender: UIButton) {
        // DatePickerPopover appears:
        DatePickerPopover(title: "DatePicker .time 5minInt.")
            .setDateMode(.time)
            .setMinuteInterval(5)
            .setPermittedArrowDirections(.down)
            .setValueChange(action: { _, selectedDate in
                print("current date \(selectedDate)")
            })
            .setDoneButton(action: { popover, selectedDate in print("selectedDate \(selectedDate)")} )
            .setCancelButton(action: { _, _ in print("cancel")})
            .appear(originView: sender, baseViewController: self)
    }

    @IBAction func countdownButton(_ sender: UIButton) {
        // CountdownPickerPopover appears:
        
    }
    
    @IBAction func columnsString(_ sender: UIButton) {
        //ColumnStringPickerPopover appears.
        
    }

    //CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let theCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let label = theCell.contentView.viewWithTag(1) as! UILabel
        label.text = (indexPath as NSIndexPath).row.description
        
        return theCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let theCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

