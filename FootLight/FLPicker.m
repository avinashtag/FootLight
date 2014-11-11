//
//  FLPicker.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLPicker.h"
#import "FLPickerModel.h"

@interface FLPicker ()

@end

@implementation FLPicker



/*-(void)showPickerWithPopIn{
    
    self.pickerView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.pickerView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // do something once the animation finishes, put it here
    }];

}

-(void)hidePickerWithPopOut{
    
    self.pickerView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.pickerView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished){
    }];
}*/


-(void)callBackPickerSelected:(selectedFLPicker)selectedPick cancelPicker:(cancelFLPicker)pickCancel{
    
    _pickerCancel = pickCancel;
    _pickerSelected = selectedPick;
}
-(NSArray*)statusDatasource{
    NSArray *temp = @[@"Now Playing", @"Opening Soon", @"Closing Soon"];
//    for (NSString* value in temp) {
//        FLPickerModel *model = [[FLPickerModel alloc]init];
//        model.pickerTitle = value;
//        [datasource addObject:model];
//    }
    return temp;
}

-(NSArray*)theaterTypeDatasource{
    
    NSArray *temp = @[@"All", @"Musical", @"Drama",@"Comedy", @"Classic", @"Opera", @"Fringe"];
//    for (NSString* value in temp) {
//        FLPickerModel *model = [[FLPickerModel alloc]init];
//        model.pickerTitle = value;
//        [datasource addObject:model];
//    }
    return temp;
}
-(NSArray*)radiusFill{
    @autoreleasepool {
        NSArray *temp = @[@"1", @"2", @"5", @"10", @"15", @"20", @"25"];
//        for (NSString* value in temp) {
//            FLPickerModel *model = [[FLPickerModel alloc]init];
//            model.pickerTitle = value;
//            [datasource addObject:model];
//        }
        return temp;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelClicked:(UIButton *)sender {
    if (_pickerCancel != nil) {
        _pickerCancel(sender);
    }
}

- (IBAction)selectedPicker:(UIButton *)sender {
    if (_pickerSelected != nil) {
        NSString* seletedValue = [_pickerDatasource objectAtIndex:[self.picker selectedRowInComponent:0]];
        _pickerSelected(seletedValue);
    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _pickerDatasource.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_pickerDatasource objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    @try {
        if (_pickerSelected != nil) {
            NSString* seletedValue = [_pickerDatasource objectAtIndex:row];
            _pickerSelected(seletedValue);
        }
    }
    @catch (NSException *exception) {
        
    }

}
@end
