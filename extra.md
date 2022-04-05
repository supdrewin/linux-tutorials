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

   - platform packages —— 根据你的宿主机 (host) 选择合适的版本
   - Oracle VM VirtualBox Extension Pack —— 只有一个

2. 安装 (macOS 的安装会有点不一样)

   在安装完 `VirtualBox` 之后，打开 `VirtualBox`，然后在菜单中进入
   `管理` -> `全局设定` -> `扩展`，点击 `添加新包`
   然后选择我们刚才下载好的扩展包添加。

   **注意：**由于扩展包的分发方式
   [PUEL](https://www.virtualbox.org/wiki/VirtualBox_PUEL)
   与 `VirtualBox` 不一样，此过程需要同意许可证。

### 安装 Arch Linux
