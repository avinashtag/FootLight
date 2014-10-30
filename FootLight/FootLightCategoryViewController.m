//
//  FootLightCategoryViewController.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FootLightCategoryViewController.h"
#import "HomeCellModel.h"
#import "FLCollectionCell.h"
#import "FLTheaterViewController.h"

@interface FootLightCategoryViewController (){
    NSArray *    datasource ;

}

@end

@implementation FootLightCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    datasource = [HomeCellModel dataSourceListingCollection];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FLCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CustomIdentifier"];
    [self.collectionView reloadData];
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
            FLTheaterViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLTheaterViewController"];
            [self.navigationController pushViewController:selectionVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
