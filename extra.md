# 安装 Arch Linux 虚拟机

### 虚拟化软件/模拟器 —— 如何选择

这章主要面向 macOS 或 Windows 用户，所以我决定不介绍 QEMU。

`macOS` 有专门的虚拟化解决方案——[Parallels Desktop](https://www.parallels.cn/)
(中文)，但它是商业软件。`VMWare` 是跨平台的，并且也有免费版本
(VMWare Player)，但在这里我们不去讨论它。

对于学习而言，我们在意以下几点：

- 全功能 (满足我们所有需求)
- 自由软件 (避免法律纠纷)
- 简单易用 (容易上手)
- 安全稳定 (不容易崩溃)

综上几点，我决定介绍 [VirtualBox](https://www.virtualbox.org/)。

### 安装 VirtualBox

1. 前往 [VirtualBox 下载页](https://www.virtualbox.org/wiki/Downloads)

   我们需要下载两个东西：

   - 安装包 (VirtualBox 6.1.xx platform packages) ——
     根据你的宿主机 (host) 选择合适的版本
   - 扩展包 (VirtualBox 6.1.xx Oracle VM VirtualBox Extension Pack) ——
     全平台通用，只有一个

   如果下载速度过慢，可以尝试从以下链接下载 (来自 `mirrors.tuna.tsinghua.edu.cn`):

   - 安装包
     - [macOS](https://mirrors.tuna.tsinghua.edu.cn/virtualbox/6.1.32/VirtualBox-6.1.32-149290-OSX.dmg)
     - [Windows](https://mirrors.tuna.tsinghua.edu.cn/virtualbox/6.1.32/VirtualBox-6.1.32-149290-Win.exe)
   - 扩展包
     - [全平台通用](https://mirrors.tuna.tsinghua.edu.cn/virtualbox/6.1.32/Oracle_VM_VirtualBox_Extension_Pack-6.1.32.vbox-extpack)

2. 安装 (macOS 的安装会有点不一样)

   在安装完 `VirtualBox` 之后，打开 `VirtualBox`，然后在菜单中进入
   `管理` -> `全局设定` -> `扩展`，点击 `添加新包`
   (此按钮在右边一栏，图标不带文字)
   然后选择我们刚才下载好的扩展包添加。

   **注意**：由于扩展包的分发方式
   [PUEL](https://www.virtualbox.org/wiki/VirtualBox_PUEL)
   与 `VirtualBox` 不一样，此过程需要同意许可证。

3. 查阅资料熟悉 `VirtualBox`

### 安装 Arch Linux

1. 下载最新的 `ArchISO`，快速链接：点击
   [archlinux-bootstrap-2022.04.01-x86_64.iso](https://mirrors.ustc.edu.cn/archlinux/iso/2022.04.01/archlinux-2022.04.01-x86_64.iso)

2. 打开 `VirtualBox`，新建一个虚拟机

   - 类型：Linux
   - 版本：Arch Linux (64-Bit)

   注意事项：

   - 内存根据宿主机配置调整，最好不要超过宿主机内存的一半
   - 虚拟磁盘的大小尽量大些，因为默认是动态的不会占用太多空间
   - 创建完成后进入 `设置` -> `系统`，打开 `启用 EFI`
   - 进入 `设置` -> `显示` 将 `显存大小` 拉到最大
     (可选打开 `启用3D加速`)
   - 如果是固态硬盘，进入 `设置` -> `存储`，将所有
     `使用主机输入输出缓存` 和
     `固态驱动器` 打开

3. 启动虚拟机

   1. 选中第一项，直接回车。稍等片刻，启动成功后会自动登陆
      `root` 用户。

   2. 下载并执行 `安装脚本`
      (此脚本仅适用于 **虚拟机** 安装，切勿在 **实体机** 上尝试)：

      ``` shell
      $ curl -O https://raw.githubusercontent.com/supdrewin/linux-tutorials/master/install.sh
      $ chmod +x install.sh
      $ ./install.sh
      ```

      如果连接不上 `raw.githubusercontent.com`，先试试下面这个，然后重试上面那个：

      ``` shell
      $ echo "185.199.109.133 raw.githubusercontent.com" >>/etc/hosts
      ```

   3. 安装完成后，先在右下角 `弹出虚拟盘`，然后重启即可进入新系统
      (用户名和密码都是 `root`)：

      ``` shell
      $ reboot
      ```

由于我们暂时不需要 `桌面环境`，所以现在不安装增强功能。如对安装细节感兴趣，可以查看
[ArchWiki](https://wiki.archlinux.org/title/Installation_guide)。

### 跳转

下一个：[第 00 章](https://github.com/supdrewin/linux-tutorials/blob/master/ch-00.md)
