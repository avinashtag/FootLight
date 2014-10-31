//
//  ATPicker.m
//  FootLight
//
//  Created by Avinash Tag on 29/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ATPicker.h"
#import "FLPickerModel.h"

@interface ATPicker ()

@end

@implementation ATPicker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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


-(void)callBackPickerSelected:(selectedATPicker)selectedPick cancelPicker:(selectedATPicker)pickCancel{
    
    _pickerCancel = pickCancel;
    _pickerSelected = selectedPick;
}
-(NSArray*)statusDatasource{
    @autoreleasepool {

    NSMutableArray *datasource = [[NSMutableArray alloc]init];
    NSArray *temp = @[@"Now Playing", @"Opening Soon", @"Closing Soon"];
    for (NSString* value in temp) {
        FLPickerModel *model = [[FLPickerModel alloc]init];
        model.pickerTitle = value;
        [datasource addObject:model];
    }
    return datasource;
    }
}

-(NSArray*)theaterTypeDatasource{
    @autoreleasepool {
        NSMutableArray *datasource = [[NSMutableArray alloc]init];
        NSArray *temp = @[@"All", @"Musical", @"Drama",@"Comedy", @"Classic", @"Opera", @"Fringe"];
        for (NSString* value in temp) {
            FLPickerModel *model = [[FLPickerModel alloc]init];
            model.pickerTitle = value;
            [datasource addObject:model];
        }
        return datasource;
    }
}
-(NSArray*)radiusFill{
    @autoreleasepool {
        NSMutableArray *datasource = [[NSMutableArray alloc]init];
        NSArray *temp = @[@"1", @"2", @"5", @"10", @"15", @"20", @"25"];
        for (NSString* value in temp) {
            FLPickerModel *model = [[FLPickerModel alloc]init];
            model.pickerTitle = value;
            [datasource addObject:model];
        }
        return datasource;
    }
}
- (IBAction)cancelClicked:(UIButton *)sender {
    if (_pickerCancel != nil) {
        _pickerCancel(sender);
    }
    [self hidePickerWithPopOut];
}

- (IBAction)selectedPicker:(UIButton *)sender {
    if (_pickerSelected != nil) {
        NSString* seletedValue = [_pickerDatasource objectAtIndex:[self.picker selectedRowInComponent:0]];
        _pickerSelected(seletedValue);
    }
    [self hidePickerWithPopOut];
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
    
    return [(FLPickerModel*)[_pickerDatasource objectAtIndex:row] pickerTitle];
}
-(void)showPickerWithPopInWithCenter:(CGPoint)point{
    
    self.view.frame = [AppDelegate SharedApplication].window.frame;
    [[AppDelegate SharedApplication].window addSubview:self.view];
    [[AppDelegate SharedApplication].window bringSubviewToFront:self.view];
    self.pickerView.center = point;
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
        [self.view removeFromSuperview];
    }];
}

@end
