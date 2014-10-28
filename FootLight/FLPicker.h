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


@interface FLPicker : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSArray *pickerDatasource;


@property(nonatomic, strong)cancelFLPicker pickerCancel;
@property(nonatomic, strong)selectedFLPicker pickerSelected;

-(void)callBackPickerSelected:(selectedFLPicker)selectedPick cancelPicker:(cancelFLPicker)pickCancel;
- (IBAction)cancelClicked:(UIButton *)sender;
- (IBAction)selectedPicker:(UIButton *)sender;

-(NSArray*)statusDatasource;
-(NSArray*)theaterTypeDatasource;

@end
