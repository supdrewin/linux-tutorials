# ✨ Linux 实验教程 ✨

- 宿主机：Debian sid (非必要，其他 Linux 发行版也行)
- 实验环境：Arch Linux

### 环境搭建

1. 下载 `Arch Linux` 最新的 `bootstrap` 压缩包

   当前最新为
   [archlinux-bootstrap-2022.04.01-x86_64.tar.gz](https://mirrors.ustc.edu.cn/archlinux/iso/2022.04.01/archlinux-bootstrap-2022.04.01-x86_64.tar.gz)

   此处建议使用离自己最近的镜像站点下载。

   或者使用我打包好的
   [最小化版本 rootfs.tar.xz](https://github.com/supdrewin/linux-learning/releases/download/rootfs/rootfs.tar.xz)，此存档的
   Arch Linux 根文件系统只包含
   [必要软件包](https://archlinux.org/packages/core/any/base/)
   (无内核及开发工具)。

2. 解压缩

   ``` shell
   $ sudo tar xf rootfs.tar.xz
   ```

   解压后我们将得到一个名为 `rootfs`
   的文件夹，此文件夹稍后用于模拟一个新的根文件系统。

   **注意**，此处我们需要提升权限以便解压后的 `rootfs`
   权限正确，并且以后要修改 `rootfs`
   里的系统文件也需要 `root`
   权限。

3. 必要配置

   1. 从宿主机拷贝一份 `resolv.conf`，以便实验环境下能正常解析域名。

      ``` shell
      $ sudo cp /etc/resolv.conf rootfs/etc
      ```

   2. 从宿主机拷贝一份 `locale.gen`，待会进入实验环境接着设置。

      ``` shell
      $ sudo cp /etc/locale.gen rootfs/etc
      ```

   3. 配置软件安装源：

      ``` shell
      $ sudo bash -c 'echo Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch >>rootfs/etc/pacman.d/mirrorlist'
      ```

      **注意**，此处使用单引号防止命令在外层被转义。

4. 进入实验环境

   此处使用我已经写好的 [Shell Script](run.sh)

   ``` shell
   $ ROOTFS=rootfs SHELL=bash ./run.sh
   ```

   此时我们只有 `bash`，如果你使用其他 `Shell`
   (比如 zsh，fish...)，则
   `SHELL=bash` 必须被设置。

   完成上一步的 `2`，生成 `locale`

   ``` shell
   $ locale-gen
   ```

5. 配置 `pacman`

   尝试安装
   [基础开发工具](https://archlinux.org/groups/x86_64/base-devel/)：

   ``` shell
   $ pacman -Syu base-devel
   ```

   下载完后提示此错误：

   > 警告：找不到公钥环。你执行 'pacman-key --init' 了吗？

   接着我们按照警告的提示执行那条命令，但是——

   重新安装还是会失败，因为我们在完成初始化之后还应该
   **重新加载默认密匙**。

   以下给出完整步骤：

   ``` shell
   $ pacman-key --init
   $ pacman-key --populate
   ```

   不出意外之后再次尝试安装一切顺利。

   ``` shell
   $ pacman -S base-devel
   ```

### 总结

到此实验环境搭建就告一段落了，🎉
以后我们将会继续使用这个 `chroot` 的 Arch Linux
环境进行实验，并且会对本节一些令人困惑的地方进行扩充。
