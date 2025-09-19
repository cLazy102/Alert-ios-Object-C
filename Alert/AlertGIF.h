#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//================= Create by cLazy ================
//
//
//       cách sử dụn alert
//
//              [cLazy102 InTheShell:NSSENCRYPT("Thông báo")
 //             message:NSSENCRYPT("Thông báo sẽ kết thúc sau %d giây")
   //              font:[UIFont systemFontOfSize:16]// kích cỡ chữ
//             duration:10 // số giây hiển thị
  //          kethuctb:NSSENCRYPT("Thông báo đã kết thúc!")];

//
//



@interface cLazy102 : NSObject

+ (void)InTheShell:(NSString *)title 
           message:(NSString *)message 
              font:(UIFont *)font 
          duration:(int)duration 
     kethuctb:(NSString *)kethuctb;


@end


//=============== end ======================