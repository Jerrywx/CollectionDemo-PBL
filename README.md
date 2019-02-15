## ffmpeg

#### 1、ffmpeg 下载、编译与安装

###### 1. 下载FFmpeg
```
git clone https://git.ffmpeg.org/ffmpeg.git
```
<img src="./pic/pic1.png" width = 100% height = 30% />

###### 2. 查看帮助

```
./configure --help | more
```

###### 3. 编译

生成FFmpeg编译脚本
```
./configure --prefix=/usr/local/ffmpeg --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libx264 --enable-libx265 --enable-filter=delogo --enable-debug --disable-optimizations --enable-opengl --enable-libspeex --enable-libopus --enable-libmp3lame --enable-videotoolbox --enable-shared --enable-pthreads --enable-version3 --enable-hardcoded-tables --cc=clang --host-cflags= --host-ldflags=

```

安装
```
make && make install
```

环境变量配置
```
1. 查看ffmpeg安装目录
where is ffmpeg
2. 修改换将变量文件
vim ~/.bash_profile
3. 修改内容
export PATH=$PATH:/usr/local/bin/ffmpeg
```

报错
nasm/yasm not found or too old. Use --disable-x86asm for a crippled build.

sudo apt-get install yasm

source .bash_profile

其他安装方法
**brew 安装使用**
```
1. 安装 brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. 使用 brew 安装 ffmpeg
$ brew install hugo

```

if you need to remove ffmpeg run:

brew uninstall ffmpeg


#### 2、FFmpeg 常用命令

**命令分类**
<img src="./pic/command.png" width = 100% height = 30% />

###### 1. 基本信息查询命令
<img src="./pic/chatml.png" width = 100% height = 30% />

实例
<img src="./pic/version.png" width = 100% height = 30% />

###### 2. 录制命令

```
录制视频
ffmpeg -f avfoundation -i 1 -r 30 out.yuv
播放视频
./ffplay -s 4096x2304 -pix_fmt uyvy422  ~/Desktop/out.yuv

录制音频
ffmpeg -f avfoundation -i :0 out.wav
播放音频
./ffplay ~/Desktop/out.wav

```



###### 3. 分解/复用命令

```
格式转换
ffmpeg -i v1.mp4 -vcodec copy -acodec copy v2.mov

抽取视频
ffmpeg -i v1.mp4 -an -vcodec copy v3.h264
抽取音频
ffmpeg -i v1.mp4 -acodec copy -vn 4.aac
```

###### 4. 处理原数据命令 2-6

###### 5. 裁剪与合并命令

###### 6. 图片/视频互转命令

###### 7. 直播相关命令

###### 8. 各种滤镜
