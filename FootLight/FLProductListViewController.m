//
//  FLProductListViewController.m
//  FootLight
//
//  Created by Avinash Tag on 28/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLProductListViewController.h"
#import "FLListCell.h"
#import "FLZipResponseModel.h"
#import "ATWebService.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "FLProductDetailViewController.h"

@interface FLProductListViewController (){
    FLProductDetailViewController *detailVC;
}

@end

@implementation FLProductListViewController

UIImage *placeholderImage ;
- (void)viewDidLoad {
    [super viewDidLoad];
    placeholderImage = [UIImage imageNamed:@"image_back"];
    [[self productsTable] reloadData];
    // Do any additional setup after loading the view.
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
    FLListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FLListCell" owner:nil options:nil] objectAtIndex:0];
    }
    [cell atNavigatePdf:^(id tag) {
        [tableView.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }];
    FLZipResponseModel *zipModel = [self.products objectAtIndex:indexPath.row];
    cell.productName.text = zipModel.title;
    cell.productType.text = zipModel.venueTheatreName;
    
    CGRect frame = cell.timeFrom.frame;
    frame.size.height = [zipModel.cellCreated doubleValue];
    [cell.timeFrom setFrame:frame ];
    cell.timeFrom.text = zipModel.cellTimings;
    [cell.productImage setImageWithURL:[NSURL URLWithString:zipModel.imagename] placeholderImage:placeholderImage];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    ******* navigate to detailView
    detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductDetailViewController"];
    detailVC.details = (FLZipResponseModel*)[self.products objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FLZipResponseModel *zipModel = [self.products objectAtIndex:indexPath.row];
    return 63+21 + [zipModel.cellCreated doubleValue];
}

-(void)zipCallNormal:(NSString*)url{
    MBProgressHUD *mbhud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[[ATWebService alloc] init] callOnUrlZip:url withSuccessHandler:^(NSArray* response, NSString *message) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.products = [response mutableCopy];
            [self.productsTable reloadData];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        });
    } withFailHandler:^(id response, NSString *message, NSError *error) {
        
    }];
}

-(void)loadFavourite{
    _products = [[NSMutableArray alloc]init];
    NSMutableArray *fav = [[NSUserDefaults standardUserDefaults]valueForKey:@"FootLightFavorite"];
    [fav enumerateObjectsUsingBlock:^(NSData* data, NSUInteger idx, BOOL *stop) {
        FLZipResponseModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [_products addObject:model];
    }];
    [self.productsTable reloadData];
}


@end
