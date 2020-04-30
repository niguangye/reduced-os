# MBR

ipl10.asm是主引导记录

第一步，它会加载10个柱面，而os.asm编译出的程序就处在**第33扇区**开始的区域

第二步，它会跳转到os.asm编译出的程序中打印hello world

主要参考《30天自制操作系统》第一、二章

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

## 关键点

- 汇编语言基本语法
- NASM
- MBR格式
- 体验整个编译、调试流程

# 目录

- **ipl10.asm**

  > 主引导记录，读入10个柱面，并跳转到0x2c00

- **os.asm**

  > 打印hello world

- **README**

  > 本文档

- **makefile**

- **docs**

  > 说明文档



