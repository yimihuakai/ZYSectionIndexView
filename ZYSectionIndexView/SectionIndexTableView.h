//
//  SectionIndexTableView.h
//  ZYSectionIndexView
//
//  Created by Zhiyun on 16/2/2.
//  Copyright © 2016年 Zhiyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionIndexButtonDelegate <NSObject>

- (void)touchIndex:(NSInteger)indexOfButton;

@end

@interface SectionIndexTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) id<SectionIndexButtonDelegate> sectionDelegate;
@property (strong, nonatomic) NSArray *titleArray;

@end
