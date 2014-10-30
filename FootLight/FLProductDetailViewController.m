//
//  FLProductDetailViewController.m
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLProductDetailViewController.h"
#import "ATWebService.h"
#import "FLZipResponseModel.h"
#import "UIImageView+WebCache.h"
#import "FlLoadPdf.h"
#import "FLAlert.h"
#import "FLMapViewController.h"

@interface FLProductDetailViewController ()

@end

@implementation FLProductDetailViewController

static NSString *footLightFavourite = @"FootLightFavorite";
@synthesize description = _description;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self    prepareView];
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

-(void)prepareView{
    
    self.ProductName.text = _details.title;
    NSString *fullDescription = [NSString stringWithFormat:@"%@\n%@\n%@",_details.playDescription,_details.productionWebsite,_details.cellTimings];

    NSMutableAttributedString *description = [[NSMutableAttributedString alloc] initWithString:fullDescription];
    [description addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(0, fullDescription.length)];
    NSRange websiteRange = [fullDescription rangeOfString:_details.productionWebsite];
    [description addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:websiteRange];
    NSMutableParagraphStyle *pragraphWebsite = [[NSMutableParagraphStyle alloc]init];
    [pragraphWebsite setAlignment:NSTextAlignmentCenter];
    [description addAttribute:NSParagraphStyleAttributeName value:pragraphWebsite range:websiteRange];
    
    NSRange timingsRange = [fullDescription rangeOfString:_details.cellTimings];
    [description addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:timingsRange];
    [description addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14.0] range:timingsRange];

    NSMutableParagraphStyle *timingsWebsite = [[NSMutableParagraphStyle alloc]init];
    [timingsWebsite setAlignment:NSTextAlignmentCenter];
    [description addAttribute:NSParagraphStyleAttributeName value:timingsWebsite range:timingsRange];

    [self.description setAttributedText:description];
    [self.productImage setImageWithURL:[NSURL URLWithString:_details.imagename] placeholderImage:[UIImage imageNamed:@"wait.png"]];
    [self.productScroll setScrollEnabled:YES];

    _startRatingView.canEdit = YES;
    _startRatingView.maxRating = 5;
    _startRatingView.rating = 0;
    [self.startRatingView rateChange:^(float rate) {
       FLAlert* alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Do you Want to rate?" cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
           _startRatingView.rating = 0;

        } otherHandler:^(NSUInteger other) {
            
            NSString* url = [NSString stringWithFormat:@"rating.php?rid=%@&rating=%f",_details.recordID, rate];
            [[[ATWebService alloc] init] callOnUrlrating:url withSuccessHandler:^(NSArray* response, NSString *message) {
            } withFailHandler:^(id response, NSString *message, NSError *error) {
                
            }];
            
        } otherButtonTitles:@"Yes"];
    }];

    [self checkFavourite];
}




-(void)checkFavourite{
    
    NSMutableArray *fav = [[NSUserDefaults standardUserDefaults]valueForKey:footLightFavourite];
    if (fav.count) {
        [fav enumerateObjectsUsingBlock:^(NSData* data, NSUInteger idx, BOOL *stop) {
           
            FLZipResponseModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            if ([model.recordID isEqualToString:self.details.recordID]){
                //** set fav
                self.favouriteButton.selected = YES;
                *stop = YES;
            }
        }];
    }
}

- (IBAction)favorite:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.details.favourite = [NSNumber numberWithBool:sender.selected];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.details];
        NSMutableArray *fav = [[NSUserDefaults standardUserDefaults] valueForKey:footLightFavourite];
        if (!fav) {
            fav = [[NSMutableArray alloc]init];
        }
        [fav addObject:data];
        [[NSUserDefaults standardUserDefaults]setValue:fav forKey:footLightFavourite];
    }
    else{
        NSMutableArray *fav = [[NSUserDefaults standardUserDefaults] valueForKey:footLightFavourite];
        if (fav.count) {
            [fav enumerateObjectsUsingBlock:^(NSData* data, NSUInteger idx, BOOL *stop) {
                
                FLZipResponseModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
                if ([model.recordID isEqualToString:self.details.recordID]){
                    //** set fav
                    [fav removeObject:data];
                    [[NSUserDefaults standardUserDefaults]setValue:fav forKey:footLightFavourite];
                    *stop = YES;
                }
            }];
        }
    }

}
- (IBAction)direction:(UIButton *)sender {
    FLMapViewController *map = [self.storyboard instantiateViewControllerWithIdentifier:@"FLMapViewController"];
    map.model = self.details;
    [self.navigationController pushViewController:map animated:YES];
}



- (IBAction)loadPdf:(UITapGestureRecognizer *)sender {
    FlLoadPdf *pdf = [self.storyboard instantiateViewControllerWithIdentifier:@"FlLoadPdf"];
    pdf.model = self.details;
    [self.navigationController pushViewController:pdf animated:YES];
}

@end
