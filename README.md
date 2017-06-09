# IOS Toptoon Viewer ScrollView

뷰어의 scrollview만 분리해서 만든 wrapper 입니다

이미지가 동적으로 생성될때 zooming하면 왼쪽으로 붙어서 좌, 우 스크롤 할 수 없는 문제를 해결했습니다

uiscrollview에  autolayout 적용 방식에 문제가 있었습니다

`
To size the scroll view’s frame with Auto Layout, constraints must either be explicit regarding the width and height of the scroll view, or the edges of the scroll view must be tied to views outside of its subtree.
`

This is a link to [apple developer](https://developer.apple.com/library/content/technotes/tn2154/_index.html)


## 설치

libToptoonViewerScrollView.a 와 ToptoonViewerScrollView.h 파일을 프로젝트에 넣으세요

소스를 수정할 수 있도록 static library project를 첨부합니다

## 사용

storyboard custom class를 정합니다

![]()

시작코드 예시

```
@interface
@property (weak, nonatomic) IBOutlet ToptoonViewerScrollView *scrollView;

@implementation
...
[_scrollView initiate];
[_scrollView setDelegate:self];
[_scrollView setMaxZoomScale:2.0];
[_scrollView setMinZoomScale:1.0];
```

초기화

```
[_scrollView initToptoonViewerScrollView];
```

이미지 하나 추가될때마다,
```
[_scrollView appendImageView:image];
```

Example에 샘플 코드 있습니다.




