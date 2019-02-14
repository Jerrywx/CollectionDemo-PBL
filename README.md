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

```
./configure --prefix=/usr/local/ffmpeg --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libx264 --enable-libx265 --enable-filter=delogo --enable-debug --disable-optimizations --enable-libspeex --enable-videotoolbox --enable-shared --enable-pthreads --enable-version3 --enable-hardcoded-tables --cc=clang --host-cflags= --host-ldflags=

```


###### 2. 

#### 2、
