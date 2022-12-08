//
//  ImagePreviewViewController.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import UIKit

final class ImagePreviewViewController: UIViewController {

    @IBOutlet private weak var blurRatioSlider: UISlider!
    @IBOutlet private weak var imageModeSegmentControl: UISegmentedControl!
    @IBOutlet private weak var imageView: UrlImageView!
    private var imageEndpoint: PicsumPhotoEndpoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurRatioSlider.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // call here because size of imageView is incorrect before viewDidAppear
        refreshImage()
    }
    
    func set(imageEndpoint: PicsumPhotoEndpoint) {
        self.imageEndpoint = imageEndpoint
    }
    
    
    @IBAction private func onBlurRatioChanged(_ sender: UISlider) {
        refreshImage()
    }
    
    
    @IBAction private func onImageModeChanged(_ sender: UISegmentedControl) {
        refreshImage()
    }
    
    private func refreshImage() {
        switch imageModeSegmentControl.selectedSegmentIndex {
        case 0:
            imageEndpoint?.imageMode = .normal
            
        case 1:
            let blurValue = blurRatioSlider.value
            imageEndpoint?.imageMode = .blurred(intense: UInt8(blurValue))
            
        case 2:
            imageEndpoint?.imageMode = .grayscaled
            
        default:
            break
        }
        
        blurRatioSlider.isHidden = imageModeSegmentControl.selectedSegmentIndex != 1
        
        imageEndpoint?.size = imageView.frame.size // to load an image with correct size
        guard let url = imageEndpoint?.url else { return }
        imageView.set(imageUrl: url)
    }
    
}
