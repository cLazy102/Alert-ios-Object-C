# cLazy Alert IOS

## Giới thiệu | Introduction


Dự án Thông báo ( Alert ) ios


Alert Gif Obj-C project

## Hướng Dẫn | Instructions

```objective-c
#import "Alert/AlertGIF.h"
```

Cấu hình Makefile:

```makefile
$(FRAMEWORK_NAME)_FILES = thong_bao_gif.mm 
#$(wildcard folder/*.mm) 
```

# Cách sử dụng thông báo ( How to Call Alert)

```objectivec
[cLazy102 InTheShell:NSSENCRYPT("Thông báo") // tiêu đề
   message:NSSENCRYPT("Thông báo sẽ kết thúc sau %d giây") // nội dung
         font:[UIFont systemFontOfSize:16]// kích cỡ chữ
      duration:10 // số giây hiển thị
    kethuctb:NSSENCRYPT("Thông báo đã kết thúc!")]; // text end
    //kethuctb:nil]; // không text end
```




## Tác giả | Author

**Contact**

Telegram: [Donald Bịp 102](https://t.me/lazyvna)  



