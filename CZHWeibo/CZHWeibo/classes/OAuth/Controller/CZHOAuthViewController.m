//
//  CZHOAuthViewController.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHOAuthViewController.h"
#import "AFNetworking.h"
#import "CZHAccount.h"
#import "CZHTabBarController.h"
#import "CZHWeiboTool.h"
#import "CZHAccountTool.h"
#import "MBProgressHUD+MJ.h"


@interface CZHOAuthViewController ()<UIWebViewDelegate>

@end

@implementation CZHOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView*webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:CZHRequstURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

#pragma mark - webViewDelegate
/**
 *
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为grant_type时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。

 *
 *  @param webView
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    //微博请求
    NSString *urlStr = [request.URL absoluteString];
    NSRange range = [urlStr rangeOfString:@"code="];
 
    if (!(range.location == NSNotFound)) {
        
        NSString* code = [urlStr substringFromIndex:range.length+range.location];
        
        [self responseWithCode:code];

        //不加载请求，可以不加载回调页面
        return NO;
    }
    
    return YES;
}



- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [MBProgressHUD showMessage:@"お兄ちゃんは頑張るぞう..."];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    [MBProgressHUD hideHUD];
    [MBProgressHUD showSuccess:@"やとはいりました"];
}

- (void)responseWithCode:(NSString*)code{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"client_id"] = CZHAppKey;
    param[@"client_secret"] = CZHAppSecret;
    param[@"grant_type"] = @"authorization_code";
    param[@"redirect_uri"] = CZHRedirectURI;
    param[@"code"] = code;
    
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //保持用户信息
        CZHAccount*account = [CZHAccount AccountWithDic:responseObject];
        [CZHAccountTool saveAccount:account];
        
        //选择跟控制器
        [CZHWeiboTool ChooseRootController];
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"やとはいりました"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"失敗しました，あなたのネットは問題があります"];
    }];
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
        //if ([trustedHosts containsObject:challenge.protectionSpace.host])
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
             forAuthenticationChallenge:challenge];
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

@end
