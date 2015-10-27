//
//  ProductInfoViewController.m
//  BelApp
//
//  Created by Danny on 15/3/6.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ProductInfoViewController.h"

@interface ProductInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *productDescription;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *realName;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *maritalStatus;
@property (weak, nonatomic) IBOutlet UILabel *telNo;
@property (weak, nonatomic) IBOutlet UILabel *IDCardNo;
@property (weak, nonatomic) IBOutlet UILabel *workCity;
@property (weak, nonatomic) IBOutlet UILabel *companyScale;
@property (weak, nonatomic) IBOutlet UILabel *companyProperty;
@property (weak, nonatomic) IBOutlet UILabel *careerType;
@property (weak, nonatomic) IBOutlet UILabel *workTerm;

@end

@implementation ProductInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}

-(void)loadData{

    LCLog(@"borrowerInfo --> %@",self.borrowerInfo);
    self.productDescription.text = self.borrowerInfo.applyPurpose;
    self.username.text = self.borrowerInfo.loginName;
    self.realName.text = self.borrowerInfo.realname;
    self.sex.text = self.borrowerInfo.sex;
    self.age.text = [NSString stringWithFormat:@"%@",self.borrowerInfo.age];
    self.maritalStatus.text = self.borrowerInfo.marital;
    self.telNo.text = self.borrowerInfo.mobile;
    self.IDCardNo.text = self.borrowerInfo.ic;
    self.workCity.text = self.borrowerInfo.comAddress;
    self.companyScale.text = self.borrowerInfo.companyScale;
    self.companyProperty.text = self.borrowerInfo.companyNature;
    self.careerType.text = self.borrowerInfo.jobName;
    self.workTerm.text = self.borrowerInfo.enterpriseLife;
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
