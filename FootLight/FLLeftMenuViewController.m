//
//  FLLeftMenuViewController.m
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLLeftMenuViewController.h"
#import "FLLeftMenuCell.h"

@interface FLLeftMenuCellModel()


@end

@implementation FLLeftMenuCellModel

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)imageLocal{
    self = [super init];
    self.menuTitleText = title;
    self.image = imageLocal;
    return self;
}

@end

@interface FLLeftMenuViewController ()

@end

@implementation FLLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.products = [[NSMutableArray alloc]init];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:@"Home" image:[UIImage imageNamed:@"home"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:@"Listing" image:[UIImage imageNamed:@"list"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:@"By Location" image:[UIImage imageNamed:@"location"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:@"Critics Picks" image:[UIImage imageNamed:@"critic"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:@"My Favorites" image:[UIImage imageNamed:@"favorite"]]];
    [self.leftMenu reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CustomIdentifier";
    FLLeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FLLeftMenuCell" owner:nil options:nil] objectAtIndex:0];
    }
    FLLeftMenuCellModel *model = [self.products objectAtIndex:indexPath.row];
    [cell.imageMenu setImage:model.image];
    [cell.titleMenu setText:model.menuTitleText];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    ******* navigate to detailView
    
    
    [UIView animateWithDuration:0.30 animations:^{
        
        [self.view setFrame:CGRectMake(-self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^(BOOL finished) {
        
        [self.view removeFromSuperview];
    }];
    
}


@end
