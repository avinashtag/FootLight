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
    
    NSRange timingsRange = [fullDescription rangeOfString:_details.productionWebsite];
    [description addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:timingsRange];
    NSMutableParagraphStyle *timingsWebsite = [[NSMutableParagraphStyle alloc]init];
    [timingsWebsite setAlignment:NSTextAlignmentCenter];
    [description addAttribute:NSParagraphStyleAttributeName value:timingsWebsite range:timingsRange];

    [self.description setAttributedText:description];
//    [self.description sizeThatFits:self.description.contentSize];
    [self.description sizeToFit];
    [self.productImage setImageWithURL:[NSURL URLWithString:_details.imagename] placeholderImage:[UIImage imageNamed:@"wait.png"]];
    CGSize size = self.productScroll.frame.size;
    size.height = 1000;// self.showTimings.frame.origin.y + self.showTimings.frame.size.height;
    [self.productScroll setContentSize:size];
    [self.productScroll setScrollEnabled:YES];
    
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
}

- (IBAction)voteDone:(UIButton *)sender {
}

- (IBAction)loadPdf:(UITapGestureRecognizer *)sender {
    FlLoadPdf *pdf = [self.storyboard instantiateViewControllerWithIdentifier:@"FlLoadPdf"];
    pdf.model = self.details;
    [self.navigationController pushViewController:pdf animated:YES];
}

@end
