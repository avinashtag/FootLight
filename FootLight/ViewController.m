//
//  ViewController.m
//  FootLight
//
//  Created by Avinash Tag on 24/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ViewController.h"
#import "HomeCellModel.h"
#import "FLCollectionCell.h"
#import "FootLightCategoryViewController.h"
#import "FLAlert.h"
#import "FLByLocationViewController.h"
#import "FLNavigationBar.h"
#import "UIView+FLView.h"
#import "FLProductListViewController.h"

@interface ViewController (){
    NSArray *datasource;
    FLProductListViewController *product;
}

@end

@implementation ViewController

static ViewController *sharedInstance = nil;

+(ViewController*)sharedViewController{
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addNavigationBarWithTitle:FlHome navigation:self.navigationController];
    [self.CategoryCollection registerNib:[UINib nibWithNibName:@"FLCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CustomIdentifier"];
    datasource = [HomeCellModel dataSourceCollection];
    [self.CategoryCollection reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    sharedInstance = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return datasource.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FLCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomIdentifier" forIndexPath:indexPath];
    [cell.imageView setImage:[(HomeCellModel*)[datasource objectAtIndex:indexPath.row] image]];
    [cell.title setText:[(HomeCellModel*)[datasource objectAtIndex:indexPath.row] title]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            FootLightCategoryViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FootLightCategoryViewController"];
            [self.navigationController pushViewController:selectionVC animated:YES];
            self.navigationController.title = FlListing;
        }
            break;
        case 1:{
            FLByLocationViewController *LocationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FLByLocationViewController"];
            [self.navigationController pushViewController:LocationViewController animated:YES];
        }
            break;
        case 3:{
            product = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductListViewController"];
            [self.navigationController pushViewController:product animated:YES];
            [product loadFavourite];
        }
            break;
            
        default:{
            FLAlert *alert = [[FLAlert alloc]initWithTitle:@"FootLight" message:@"Coming Soon" cancelButtonTitle:@"Cancel" cancelHandler:nil otherHandler:nil otherButtonTitles:nil];
        }
            break;
    }
}


@end
