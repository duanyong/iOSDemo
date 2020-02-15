//
//  ViewController.m
//  14-UIAlert
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController {

}

@synthesize uiAlertCtl = uiAlertCtl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void) viewWillAppear:(BOOL) animated {
      [super viewWillAppear: animated];
    
    NSLog(@"viewWillAppear");
}

- (void) viewDidAppear: (BOOL) animated {
    [super viewDidAppear: animated];
    
    NSLog(@"viewDidAppear");
    
    uiAlertCtl = [UIAlertController alertControllerWithTitle: nil
                                                     message: nil
                                              preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle: @"Take Photo"
                                                     style: UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction * _Nonnull action) {
        [self showCamera];
    }];
    
    UIAlertAction *library = [UIAlertAction actionWithTitle: @"Choose Photo"
                                                      style: UIAlertActionStyleDefault
                                                    handler: ^(UIAlertAction * _Nonnull action) {
        [self showPhotoLibrary];
    }];
    
    UIAlertAction *cancel =[UIAlertAction actionWithTitle: @"Cancel"
                                                    style: UIAlertActionStyleCancel
                                                  handler: nil];

    [uiAlertCtl addAction: camera];
    [uiAlertCtl addAction: library];
    [uiAlertCtl addAction: cancel];


    [self presentViewController: uiAlertCtl animated: YES completion: ^(void) {
        // 隔一会就消失
//        [self dismissViewControllerAnimated: YES completion: ^{}];
    }];
}


- (void) showCamera {
    // Camera is not available on simulators
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *uiAlertCtl = [UIAlertController alertControllerWithTitle: @"Error"
                                            message: @"Camera not available."
                                     preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"Cancel"
                                                         style: UIAlertActionStyleCancel
                                                       handler: ^(UIAlertAction * _Nonnull action) {
            [uiAlertCtl dismissViewControllerAnimated: YES completion: nil];
        }];
        
        [uiAlertCtl addAction: cancel];
        
        [self presentViewController: uiAlertCtl animated: YES completion: nil];
        

        return ;
    }
    
    NSLog(@"Camera not available.");
    
}


- (void) showPhotoLibrary {
    // No need to check if SourceType is available. It always is.
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertController *uiAlertCtl = [UIAlertController alertControllerWithTitle: @"Error"
                                            message: @"Photo Libary not available."
                                     preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"Cancel"
                                                         style: UIAlertActionStyleCancel
                                                       handler: ^(UIAlertAction * _Nonnull action) {
            [uiAlertCtl dismissViewControllerAnimated: YES completion: nil];
        }];
        
        [uiAlertCtl addAction: cancel];
        
        [self presentViewController: uiAlertCtl animated: YES completion: nil];
        
        return ;
    }
    
    UIImagePickerController *uiImagePickerCtl = [[UIImagePickerController alloc] init];
    
    [uiImagePickerCtl setSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
    [uiImagePickerCtl setVideoMaximumDuration: 20.0];
    [uiImagePickerCtl setVideoQuality: UIImagePickerControllerQualityTypeMedium];
    [uiImagePickerCtl setMediaTypes: [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary]];
    
    [uiImagePickerCtl setDelegate: self];
    [uiImagePickerCtl setEditing: YES animated: YES];
    
    [self presentViewController: uiImagePickerCtl animated:YES completion:NULL];
}

// 选择图片成功调用此方法
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary<NSString *, id> *) info {
    // dismiss UIImagePickerController
    [picker dismissViewControllerAnimated: YES completion: nil];
    
    NSURL *videoURL = [info objectForKey: UIImagePickerControllerMediaURL];

    if (videoURL != nil) {
        if (@available(iOS 13.0, *)) {
            NSString *fileName = [videoURL lastPathComponent];
            NSURL *destination = [NSURL fileURLWithPath: [NSTemporaryDirectory() stringByAppendingPathComponent: fileName]];

            if ([[NSFileManager defaultManager] isReadableFileAtPath: [videoURL path]]) {
              NSError *error;
              if (![[videoURL path] isEqualToString: [destination path]]) {
                    [[NSFileManager defaultManager] copyItemAtURL: videoURL toURL: destination error: &error];

                    if (error) {
//                        self.result([FlutterError errorWithCode:@"flutter_image_picker_copy_video_error"
//                                                      message:@"Could not cache the video file."
//                                                      details:nil]);
//                        self.result = nil;
                        return;
                    }
              }
                
              videoURL = destination;
            }
        }
    } else {
        UIImage *image = [info objectForKey: UIImagePickerControllerEditedImage];
        if (image == nil) {
            image = [info objectForKey: UIImagePickerControllerOriginalImage];
        }
        
//        UIImageView uiImageView = [[UIImageView alloc] initWithImage: image];
//        [uiImageView setFrame: CGRectMake(0, 0, 300 , 400)];
//        UIImageView acc

        NSLog(@"%@", image);

//        NSNumber *maxWidth = [_arguments objectForKey:@"maxWidth"];
//        NSNumber *maxHeight = [_arguments objectForKey:@"maxHeight"];
//        NSNumber *imageQuality = [_arguments objectForKey:@"imageQuality"];
//
//        if (![imageQuality isKindOfClass:[NSNumber class]]) {
//            imageQuality = @1;
//        } else if (imageQuality.intValue < 0 || imageQuality.intValue > 100) {
//            imageQuality = [NSNumber numberWithInt: 1];
//        } else {
//            imageQuality = @([imageQuality floatValue] / 100);
//        }
//
//        if (maxWidth != (id) [NSNull null] || maxHeight != (id) [NSNull null]) {
//            image = [FLTImagePickerImageUtil scaledImage:image maxWidth:maxWidth maxHeight:maxHeight];
//        }
//
//        PHAsset *originalAsset = [FLTImagePickerPhotoAssetUtil getAssetFromImagePickerInfo:info];
//        if (!originalAsset) {
//          // Image picked without an original asset (e.g. User took a photo directly)
//          [self saveImageWithPickerInfo:info image:image imageQuality:imageQuality];
//        } else {
//          __weak typeof(self) weakSelf = self;
//          [[PHImageManager defaultManager]
//              requestImageDataForAsset: originalAsset
//                               options: nil
//                         resultHandler: ^(NSData *_Nullable imageData, NSString *_Nullable dataUTI,
//                                         UIImageOrientation orientation, NSDictionary *_Nullable info) {
//                           // maxWidth and maxHeight are used only for GIF images.
//                           [weakSelf saveImageWithOriginalImageData: imageData
//                                                              image: image
//                                                           maxWidth: maxWidth
//                                                          maxHeight: maxHeight
//                                                       imageQuality: imageQuality];
//                         }];
//        }
    }
}


// 取消图片选择调用此方法
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    // dismiss UIImagePickerController
    [self dismissViewControllerAnimated: YES completion: nil];
    
    picker = nil;
}

@end
