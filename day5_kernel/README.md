# README

本章主要新增内存分页机制的开启和内核的加载

主要参考《Orange'S：一个操作系统的实现》第五章

## 调试

```
# 编译
make build

# 运行
在win10系统中，进入到bochs目录，双击start.bat开始运行

# 调试
在win10系统中，进入到bochs目录，双击debug.bat开始调试

# 清理生成物
make clean
```

## 注意

注意观察makefile，loader和kernel不再使用`dd`命令直接写入img镜像

而是先将img挂载到`/mnt/floppy`目录，然后将loader和kernel复制到`/mnt/floppy`目录