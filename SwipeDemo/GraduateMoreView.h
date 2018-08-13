//
//  GraduateMoreView.h
//
//
//  Created by A.Jester on 12/04/2018.
//  Copyright © 2018 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraduateMoreView : UIView
@property (nonatomic, copy) dispatch_block_t sureBlock;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *describeLb;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
