#import "../Alert/mahoa.h"
#import  "../Alert/AlertGIF.h"

//
//  Telegram: @lazyvna
//
//  Group Chat Tele: @cLazychat
//  
//  Created by cLazy102
//


@implementation cLazy102

+ (void)InTheShell:(NSString *)title 
message:(NSString *)message font:(UIFont *)font 
duration:(int)duration kethuctb:(NSString *)kethuctb {
static BOOL xemthongbao = NO;
if (xemthongbao) return;
xemthongbao = YES;
UIWindow *cuasothongbao = [[[UIApplication sharedApplication] delegate] window];
CGFloat laychieurongmh = [UIScreen mainScreen].bounds.size.width;
CGFloat demthoigian = 15;
UILabel *nhancLazy102 = [[UILabel alloc] init];
nhancLazy102.font = font;
nhancLazy102.text = [NSString stringWithFormat:message, duration];
nhancLazy102.numberOfLines = 0;
CGSize cLazyFull = CGSizeMake(laychieurongmh - 2 * demthoigian, CGFLOAT_MAX);
CGRect khuvuctbcLazy102 = [nhancLazy102.text boundingRectWithSize:cLazyFull
options:NSStringDrawingUsesLineFragmentOrigin 
                                            attributes:@{NSFontAttributeName: font} 
                                                context:nil];
CGFloat chieurongtb = khuvuctbcLazy102.size.width + 60; 
CGFloat chieucaotb = khuvuctbcLazy102.size.height + 40;
CGFloat vitrihienthiX = (laychieurongmh - chieurongtb) / 2;
CGFloat vitrihienthiY = 15;
UIView *viewhienthicLazy102 = [[UIView alloc] initWithFrame:CGRectMake(vitrihienthiX, -chieucaotb, chieurongtb, chieucaotb)];
viewhienthicLazy102.backgroundColor = [UIColor blackColor];
viewhienthicLazy102.layer.cornerRadius = chieucaotb / 2;
viewhienthicLazy102.alpha = 0.9;
viewhienthicLazy102.clipsToBounds = YES;
viewhienthicLazy102.layer.shadowColor = [UIColor blackColor].CGColor;
viewhienthicLazy102.layer.shadowOpacity = 0.3;
viewhienthicLazy102.layer.shadowOffset = CGSizeMake(0, 4);
viewhienthicLazy102.layer.shadowRadius = 8;
[cuasothongbao addSubview:viewhienthicLazy102];
CGFloat imageSize = 40;
UIImageView *hinhanhtbgif = [[UIImageView alloc] initWithFrame:CGRectMake(10, (chieucaotb - imageSize) / 2, imageSize, imageSize)];
hinhanhtbgif.layer.cornerRadius = imageSize / 2;
hinhanhtbgif.layer.masksToBounds = YES;
hinhanhtbgif.contentMode = UIViewContentModeScaleAspectFill;
[viewhienthicLazy102 addSubview:hinhanhtbgif];
UILabel *tieudetbcLazy = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, chieurongtb - 70, 20)];
    tieudetbcLazy.text = title;
    tieudetbcLazy.font = font;
    tieudetbcLazy.textColor = [UIColor whiteColor];
    [viewhienthicLazy102 addSubview:tieudetbcLazy];

    UILabel *nhantbcLazy102 = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, chieurongtb - 70, khuvuctbcLazy102.size.height)];
    nhantbcLazy102.font = [UIFont systemFontOfSize:14];
    nhantbcLazy102.textColor = [UIColor lightGrayColor];
    nhantbcLazy102.numberOfLines = 0;
    [viewhienthicLazy102 addSubview:nhantbcLazy102];

    __block int demnguoctime = duration;
    nhantbcLazy102.text = [NSString stringWithFormat:message, demnguoctime];

    __block NSTimer *ketthucdem = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull t) {
        demnguoctime--;
        nhantbcLazy102.text = [NSString stringWithFormat:message, demnguoctime];

        if (demnguoctime <= 0) {
            [t invalidate]; 
            ketthucdem = nil;

            if (kethuctb) {
                nhantbcLazy102.text = kethuctb;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.5 animations:^{
                        viewhienthicLazy102.frame = CGRectMake(vitrihienthiX, -chieucaotb, chieurongtb, chieucaotb); 
                        viewhienthicLazy102.alpha = 0;
                    } completion:^(BOOL finished) {
                        [viewhienthicLazy102 removeFromSuperview];
                        xemthongbao = NO;
                    }];
                });
            } else {
                [UIView animateWithDuration:0.5 animations:^{
                    viewhienthicLazy102.frame = CGRectMake(vitrihienthiX, -chieucaotb, chieurongtb, chieucaotb); 
                    viewhienthicLazy102.alpha = 0; 
                } completion:^(BOOL finished) {
                    [viewhienthicLazy102 removeFromSuperview];
                    xemthongbao = NO;
                }];
            }
        }
    }];

NSString *duongdanggif = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES).firstObject 
           stringByAppendingPathComponent:NSSENCRYPT("clazy102.gif")];

if ([[NSFileManager defaultManager] fileExistsAtPath:duongdanggif]) {
    NSData *gifData = [NSData dataWithContentsOfFile:duongdanggif];
    [self hamhienthigif:hinhanhtbgif withData:gifData];
}
[UIView animateWithDuration:0.5 animations:^{
        viewhienthicLazy102.frame = CGRectMake(vitrihienthiX, vitrihienthiY, chieurongtb, chieucaotb);
    }];
}


- (void)hamhienthigif:(UIImageView *)imageView withData:(NSData *)data {
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray array];

    for (size_t i = 0; i < count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (image) {
            [images addObject:[UIImage imageWithCGImage:image]];
            CGImageRelease(image);
        }
    }

    imageView.animationImages = images;
    imageView.animationDuration = 3.5;//thời gian gifd
    [imageView startAnimating];

    CFRelease(source);
}


@end