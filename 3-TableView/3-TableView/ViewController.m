//
//  ViewController.m
//  3-TableView
//
//  Created by duanyong on 2020/2/13.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *weapons;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    weapons = @[@"AUG", @"十字弩", @"DP28", @"Groza", @"Kar98k", @"M16a4", @"Micro UZI", @"平底锅", @"SKS", @"UMP9", @"SKS"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeaponCell" forIndexPath:indexPath];
    
    cell.textLabel.text = weapons[indexPath.row];

    return cell;
}

//  显示多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return weapons.count;
}


- (void) viewWillAppear:(BOOL)animated {
    
}


@end
