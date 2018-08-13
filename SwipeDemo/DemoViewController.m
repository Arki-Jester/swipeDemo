//
//  DemoViewController.m
//  SwipeDemo
//
//  Created by A.Jester on 2018/8/13.
//  Copyright © 2018 AJ. All rights reserved.
//
#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height (iPhoneX ? [UIScreen mainScreen].bounds.size.height - 34 -24 : [UIScreen mainScreen].bounds.size.height)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#define topWidth 300
#define topHeight 400

#define bottomWidth 150
#define bottomHeight 200

#import "DemoViewController.h"
#import "GraduateMoreView.h"

@interface DemoViewController ()
{
    CGPoint _originMiddleCenter;
    CGPoint _changeMiddleCenter;
    
    CGPoint _originLeftCenter;
    CGPoint _changeLeftCenter;
    
    CGPoint _originRightCenter;
    CGPoint _changeRightCenter;
    NSMutableArray *_viewArr;
    
    CGPoint origpoint;
}
@property (strong, nonatomic)  UIView *leftView;
@property (strong, nonatomic)  UIView *middleView;
@property (strong, nonatomic)  UIView *rightView;
@property (strong, nonatomic)  UIView *topView;


@property (strong, nonatomic)  UIButton *leftBtn;
@property (strong, nonatomic)  UIButton *middleBtn;
@property (strong, nonatomic)  UIButton *rightBtn;
@property (strong, nonatomic)  UIButton *topBtn;
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}

- (void)setupUI{
    self.title = @"SwipeDemo";
    CGRect frameTop = CGRectMake((Screen_Width - topWidth)/2, 64, topWidth, topHeight);
    CGRect frameLeft = CGRectMake(0, Screen_Height -bottomHeight, bottomWidth, bottomHeight);
    CGRect frameMiddle = CGRectMake(Screen_Width/2-bottomWidth/2, Screen_Height -bottomHeight, bottomWidth, bottomHeight);
    CGRect frameRight = CGRectMake(Screen_Width - bottomWidth, Screen_Height -bottomHeight, bottomWidth, bottomHeight);
    
    NSMutableArray *picArr = [NSMutableArray arrayWithObjects:@"graduateWorkMore",@"graduateCollege",@"graduateInfo",@"graduateSign", nil];
    
    GraduateMoreView *top = [[[NSBundle mainBundle]loadNibNamed:@"GraduateMoreView" owner:self options:nil] firstObject];
    top.bgImage.image = [UIImage imageNamed:picArr[0]];
    top.frame = frameTop;
    [self.view addSubview:top];
    top.tag = 103;
    UITapGestureRecognizer *taptop = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [top addGestureRecognizer:taptop];
    

    
    GraduateMoreView *left = [[[NSBundle mainBundle]loadNibNamed:@"GraduateMoreView" owner:self options:nil] firstObject];
    left.bgImage.image = [UIImage imageNamed:picArr[1]];
    left.frame = frameLeft;
    [self.view addSubview:left];
    left.tag = 100;
    UITapGestureRecognizer *tapleft = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [left addGestureRecognizer:tapleft];
    
    
    GraduateMoreView *middle = [[[NSBundle mainBundle]loadNibNamed:@"GraduateMoreView" owner:self options:nil] firstObject];
    middle.bgImage.image = [UIImage imageNamed:picArr[2]];
    middle.frame = frameMiddle;
    [self.view addSubview:middle];
    middle.tag = 101;
    UITapGestureRecognizer *tapmiddle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [middle addGestureRecognizer:tapmiddle];
    
    
    GraduateMoreView *right = [[[NSBundle mainBundle]loadNibNamed:@"GraduateMoreView" owner:self options:nil] firstObject];
    right.bgImage.image = [UIImage imageNamed:picArr[3]];
    right.frame = frameRight;
    [self.view addSubview:right];
    right.tag = 102;
    UITapGestureRecognizer *tapright = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [right addGestureRecognizer:tapright];
    
    _viewArr  = [NSMutableArray arrayWithObjects:left,middle,right,top, nil];
}
- (void)click:(UITapGestureRecognizer *)tap{

    [self.view bringSubviewToFront:tap.view];
    
    GraduateMoreView *v0 = _viewArr[0];
    GraduateMoreView *v1 = _viewArr[1];
    GraduateMoreView *v2 = _viewArr[2];
    GraduateMoreView *v3 = _viewArr[3];
    
    __block CGRect topFrame = CGRectMake((Screen_Width - topWidth)/2, 64, topWidth, topHeight);
    __block CGRect tempFrame = CGRectMake(0, 0, 0, 0);
    __block CGRect tempFrame2 = CGRectMake(0, 0, 0, 0);
    
    int index = 0;
    int type = 0;
    GraduateMoreView *selv = [[GraduateMoreView alloc]init];
    
    for (int i=0;i<_viewArr.count;i++) {
        GraduateMoreView *v = _viewArr[i];
        if (v.tag == tap.view.tag) {
            index = i;
            selv = v;
            if (i==0) {
                type  = 0;
                [UIView animateWithDuration:0.2 animations:^{
                    tempFrame = v1.frame;
                    tempFrame2 = v2.frame;
                    v1.frame =v0.frame;
                    v2.frame =tempFrame;
                    v3.frame =tempFrame2;
                    v0.frame =topFrame;
                }];
            }else if (i==1){
                [UIView animateWithDuration:0.2 animations:^{
                    tempFrame = v2.frame;
                    v2.frame =v1.frame;
                    v3.frame =tempFrame;
                    v1.frame =topFrame;
                }];
            }else if (i==2){
                type  = 1;;
                [UIView animateWithDuration:0.2 animations:^{
                    tempFrame = v1.frame;
                    tempFrame2 = v0.frame;
                    v1.frame =v2.frame;
                    v0.frame =tempFrame;
                    v3.frame =tempFrame2;
                    v2.frame =topFrame;
                }];
            }
        }
    }
    if (type == 0) {
        [_viewArr removeObjectAtIndex:index];
        [_viewArr addObject:selv];
    }else{
        GraduateMoreView *v = _viewArr[3];
        [_viewArr removeObjectAtIndex:3];
        [_viewArr insertObject:v atIndex:0];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    CGPoint point = [touches.anyObject locationInView:self.view];
    origpoint.x = point.x;
    
    GraduateMoreView *left = _viewArr[0];
    GraduateMoreView *middle = _viewArr[1];
    GraduateMoreView *right = _viewArr[2];
    
    _originLeftCenter = left.center;
    _originMiddleCenter = middle.center;
    _originRightCenter = right.center;
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [touches.anyObject locationInView:self.view];
    double offset = point.x - origpoint.x;

    GraduateMoreView *left = _viewArr[0];
    GraduateMoreView *middle = _viewArr[1];
    GraduateMoreView *right = _viewArr[2];
    
    right.center = CGPointMake(_originRightCenter.x + offset/2,_originRightCenter.y);
    middle.center = CGPointMake(_originMiddleCenter.x + offset/3,_originRightCenter.y);
    left.center = CGPointMake(_originLeftCenter.x + offset/6,_originRightCenter.y);
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    GraduateMoreView *left = _viewArr[0];
    GraduateMoreView *middle = _viewArr[1];
    GraduateMoreView *right = _viewArr[2];
    
    [UIView animateWithDuration:0.32
                          delay:0.02
         usingSpringWithDamping:0.55
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            right.center = self->_originRightCenter;
                            right.transform = CGAffineTransformIdentity;
                            
                            middle.center = self->_originMiddleCenter;
                            middle.transform = CGAffineTransformIdentity;
                            
                            left.center =   self->_originLeftCenter;
                            left.transform = CGAffineTransformIdentity;
                            
                        } completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
