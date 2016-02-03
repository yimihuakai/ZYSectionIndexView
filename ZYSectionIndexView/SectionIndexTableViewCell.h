//
//  SectionIndexTableViewCell.h
//  ZYSectionIndexView
//
//  Created by Zhiyun on 16/2/2.
//  Copyright © 2016年 Zhiyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionIndexTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *sectionIndexButton;
@property (strong, nonatomic) NSIndexPath *indexPath;
- (IBAction)touchIndexButton:(id)sender;

@end
