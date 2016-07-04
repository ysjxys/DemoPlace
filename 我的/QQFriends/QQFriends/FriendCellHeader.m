/**
 某个控件出不来:
 1.frame的尺寸和位置对不对
 
 2.hidden是否为YES
 
 3.有没有添加到父控件中
 
 4.alpha 是否 < 0.01
 
 5.被其他控件挡住了
 
 6.父控件的前面5个情况
 */

#import "FriendCellHeader.h"
#import "FriendsGroup.h"
@interface FriendCellHeader()

@property(nonatomic, strong) UIButton *btn;
@property(nonatomic, strong) UILabel *label;

@end


@implementation FriendCellHeader

+ (instancetype)headerWithTableView:(UITableView *)tableView{
    static NSString *ID = @"header";
    FriendCellHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[FriendCellHeader alloc]initWithReuseIdentifier:ID];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *btn = [[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn addTarget:self action:@selector(headerViewClick) forControlEvents:UIControlEventTouchUpInside];
        // 设置按钮内部的imageView的内容模式为居中
        btn.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        btn.imageView.clipsToBounds = NO;
        self.btn = btn;
        [self.contentView addSubview:self.btn];
        
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor grayColor];
        self.label = label;
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)headerViewClick{
    self.friendsGroup.opened = !self.friendsGroup.opened;
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedWithNameView:)]) {
        [self.delegate headerViewDidClickedWithNameView:self];
    }
}

-(void)didMoveToSuperview{
    if(self.friendsGroup.isOpened){
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.btn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.btn.frame = self.bounds;
    
    CGFloat W = 150;
    CGFloat H = self.frame.size.height;
    CGFloat X = self.frame.size.width - W - 10;
    CGFloat Y = 0;
    self.label.frame = CGRectMake(X, Y, W, H);
}

- (void)setFriendsGroup:(FriendsGroup *)friendsGroup{
    _friendsGroup = friendsGroup;
    [self.btn setTitle:friendsGroup.name forState:UIControlStateNormal];
    self.label.text = [NSString stringWithFormat:@"%d/%lu",friendsGroup.online,(unsigned long)friendsGroup.friends.count];
}

@end
