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
#import "AppDelegate.h"
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
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    UITextView *textView = [[UITextView alloc]initWithFrame:self.description.frame];
    textView.attributedText = self.description.attributedText;
    [textView sizeToFit];
    [textView setScrollEnabled:NO];
    [textView setDelegate:self];
    [textView setEditable:NO];
    [self.productScroll addSubview:textView];
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{

    FlLoadPdf *web = [self.storyboard instantiateViewControllerWithIdentifier:@"FlLoadPdf"];
    [self.navigationController pushViewController:web animated:YES];
    [web loadWebsite:URL];
    return NO;
}


-(void)prepareView{
    
    self.ProductName.text = _details.title;
    self.description.attributedText =    _details.detailedDescription;
    [self.productImage setImageWithURL:[NSURL URLWithString:_details.imagename] placeholderImage:[UIImage imageNamed:@"wait.png"]];
    [self.productScroll setScrollEnabled:YES];

    _startRatingView.canEdit = YES;
    _startRatingView.maxRating = 5;
    _startRatingView.rating = [_details.avg intValue];
    [self.startRatingView rateChange:^(float rate) {
       FLAlert* alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Do you Want to rate?" cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
           _startRatingView.rating = [_details.avg intValue];

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
        NSMutableArray *fav = [[[NSUserDefaults standardUserDefaults] valueForKey:footLightFavourite] mutableCopy];
        if (!fav) {
            fav = [[NSMutableArray alloc]init];
        }
        [fav addObject:data];
        [[NSUserDefaults standardUserDefaults]setValue:fav forKey:footLightFavourite];
    }
    else{
        NSMutableArray *fav = [[[NSUserDefaults standardUserDefaults] valueForKey:footLightFavourite] mutableCopy];
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
    NSString *urlstring = [NSString stringWithFormat:@"http://gofootlights.com/pdfs/%@.pdf",self.details.recordID];
    NSURL *url = [NSURL URLWithString:urlstring];
    FlLoadPdf *pdf = [self.storyboard instantiateViewControllerWithIdentifier:@"FlLoadPdf"];
    [self.navigationController pushViewController:pdf animated:YES];
    [pdf loadWebsite:url];
}



@end
