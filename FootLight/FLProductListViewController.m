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
#import "FLAlert.h"
#import "ViewController.h"

@interface FLProductListViewController (){
    FLProductDetailViewController *detailVC;
}

@end

@implementation FLProductListViewController

UIImage *placeholderImage ;

-(void)refreshCompletion:(refreshCallCompletion)block{
    _completion = block;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    placeholderImage = [UIImage imageNamed:@"image_back"];
    
    if (_completion !=nil){
        _completion(@(0));
    }
    [[self productsTable] reloadData];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self.view setNavigationTitle:self.title];
    [self.navTitle setText:self.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pullRefresh{
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor whiteColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(callWebservice)
                  forControlEvents:UIControlEventValueChanged];
    
    UIView *refreshView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, 0, 0)];
    [self.productsTable insertSubview:refreshView atIndex:0]; //the tableView is a IBOutlet
    
    [refreshView addSubview:self.refreshControl];
}

-(void)callWebservice{
    if (_completion!=nil) {
        int limit = [pageLimit intValue];
        if (self.products.count%limit == 0) {
            _completion(@(self.products.count/limit));
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

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
    cell.productName.attributedText = zipModel.list;
    
 //   CGRect frame = cell.productName.frame;
   // frame.size.height = ceil(cell.productName.attributedText.size.height);
    //[cell.timeFrom setFrame:frame ];
//    cell.timeFrom.text = zipModel.cellTimings;
    [cell.productImage setImageWithURL:[NSURL URLWithString:zipModel.imagename] placeholderImage:placeholderImage];
    if (indexPath.row == self.products.count-1) {
        [self callWebservice];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    //    ******* navigate to detailView
    detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductDetailViewController"];
    detailVC.details = (FLZipResponseModel*)[self.products objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:detailVC animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == self.products.count) {
//        return 44.0f;
//    }
//    return 120;
//}

-(void)zipCallNormal:(NSString*)url filterGenere:(NSString*)genere{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[[ATWebService alloc] init] callOnUrlZip:url withSuccessHandler:^(NSArray* response, NSString *message) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.genre CONTAINS[cd] %@",genere];
        NSMutableArray *temp = ([genere isEqualToString:@"All"]) ? [response mutableCopy] : [[response filteredArrayUsingPredicate:predicate] mutableCopy];

        if (self.products.count) {
            [self.products addObjectsFromArray:temp];
        }
        else{
            self.products = temp;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadProducts];
        });
    } withFailHandler:^(id response, NSString *message, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];

        [[[FLAlert alloc] init]initWithTitle:FLFootLights message:error.localizedDescription cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
            [self.navigationController popViewControllerAnimated:YES];
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
    }];
}

-(void)loadFavourite{
     self.products = [[NSMutableArray alloc]init];
    NSMutableArray *fav = [[NSUserDefaults standardUserDefaults]valueForKey:@"FootLightFavorite"];
    [fav enumerateObjectsUsingBlock:^(NSData* data, NSUInteger idx, BOOL *stop) {
        FLZipResponseModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.products addObject:model];
    }];
    [self reloadProducts];
}

-(void)statusFilter:(NSString*)url filterGenere:(NSString*)genere{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[[ATWebService alloc] init] callOnUrlZip:url withSuccessHandler:^(NSArray* response, NSString *message) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.genre CONTAINS[cd] %@",genere];
        NSMutableArray *temp = ([genere isEqualToString:@"All"]) ? [response mutableCopy] : [[response filteredArrayUsingPredicate:predicate] mutableCopy];

        if (self.products.count) {
            [self.products addObjectsFromArray:temp];
        }
        else{
            self.products = temp;
        }


        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadProducts];
            
        });
    } withFailHandler:^(id response, NSString *message, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [[[FLAlert alloc] init]initWithTitle:FLFootLights message:error.localizedDescription cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
            [self.navigationController popViewControllerAnimated:YES];
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];

    }];
}

-(void)reloadProducts{
    if (self.products.count) {
        [self.productsTable reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [_activity setHidden:YES];
    }
    else{
        [self.productsTable reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [_activity setHidden:YES];
        [[[FLAlert alloc] init]initWithTitle:FLFootLights message:@"No data found" cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
            [self.navigationController popViewControllerAnimated:YES];
        } otherHandler:^(NSUInteger other) {

        } otherButtonTitles:nil];
    }
}


@end
