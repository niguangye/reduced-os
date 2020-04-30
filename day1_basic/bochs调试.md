# bochs调试

使用bochsdbg命令启动bochs，参数同bochs命令

# 调试指令列表

- **b 0x7c00** breakpoint  打断点
- **u /5**  反编译显示接下来的5条指令
- **n** 执行下一条指令
- **r**  显示CPU寄存器内容
- **creg** 显示CR0 - CR4 寄存器内容
- **sreg**  显示CPU全部状态信息
- **print-stack**  打印堆栈状况

- **info tab** 显示页表

- **x /1b  0x7c05**  检查位于线性地址0x7c05处的内存内容

  

## Links

[知乎回答](https://zhuanlan.zhihu.com/p/59980855)