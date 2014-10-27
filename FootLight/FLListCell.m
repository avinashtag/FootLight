//
//  FLListCell.m
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLListCell.h"

@interface FLListCell ()

@end

@implementation FLListCell

-(void)atNavigatePdf:(navigateToPdf)pdfBlockloc{
    self.pdfBlock = pdfBlockloc;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showDetail:(UIButton *)sender {
    self.pdfBlock(@(sender.tag));
}
@end
