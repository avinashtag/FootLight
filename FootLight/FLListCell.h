//
//  FLListCell.h
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^navigateToPdf)(id tag);

@interface FLListCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *productType;
@property (strong, nonatomic) IBOutlet UILabel *timeFrom;
@property (strong, nonatomic) IBOutlet UILabel *timeTo;
@property (strong, nonatomic) navigateToPdf pdfBlock;

-(void)atNavigatePdf:(navigateToPdf)pdfBlockloc;
- (IBAction)showDetail:(UIButton *)sender;
@end
