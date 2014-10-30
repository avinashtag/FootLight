//
//  ATPicker.h
//  FootLight
//
//  Created by Avinash Tag on 29/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cancelATPicker)(id value);
typedef void(^selectedATPicker)(id value);

@interface ATPicker : UIViewController


@property (nonatomic, strong)IBOutlet UIPickerView *picker;
@property (nonatomic, strong)IBOutlet UIView *pickerView;
@property (nonatomic, strong)IBOutlet UIImageView *pickerSuperView;
@property(nonatomic, strong)cancelATPicker pickerCancel;
@property(nonatomic, strong)selectedATPicker pickerSelected;


@property (strong, nonatomic) NSArray *pickerDatasource;

-(void)callBackPickerSelected:(selectedATPicker)selectedPick cancelPicker:(cancelATPicker)pickCancel;
- (IBAction)cancelClicked:(UIButton *)sender;
- (IBAction)selectedPicker:(UIButton *)sender;

-(NSArray*)statusDatasource;
-(NSArray*)theaterTypeDatasource;

-(void)showPickerWithPopInWithCenter:(CGPoint)point;

-(void)hidePickerWithPopOut;
-(NSArray*)radiusFill;
@end
