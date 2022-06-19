# foodfix
## 运行代码
### 1. 获取源代码
mac os 在terminal中执行 git clone git@github.com:JCCCCX/FoodFix.git 将工程代码下载到本地文件系统。windows需要在git for windows 的 git bash 执行相应操作。
### 2. 确保开发机上安装了flutter sdk
可以参考`https://book.flutterchina.club/chapter1/install_flutter.html#_1-3-1-安装flutter`在本地安装flutter的sdk。为了方便调试，还需要安装xcode和android sdk的。这里需要注意，xcode和其附带的ios虚拟机不支持windows操作系统。使用windows的同学可以安装android studio来获取android sdk。国内不能访问google网站可以尝试从第三方获取，例如 `https://www.androiddevtools.cn`，

flutter安装成功后，可以使用`flutter doctor`来进行确认。
### 3. 建立开发调试环境
工程上传时需要注意，我们只需要共同向github仓库提供源码相关的文件即可，本地开发工程相关的文件尽量不要上传push，这里包括`build`中编译出的二进制应用程序文件，`test`中的单元测试代码，`ios`，`web`，`windows`，`android`中的各个运行环境的模拟器配置文件等都不需要上传，这里可以通过.gitignore来控制。
#### 3.1. 设置代码文件夹成为一个flutter 工程
这里可以通过在控制台运行`flutter create .`来将当前文件夹设置为flutter工程，这里会自动生成很多子文件夹用于flutter sdk对本地工程的管理。不过目前有一个限制，直接clone后仓库因为叫做`FoodFix`不满足flutter工程的小写命名规范，因此需要手动将文件夹改成`foodfix`或者其他小写的文件夹名，这里不会影响**git**后续操作。
#### 3.2 安装工程需要的依赖包
- 可以在vs code 中安装flutter 和 dart插件，然后右下角就会弹出提示我们下载packages。
- 也可以在任意terminal中运行`flutter packages get`来下载。
#### 3.3 尝试运行flutter程序
- 可以在vs code 中打开main.dart 点击键盘F5运行
- 也可以在terminal 中运行 `flutter run`来运行