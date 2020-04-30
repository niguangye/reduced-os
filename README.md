# reduced-os
在自行实现简单OS的同时，提供本项目给后来者参考使用，力求降低将整个过程的难度

## 主要功能

- [x] Master Boot Record （mbr）
- [x] 跳入保护模式
- [x] Loader
- [x] Kernel
- [ ] 中断
- [ ] 内存管理
- [ ] 进程管理
- [ ] 输入输出系统
- [ ] 文件系统
- [ ] Shell



## 效果图



## 环境准备

- WSL2安装、同时在WSL内安装GCC、NASM、MAKE等
- bochs安装及环境变量配置
- Sublime text3 安装（可选）

## 开发编译流程

0. 见环境准备

1. 在windows环境下使用编辑器（推荐Sublime Text3）编写代码
2. 在WSL下使用GCC、NASM、MAKE编译代码、生成镜像
3. 在windows运行Bochs（bochs目录提供了简单配置）
   1. run.bat 运行镜像
   2. debug.bat 调试镜像,调试方法见docs目录

## 开发环境

- Win10
- 编译环境 Ubuntu 20.04.4 LTS（WSL2: Windows Subsystem for Linux2）
- 运行环境 Bochs 2.6.11

## 注意

强烈建议在Linux环境下开发

至少编译环节要在Linux环境下，如果使用Windows编译将会带来大量意想不到的坑

## 致谢

本操作系统主要仿照[日]**川合秀实**先生的《30天自制操作系统》一书开发

实模式跳转保护模式等部分主要参考**于渊**先生《Orange'S：一个操作系统的实现》一书

亦有参考《x86汇编语言  从实模式到保护模式》（李忠、王晓波、余洁）、《操作系统真象还原》（郑钢）等书

另感谢@nnrj同学在C语言和NASM汇编联合编译部分的无私帮助。



