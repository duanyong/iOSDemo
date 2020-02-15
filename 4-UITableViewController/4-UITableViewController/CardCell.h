//
//  CardCell.h
//  4-UITableViewController
//
//  Created by duanyong on 2020/2/13.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
@property (weak, nonatomic) IBOutlet UIButton *favBtn;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;


@end

NS_ASSUME_NONNULL_END
