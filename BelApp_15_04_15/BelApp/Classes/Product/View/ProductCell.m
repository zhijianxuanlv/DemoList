//
//  ProductCell.m
//  BelApp
//
//  Created by Leon on 15/3/11.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ProductCell.h"
#import "LCProgressView.h"
@interface ProductCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;
@property (nonatomic, weak) IBOutlet UILabel *percentlabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
//@property (weak, nonatomic) IBOutlet LCProgressView *progressView;



@end

@implementation ProductCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    UIView *view = [[UIView alloc] init];
//    view.clipsToBounds = YES;
//    view.layer.masksToBounds
    // Configure the view for the selected state
}

- (void) setProductModel:(ProductModel *)productModel {
    _productModel = productModel;
    _titleLabel.text = [NSString stringWithFormat:@"%@",_productModel.title];
    _rateLabel.text = [NSString stringWithFormat:@"%@",_productModel.rate];
    _amountLabel.text = [NSString stringWithFormat:@"%@元",_productModel.amount];
    _periodsLabel.text = [NSString stringWithFormat:@"%@个月",_productModel.periods];
    
//    _progressView.tintColor = [UIColor redColor];
    _progressView.progress = [productModel.progress floatValue] / 100.0;
//    [_progressView setProgress:[productModel.progress floatValue] / 100.0 animated:YES];
    _percentlabel.text = [NSString stringWithFormat:@"%@％",_productModel.progress];
}





@end
