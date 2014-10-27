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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray*)statusDatasource{
    NSMutableArray *datasource = [[NSMutableArray alloc]init];
    NSArray *temp = @[@"Now Playing", @"Opening Soon", @"Closing Soon"];
    for (NSString* value in temp) {
        FLPickerModel *model = [[FLPickerModel alloc]init];
        model.title = value;
        [datasource addObject:model];
    }
    return datasource;
}

-(NSArray*)theaterTypeDatasource{
    
    NSMutableArray *datasource = [[NSMutableArray alloc]init];
    NSArray *temp = @[@"All", @"Musical", @"Drama",@"Comedy", @"Classic", @"Opera", @"Fringe"];
    for (NSString* value in temp) {
        FLPickerModel *model = [[FLPickerModel alloc]init];
        model.title = value;
        [datasource addObject:model];
    }
    return datasource;
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
}

- (IBAction)selectedPicker:(UIButton *)sender {
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return @"testing Picker";
}
@end
