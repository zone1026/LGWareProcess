# LGWareProcess
自动灌水效果 进度条 ios

## 该代码实现了一个很实用的自动灌水的进度条框架，实用起来也非常方便：

    LGWareView *ware = [[LGWareView alloc] init];
    ware.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:ware];
    
    ware.precentText = @"68";
    ware.textInfo = @"用量";
    
    self.wareView = ware;

＃ 通过上述代码就可以将view加入到您的项目中，也可以自己设置一些属性，如颜色，大小，图片等等，通过下面代码启动和停止：

    [_wareView start]; // 启动

    [_wareView stop];  // 停止

＃ 代码中有GIF图片效果可以查看，具体的请看代码啦～～～
  
