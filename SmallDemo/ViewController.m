//
//  ViewController.m
//  SmallDemo
//
//  Created by zhaozq on 17/3/1.
//  Copyright © 2017年 wangjie. All rights reserved.
//

#import "ViewController.h"
#import "MyVC.h"


@interface ViewController()
{
    NSButton *pushButton;
}
@property (strong) NSPopover *popover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    pushButton = [[NSButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-44,self.view.frame.size.height/2 + 30, 88, 88)];
    //按钮样式
    pushButton.bezelStyle = NSRoundedBezelStyle;
    //是否显示背景 默认YES
    pushButton.bordered = YES;
    //按钮的Type
    [pushButton setButtonType:NSButtonTypeMomentaryPushIn];
    //设置图片
    pushButton.image = [NSImage imageNamed:@"close.png"];
    //按钮的标题
    [pushButton setTitle:@"我是按钮"];
    //是否隐藏
    pushButton.hidden = NO;
    //设置按钮的tag
    pushButton.tag = 100;
    //标题居中显示
    pushButton.alignment = NSTextAlignmentCenter;
    //设置背景是否透明
    pushButton.transparent = NO;
    //按钮初始状态
    pushButton.state = NSOffState;
    //按钮是否高亮
    pushButton.highlighted = NO;
    [pushButton setTarget:self];
    [pushButton setAction:@selector(click:)];
    //把当前按钮添加到视图上
    [self.view addSubview:pushButton];
    
    
//    NSButton *chooseBtn = [[NSButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-44 + 90,self.view.frame.size.height/2 + 30, 88, 88)];
//    //按钮样式
//    chooseBtn.bezelStyle = NSRoundedBezelStyle;
//    //是否显示背景 默认YES
//    chooseBtn.bordered = YES;
//    //按钮的Type
//    [chooseBtn setButtonType:NSButtonTypeMomentaryPushIn];
//    //设置图片
//    chooseBtn.image = [NSImage imageNamed:@"close.png"];
//    //按钮的标题
//    [chooseBtn setTitle:@"我是按钮2"];
//    //是否隐藏
//    chooseBtn.hidden = NO;
//    //设置按钮的tag
////    pushButton.tag = 100;
//    //标题居中显示
//    chooseBtn.alignment = NSTextAlignmentCenter;
//    //设置背景是否透明
//    chooseBtn.transparent = NO;
//    //按钮初始状态
//    chooseBtn.state = NSOffState;
//    //按钮是否高亮
//    chooseBtn.highlighted = NO;
//    //把当前按钮添加到视图上
//    [self.view addSubview:chooseBtn];
//    cooca mac 的坐标是在左下角,跟iOS起始坐标在左上角是有区别！
//    效果如下图 image
    
//    标题的富文本
    
//    NSMutableAttributedString *nameAttribute = [[NSMutableAttributedString alloc] initWithString:@"花名:胜任"];
//    
//    NSRange range = NSMakeRange(0, 3);
//    
//    [nameAttribute addAttribute:NSForegroundColorAttributeName
//                          value:[NSColor redColor]
//                          range:range];
//    
//    [nameAttribute addAttribute:NSFontAttributeName
//                          value:[NSFont systemFontOfSize:14]
//                          range:range];
//    
//    [nameAttribute fixAttributesInRange:range];
//    
//    [pushButton setAttributedTitle:nameAttribute];

    // Do any additional setup after loading the view.
    
}
- (void)click:(id)sender
{
    NSLog(@"点击了");
    
//    PopWindowCont *mypopoverView = [[PopWindowCont alloc] initWithWindowNibName:@"PopWindowCont"];
//
//    [mypopoverView showWindow:self];
//    myPopView * mypopoverView = [[myPopView alloc] initWithNibName:@"myPopView" bundle:nil];//继承nsviewcontroller的类
    
    NSColorPanel *cp = [NSColorPanel sharedColorPanel];
    [cp close];
    
    _popover = [[NSPopover alloc] init];
    _popover.behavior = NSPopoverBehaviorTransient;
    [_popover setContentViewController:[self colorPopoverController]];
    [_popover setAnimates:NO];
    [_popover showRelativeToRect:self.view.bounds ofView:self preferredEdge:NSMinYEdge];
}

- (NSViewController*) colorPopoverController {
    MyVC *controller = [[MyVC alloc] init];
    [controller setTarget:self];
    [controller setSelector:@selector(colorUpdatePopover:)];
    return controller;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
