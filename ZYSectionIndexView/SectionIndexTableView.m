//
//  SectionIndexTableView.m
//  ZYSectionIndexView
//
//  Created by Zhiyun on 16/2/2.
//  Copyright © 2016年 Zhiyun. All rights reserved.
//

#import "SectionIndexTableView.h"
#import "SectionIndexTableViewCell.h"
@interface SectionIndexTableView()

@property (strong, nonatomic) NSMutableDictionary *indexPathDict;
@end


@implementation SectionIndexTableView
@synthesize titleArray = _titleArray;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {NSLog(@"reload1111");
        self.frame = frame;
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
        self.rowHeight = 12;
        self.backgroundColor = [UIColor clearColor];
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerNib:[UINib nibWithNibName:[SectionIndexTableViewCell description] bundle:nil] forCellReuseIdentifier:[SectionIndexTableViewCell description]];
    }
    return self;
}
- (void)awakeFromNib
{//如果是从storyboard里面加载的就用这个方法来初始化
    NSLog(@"reload11");
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
    self.scrollEnabled = NO;
    self.rowHeight = 12;
    self.showsHorizontalScrollIndicator = NO;
    [self registerNib:[UINib nibWithNibName:[SectionIndexTableViewCell description] bundle:nil] forCellReuseIdentifier:[SectionIndexTableViewCell description]];
}

#pragma mark - UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return _titleArray.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
//    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSInteger i = 1;
    SectionIndexTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:[SectionIndexTableViewCell description] forIndexPath:indexPath];
    [sectionCell.sectionIndexButton setTitle:_titleArray[indexPath.row] forState:UIControlStateNormal];
    sectionCell.sectionIndexButton.tag = indexPath.row + 1 ;
    [sectionCell.sectionIndexButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
//    [self.indexPathDict setObject:[NSNumber numberWithInteger:indexPath.row] forKey:indexPath];
    
    return sectionCell;
}

- (void)touchButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if ([self.sectionDelegate respondsToSelector:@selector(touchIndex:)])
    {
        [self.sectionDelegate touchIndex:button.tag - 1];
    }
}

#pragma mark - setter and getter

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    [self reloadData];
}

- (NSMutableDictionary *)indexPathDict
{
    if (!_indexPathDict) {
        _indexPathDict = [NSMutableDictionary dictionary];
    }
    return _indexPathDict;
}

@end
