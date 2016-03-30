//
//  GDDetailViewController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/30.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDDetailViewController.h"
#import "GDListModel.h"
#import "YHWebViewProgress.h"
#import "YHWebViewProgressView.h"

@interface GDDetailViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) YHWebViewProgress *progressProxy;

@end

@implementation GDDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _progressProxy = [[YHWebViewProgress alloc] init];
    YHWebViewProgressView *progressView = [[YHWebViewProgressView alloc]
                                           initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame),
                                                                    CGRectGetWidth(self.view.bounds), 4)];
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    self.progressProxy.progressView = progressView;
    self.webView.delegate = self.progressProxy;
    self.progressProxy.webViewProxy = self;
    [self.view addSubview:progressView];
    
    NSString *str = [NSString stringWithFormat:@"http://guangdiu.com/api/showdetail.php?id=%@", self.model.id];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
