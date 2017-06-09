//
//  ToptoonViewerScrollView.m
//  ToptoonViewerScrollView
//
//  Created by Haejoon Kim on 2017. 6. 8..
//  Copyright © 2017년 toptoon. All rights reserved.
//

#import "ToptoonViewerScrollView.h"


@implementation ToptoonViewerScrollView

- (instancetype)init{
    self = [super init];
    if(!self)return nil;
    // init function
    [self initiate];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self)return nil;
    // init function
    [self initiate];
    return self;
}

- (void)initiate{

    
    
    _imageViews = [[NSMutableArray alloc] init];
    
    [self addContentView];

}

- (void)setMinZoomScale:(CGFloat)minZoomScale{
    [self setMinimumZoomScale:minZoomScale];
}

- (void)setMaxZoomScale:(CGFloat)maxZoomScale{
    [self setMaximumZoomScale:maxZoomScale];
}

- (void)addContentView{
    
    _imagesContainer = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_imagesContainer];
    
    // Constraint
    [self addContentViewConstraint];
    

}

- (void)addContentViewConstraint{
    
    _imagesContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    _contentViewTopConstraint = [NSLayoutConstraint
                                 constraintWithItem:_imagesContainer
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self
                                 attribute:NSLayoutAttributeTop
                                 multiplier:1.0
                                 constant:0];
    
    _contentViewBottomConstraint = [NSLayoutConstraint
                                 constraintWithItem:_imagesContainer
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self
                                 attribute:NSLayoutAttributeBottom
                                 multiplier:1.0
                                 constant:0];
    
    _contentViewLeadingConstraint = [NSLayoutConstraint
                                 constraintWithItem:_imagesContainer
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self
                                 attribute:NSLayoutAttributeLeading
                                 multiplier:1.0
                                 constant:0];
    
    _contentViewTrailingConstraint = [NSLayoutConstraint
                                 constraintWithItem:_imagesContainer
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self
                                 attribute:NSLayoutAttributeTrailing
                                 multiplier:1.0
                                 constant:0];
    
    _contentViewHeightConstraint = [NSLayoutConstraint
                                 constraintWithItem:_imagesContainer
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:nil
                                 attribute:NSLayoutAttributeHeight
                                 multiplier:1.0
                                 constant:300];
    
    _contentViewHorizontalCenterConstraint = [NSLayoutConstraint
                                    constraintWithItem:_imagesContainer
                                    attribute:NSLayoutAttributeCenterX
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                    attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                    constant:0.0];
    
    [self addConstraints: [NSArray arrayWithObjects:_contentViewTopConstraint, _contentViewBottomConstraint, _contentViewHeightConstraint, _contentViewLeadingConstraint, _contentViewTrailingConstraint, _contentViewHorizontalCenterConstraint, nil] ];
    
    
}


- (void)dealloc{
    [self clearImageViews];
}

- (void)initToptoonViewerScrollView {
  
    _loadingHeight = 0;
    
    [self clearImageViews];
    
    [self setZoomScale:1.0f animated:NO];
    [self setContentOffset:CGPointMake(0, 0)];
    
}

- (void)clearImageViews{
    
    for (UIImageView *imageView in _imageViews) {
        imageView.image = nil;
        [imageView removeFromSuperview];
    }
    [_imageViews removeAllObjects];

}


- (void)appendImageView:(UIImage *)image{

    //NSLog(@"ToptoonViewerScrollView appendImageView");

    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewHeight = viewWidth * image.size.height / image.size.width;
    
    UIImageView *newImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _loadingHeight, viewWidth, viewHeight)];
    [newImageView setContentMode:UIViewContentModeScaleAspectFit];
    [newImageView setImage:image];
    
    _loadingHeight += viewHeight;
    
    _contentViewHeightConstraint.constant = _loadingHeight;
    
    [_imagesContainer addSubview:newImageView];
    [_imageViews addObject:newImageView];
    
    
}



@end
