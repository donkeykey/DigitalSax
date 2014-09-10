//
//  ViewController.m
//  BLESerialSample
//
//  Created by 川島 大地 on 2014/09/08.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "ViewController.h"
#import "BLESerialManager.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *myview;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[BLESerialManager sharedManager] initBLE];
    [BLESerialManager sharedManager].delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchConnectBtn:(id)sender {
    [[BLESerialManager sharedManager] connect];
}
- (IBAction)onTouchDisconnectBtn:(id)sender {
    [[BLESerialManager sharedManager] disconnect];
}

- (IBAction)onTouchSendBtn:(id)sender {
    [[BLESerialManager sharedManager] sendStr:[NSString stringWithFormat:@"HOGE"]];
}

- (void) onReceiveData:(NSString *)data {
    if ( [data intValue] > 200 ) {
        NSLog(@"on");
        self.myview.backgroundColor = [UIColor redColor];
    } else {
        self.myview.backgroundColor = [UIColor whiteColor];
    }
}

@end
