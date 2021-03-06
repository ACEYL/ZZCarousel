//
//  ExampleViewController1.m
//  ZZCarousel
//
//  Created by Liu on 16/2/15.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import "ExampleViewController1.h"
#import "ZZCarouselControl.h"
#import "EXampleCell1.h"

@interface ExampleViewController1()<ZZCarouselDelegate>

@property (strong, nonatomic) NSArray *array;

@property (strong, nonatomic) ZZCarouselControl *carouselView;

@end

@implementation ExampleViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _array = @[[UIImage imageNamed:@"zz1.jpg"],[UIImage imageNamed:@"zz2.jpg"],[UIImage imageNamed:@"zz3.jpg"],[UIImage imageNamed:@"zz4.jpg"],[UIImage imageNamed:@"zz5.jpg"]];
    

    _carouselView = [[ZZCarouselControl alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 3)];

    _carouselView.pageAlignment = ZZCarouselPageAlignmentRight;
    
    _carouselView.carouselData = _array;
    _carouselView.cellClass = [EXampleCell1 class];
    
    _carouselView.autoScrollTimeInterval = 2.0f;
    _carouselView.scrollDirection = ZZCarouselScrollDirectionLeft;
    _carouselView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    _carouselView.delegate = self;
    _carouselView.currentPageColor = [UIColor orangeColor];
    
    [self.view addSubview:_carouselView];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_carouselView stopAutoScroll];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_carouselView startAutoScroll];
}


- (void)carouselForItemCell:(id)cell carouselIndexItem:(id)item
{
    EXampleCell1 *dataCell = cell;
    [dataCell loadCarouselData:item];
}

- (void)didSelectCarouselItemAtIndex:(NSInteger)index
{
    NSLog(@"use delegate method at inde : %lu",index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
