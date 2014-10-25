//
//  FLPicker.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ViewController.h"
typedef void(^cancelFLPicker)(id value);
typedef void(^selectedFLPicker)(id value);


@interface FLPicker : ViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic)  cancelFLPicker flCancelFLPicker;
@property (strong, nonatomic)  selectedFLPicker flSelectedFLPicker;

- (IBAction)cancelClicked:(UIButton *)sender;
- (IBAction)selectedPicker:(UIButton *)sender;

-(NSArray*)statusDatasource;
-(NSArray*)theaterTypeDatasource;

@end
