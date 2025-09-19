
// alert Basic

showalert(NSSENCRYPT("Thông báo"), NSSENCRYPT("Xin Chào!\n Chào mừng đến với hack AOV"), NSSENCRYPT("key_block"));

void showalert(NSString *title, NSString *message, NSString *identifier) {
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:identifier]) {
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];

        
        UIAlertAction *close = [UIAlertAction actionWithTitle:NSSENCRYPT("Đóng")
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil];

        
        UIAlertAction *dontShowAgain = [UIAlertAction actionWithTitle:NSSENCRYPT("Đóng vĩnh viễn")
                                                                style:UIAlertActionStyleDestructive
                                                              handler:^(UIAlertAction * _Nonnull action) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:identifier];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];

        [alert addAction:close];
        [alert addAction:dontShowAgain];

        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (rootVC.presentedViewController) {
            rootVC = rootVC.presentedViewController;
        }

        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}


