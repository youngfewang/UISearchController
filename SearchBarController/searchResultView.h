//
//  searchResultView.h
//  SearchBarController
//
//  Created by 王永福 on 2018/5/7.
//  Copyright © 2018年 王永福. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchResultView : UIView
@property (nonatomic, strong) NSMutableArray *tableViewArr;

- (instancetype)initWithFrame:(CGRect)frame withArr:(NSMutableArray *)tableViewArr;
- (void)updateTableViewData:(NSArray *)tableViewArr;
@end
