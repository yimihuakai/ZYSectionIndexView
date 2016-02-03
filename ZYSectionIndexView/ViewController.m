//
//  ViewController.m
//  ZYSectionIndexView
//
//  Created by Zhiyun on 16/2/2.
//  Copyright © 2016年 Zhiyun. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *contentTableView;
@property (strong, nonatomic) SectionIndexTableView *sectionIndexTableView;
@property (strong, nonatomic) NSMutableArray *sectionArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.sectionArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", @"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",nil];
    self.sectionArray = [NSMutableArray arrayWithObjects:@"#",@"A",@"B",@"C",nil];
    [self.view addSubview:self.contentTableView];
    [self.view addSubview:self.sectionIndexTableView];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.contentTableView])
    {
        return 20;
    }
    return 0;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.contentTableView])
    {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.contentTableView])
    {
        NSString *cellstring = @"cell";
        UITableViewCell *cell ;
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstring];
        }
        cell.textLabel.text = @"1111";
        return cell;
    }
    return nil;
}


#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([tableView isEqual:self.contentTableView]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [view addSubview:label];
        if (section == 1)
        {
            label.text = @"B";
        }
        else
        {
            if(section == 2)
            {
                label.text = @"C";
            }
            else
            {
                label.text = @"A";
            }
        }
        return view;
    }
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([tableView isEqual:self.contentTableView])
    {
         return 44;
    }
    return 0;
   
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.contentTableView])
    {
         self.sectionIndexTableView.titleArray = self.sectionArray;
    }
    return nil;
}

#pragma mark - SectionIndexButtonDelegate
- (void)touchIndex:(NSInteger)indexOfButton
{
//    [self.contentTableView scrollToRowAtIndexPath:indexOfButton atScrollPosition:UITableViewScrollPositionTop animated:YES];如果没有#
    
    NSIndexPath *indexPath;
    if (indexOfButton == 0)
    {
        return;
    }
    indexPath = [NSIndexPath indexPathForRow:0 inSection:indexOfButton- 1];
    [self.contentTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

#pragma mark - setter and getter
- (UITableView *)contentTableView
{
    if (!_contentTableView)
    {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)    style:UITableViewStylePlain];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
        _contentTableView.rowHeight = 44;
        _contentTableView.sectionIndexBackgroundColor = [UIColor grayColor];
        
    }
    return _contentTableView;
}

- (SectionIndexTableView *)sectionIndexTableView
{
    if (!_sectionIndexTableView)
    {
        _sectionIndexTableView = [[SectionIndexTableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30 - 8, 125 + 64, 30, self.view.frame.size.height)];
        _sectionIndexTableView.sectionDelegate = self;
        
    }
    return _sectionIndexTableView;
}

- (NSMutableArray *)sectionArray
{
    if (!_sectionArray) {
        _sectionArray = [NSMutableArray array];
       
    }
    return _sectionArray;
}

@end
