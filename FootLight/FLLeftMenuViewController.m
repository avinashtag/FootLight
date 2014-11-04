//
//  FLLeftMenuViewController.m
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLLeftMenuViewController.h"
#import "FLLeftMenuCell.h"
#import "UIView+FLView.h"
#import "FootLightCategoryViewController.h"
#import "ViewController.h"
#import "FLAlert.h"
#import "FLByLocationViewController.h"
#import "FLProductListViewController.h"
#import "UINavigationController+FLNavigationController.h"

@interface FLLeftMenuCellModel(){
    NSString*    previousTitle;
}


@end

@implementation FLLeftMenuCellModel

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)imageLocal{
    self = [super init];
    self.menuTitleText = title;
    self.image = imageLocal;
    return self;
}

@end

@interface FLLeftMenuViewController (){
    FLProductListViewController *productList;
}

@end

@implementation FLLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameMenu = self.leftMenu.frame;
    frameMenu.origin.x = -frameMenu.size.width;
    [self.leftMenu setFrame:frameMenu];

    self.products = [[NSMutableArray alloc]init];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FlHome image:[UIImage imageNamed:@"home"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FlListing image:[UIImage imageNamed:@"list"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FLByLocation image:[UIImage imageNamed:@"location"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FlCriticsPick image:[UIImage imageNamed:@"critic"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FLMyFavorites image:[UIImage imageNamed:@"favorite"]]];
    [self.products addObject:[[FLLeftMenuCellModel alloc]initWithTitle:FLBack image:[UIImage imageNamed:@"FLBack"]]];
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

    return  [[AppDelegate sharedNavigationController].topViewController isKindOfClass:[ViewController class]] ? self.products.count-1 : self.products.count;
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    ******* navigate to detailView
    
    [UIView animateWithDuration:0.30 animations:^{
        
        CGRect leftFrame = self.leftMenu.frame;
        leftFrame.origin.x = -leftFrame.size.width;
        [self.leftMenu setFrame:leftFrame];
    } completion:^(BOOL finished) {
        
        switch (indexPath.row) {
            case 0://Home
                
                //[AppDelegate sharedNavigationController].title = FlHome;
                [self.view setNavigationTitle:[AppDelegate sharedNavigationController].title];
                [[AppDelegate sharedNavigationController] popToRootViewControllerAnimated:NO];
                break;
                
            case 1://listing
            {
              //  [AppDelegate sharedNavigationController].title = FlListing;
                [self.view setNavigationTitle:[AppDelegate sharedNavigationController].title];
                UIViewController *VC = [[AppDelegate sharedNavigationController] currentStackCheckViewController:[FootLightCategoryViewController class]];
                if ( VC != nil) {
                    [[AppDelegate sharedNavigationController] popToViewController:VC animated:NO];
                }
                else{
                    ViewController *Vc = (ViewController*)[[[AppDelegate sharedNavigationController] viewControllers] objectAtIndex:0];
                    [Vc.CategoryCollection.delegate collectionView:Vc.CategoryCollection didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
                }
            }
                break;
            case 2://location
            {
               // [AppDelegate sharedNavigationController].title = FLByLocation;
                [self.view setNavigationTitle:[AppDelegate sharedNavigationController].title];
                [[AppDelegate sharedNavigationController].viewControllers enumerateObjectsUsingBlock:^(UIViewController* viewControl, NSUInteger idx, BOOL *stop) {
                    if ([viewControl isKindOfClass:[FLByLocationViewController class]]) {
                        [[AppDelegate sharedNavigationController] popToViewController:viewControl animated:NO];
                        return ;
                    }
                }];
                ViewController *Vc = (ViewController*)[[[AppDelegate sharedNavigationController] viewControllers] objectAtIndex:0];
                [Vc.CategoryCollection.delegate collectionView:Vc.CategoryCollection didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]];
            }
                break;
                
            case 4:{
                [self.view setNavigationTitle:[AppDelegate sharedNavigationController].topViewController.title];
                [[AppDelegate sharedNavigationController].viewControllers enumerateObjectsUsingBlock:^(UIViewController* viewControl, NSUInteger idx, BOOL *stop) {
                    if ([viewControl isKindOfClass:[FLProductListViewController class]]) {
                        [[AppDelegate sharedNavigationController] popToViewController:viewControl animated:NO];
                        return ;
                    }
                }];
                ViewController *Vc = (ViewController*)[[[AppDelegate sharedNavigationController] viewControllers] objectAtIndex:0];
                [Vc.CategoryCollection.delegate collectionView:Vc.CategoryCollection didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0]];
            }
                break;
            case 5:{
                [[AppDelegate sharedNavigationController] popViewControllerAnimated:YES];
            }
                break;
            default:{
                [[[FLAlert alloc] init]initWithTitle:FLFootLights message:@"Coming Soon" cancelButtonTitle:@"Cancel" cancelHandler:nil otherHandler:nil otherButtonTitles:nil];
            }
                break;
        }
        [self.view removeFromSuperview];
    }];
    
}

-(void)animateViewIn:(NSString*)navigationTitleText{
    [UIView animateWithDuration:0.30 animations:^{
        CGRect leftFrame = self.leftMenu.frame;
        leftFrame.origin.x = 0;
        [self.leftMenu setFrame:leftFrame];
        [self.view setNavigationTitle:navigationTitleText];
        [self.leftMenu reloadData];
        
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)animateViewOut:(NSString*)navigationTitleText{
   
    [UIView animateWithDuration:0.30 animations:^{
        CGRect leftFrame = self.leftMenu.frame;
        leftFrame.origin.x = -leftFrame.size.width;
        [self.leftMenu setFrame:leftFrame];
        [self.view setNavigationTitle:[AppDelegate sharedNavigationController].topViewController.title];
        
    } completion:^(BOOL finished) {
        [self.view setNavigationTitle:[AppDelegate sharedNavigationController].topViewController.title];
        [self.view removeFromSuperview];
    }];
}


@end
