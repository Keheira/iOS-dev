//
//  ViewController.swift
//  Filter
//
//  Created by Keheira Henderson on 11/14/15.
//  Copyright © 2015 Keheira Henderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var filteredImage: UIImage?
    let image = UIImage(named: "scenery")!
    var photoIntensity: Int = 0;
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    
    @IBOutlet var secondaryView: UIView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var editMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var intensitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        editMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        editMenu.translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
//        tap.delegate = self
//        imageView.addGesture(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        if imageView.image == filteredImage{
            imageView.image = image
        } else{
            imageView.image = filteredImage
        }
    }
    
//    func touchesBegan(withEvent event: UIEvent) {
//        if imageView.image == filteredImage{
//            imageView.image = image
//        } else{
//            imageView.image = filteredImage
//        }
//    }
//    
//    func touchesEnded(withEvent event: UIEvent) {
//        if imageView.image == filteredImage{
//            imageView.image = image
//        } else{
//            imageView.image = filteredImage
//        }
//    }
    
    @IBAction func onNewPhoto(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func onFilter(sender: UIButton) {
        if sender.selected{
            hideSecondaryMenu()
            sender.selected = false
        }else{
            hideEditMenu()
            editButton.selected = false
            showSecondaryMenu()
            sender.selected = true
        }
        
    }
    
    @IBAction func goRed(sender: UIButton) {
        let rgbaImage = RGBAImage(image: image)!
        let avgRed = 107
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.red) < avgRed){
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        imageView.image = filteredImage
        compareButton.enabled = true
        editButton.enabled = true
    }
    
    @IBAction func goGreen(sender: UIButton) {
        let rgbaImage = RGBAImage(image: image)!
        let avgGreen = 107
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let greenDelta = Int(pixel.green) - avgGreen
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.green) < avgGreen){
                    modifier = 1
                }
                
                pixel.green = UInt8(max(min(255, Int(round(Double(avgGreen) + modifier * Double(greenDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        imageView.image = filteredImage
        compareButton.enabled = true
        editButton.enabled = true
    }
    
    @IBAction func goBlue(sender: UIButton) {
        let rgbaImage = RGBAImage(image: image)!
        let avgBlue = 107
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let blueDelta = Int(pixel.blue) - avgBlue
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.blue) < avgBlue){
                    modifier = 1
                }
                
                pixel.blue = UInt8(max(min(255, Int(round(Double(avgBlue) + modifier * Double(blueDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        imageView.image = filteredImage
        compareButton.enabled = true
        editButton.enabled = true
    }
    
    @IBAction func goYellow(sender: UIButton) {
        let rgbaImage = RGBAImage(image: image)!
        let avgYellow = 107
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let yellowDelta = Int(pixel.yellow) - avgYellow
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.yellow) < avgYellow){
                    modifier = 1
                }
                
                pixel.yellow = UInt8(max(min(255, Int(round(Double(avgYellow) + modifier * Double(yellowDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        imageView.image = filteredImage
        compareButton.enabled = true
        editButton.enabled = true
    }
    
    @IBAction func goPurple(sender: UIButton) {
        let rgbaImage = RGBAImage(image: image)!
        let avgPurple = 107
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let purpleDelta = Int(pixel.red) - avgPurple
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.purple) < avgPurple){
                    modifier = 1
                }
                
                pixel.purple = UInt8(max(min(255, Int(round(Double(avgPurple) + modifier * Double(purpleDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        imageView.image = filteredImage
        compareButton.enabled = true
        editButton.enabled = true
    }
    
    @IBAction func onEdit(sender: UIButton) {
        if sender.selected{
            hideEditMenu()
            sender.selected = false
        } else {
            hideSecondaryMenu()
            filterButton.selected = false
            showEditMenu()
            sender.selected = true
        }
    }
    
    @IBAction func onSlide(sender: UISlider) {
        photoIntensity = Int(sender.value)
        print(photoIntensity)
    }
    @IBAction func onCompare(sender: UIButton) {
        if sender.selected{
            imageView.image = filteredImage
            compareButton.selected = false
        }else{
            imageView.image = image
            compareButton.selected = true
        }
    }
    
    
    @IBAction func onShare(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        presentViewController(activityController, animated: true, completion: nil)
    }
    
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showSecondaryMenu(){
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4){
            self.secondaryMenu.alpha = 1.0
        }
    }
    
    func hideSecondaryMenu(){
        UIView.animateWithDuration(0.4, animations: { self.secondaryMenu.alpha = 0 }){ completed in
            if completed == true {
                self.secondaryMenu.removeFromSuperview()
            }
        }
    }
    
    func picSwitch(){
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4){
            self.secondaryMenu.alpha = 1.0
        }
    }
    
    func showEditMenu(){
        view.addSubview(editMenu)
        
        let bottomConstraint = editMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = editMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = editMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = editMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.editMenu.alpha = 0
        UIView.animateWithDuration(0.4){
            self.editMenu.alpha = 1.0
        }
    }
    
    func hideEditMenu(){
        UIView.animateWithDuration(0.4, animations: { self.editMenu.alpha = 0 }){ completed in
            if completed == true {
                self.editMenu.removeFromSuperview()
            }
        }
    }
}

