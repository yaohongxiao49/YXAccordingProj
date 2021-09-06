//
//  YXPhotoVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/9/1.
//

import UIKit
import AVFoundation
import Photos

class YXPhotoVC: YXBaseVC, AVCapturePhotoCaptureDelegate {
    
    lazy var session: AVCaptureSession = {
        
        let session = AVCaptureSession.init()
        session.canSetSessionPreset(AVCaptureSession.Preset.high)
        return session
    }()
    
    lazy var device: AVCaptureDevice = {
        
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        return device!
    }()
    
    lazy var input: AVCaptureDeviceInput = {
        
        let input = try? AVCaptureDeviceInput.init(device: self.device)
        return input!
    }()
    
    lazy var imgOutput: AVCapturePhotoOutput = {
        
        let imgOutput = AVCapturePhotoOutput.init()
        return imgOutput
    }()
    
    lazy var outputSettings: AVCapturePhotoSettings = {
        
        let outputSettings = AVCapturePhotoSettings.init(format: [AVVideoCodecKey : AVVideoCodecType.jpeg]);
        outputSettings.isHighResolutionPhotoEnabled = true
        return outputSettings
    }()
    
    lazy var preview: AVCaptureVideoPreviewLayer = {
        
        let preview = AVCaptureVideoPreviewLayer.init(session: self.session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = self.view.bounds
        return preview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.navigationView.titleLab.text = "工具"
        
        self.initView()
    }

    //MARK:- AVCapturePhotoCaptureDelegate
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        let cgImg: CGImage = photo.cgImageRepresentation() as! CGImage
        let img: UIImage = UIImage.init(cgImage: cgImg)
    }
    
    //MARK:- 初始化视图
    func initView() {
        
        if self.session.canAddInput(self.input) {
            self.session.addInput(self.input)
        }
        if self.session.canAddOutput(self.imgOutput) {
            self.session.addOutput(self.imgOutput)
        }
        self.view.layer.insertSublayer(self.preview, at: 0)
        self.session.startRunning()
    }

}
