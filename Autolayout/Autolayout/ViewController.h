//
//  ViewController.h
//  Autolayout
//
//  Created by 金 聖輝 on 12-9-25.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpace;
- (IBAction)buttonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end
