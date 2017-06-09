//
//  ToptoonViewerScrollView.h
//  ToptoonViewerScrollView
//
//  Created by Haejoon Kim on 2017. 6. 8..
//  Copyright © 2017년 toptoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToptoonViewerScrollView : UIScrollView

@property (strong, nonatomic) UIView *imagesContainer;
@property (weak, nonatomic) NSLayoutConstraint *contentViewBottomConstraint;
@property (weak, nonatomic) NSLayoutConstraint *contentViewTopConstraint;
@property (weak, nonatomic) NSLayoutConstraint *contentViewLeadingConstraint;
@property (weak, nonatomic) NSLayoutConstraint *contentViewTrailingConstraint;
@property (weak, nonatomic) NSLayoutConstraint *contentViewHeightConstraint;
@property (weak, nonatomic) NSLayoutConstraint *contentViewHorizontalCenterConstraint;

@property (strong, nonatomic) NSMutableArray *imageViews;
@property (nonatomic) CGFloat loadingHeight;
@property (nonatomic) CGFloat minZoomScale;
@property (nonatomic) CGFloat maxZoomScale;

- (void)initiate;
- (void)initToptoonViewerScrollView;
- (void)appendImageView:(UIImage *)image;
- (void)setMinZoomScale:(CGFloat)minZoomScale;
- (void)setMaxZoomScale:(CGFloat)maxZoomScale;


@end
