# xv6

## have done
功能包括：命令：
- touch（创建一个或者多个文件）
- uptime（获取系统时间）
- cp（复制文件）
- mv（移动文件）
- editor（命令行格式的文本编辑器）
- cat（显示和文件操作）
- ren（重命名）；
- 功能：代码错误提示，历史记录，命令补全；新功能：splice（拼接文件）、cal（计算器）

## how to do
ren 命令：重新命名了 rename 命令为 ren 命令。rename.c 重命名为 ren.c，在新的 ren.c 文件中注释掉   //char * dir = argv[3]; //chdir(dir); 
并在第 9 行中添加 argc!=3，并且修改相关 makefile xv6 中的文件与文件名并不是一一对应的。多个文件名可以对应同一个文件。（当一个文件的所有文件名都与此文件失去关联时，此文件会被删除。）可以通过建立新文件名与文件的关联，取消旧文件名与文件的关联来实现对文件的重命。所以通过使用系统调用的 link 函数，将文件与新的文件名关联，再使用系统调用的
unlink 函数，取消文件与旧的文件名的关联。使用命令 ren old_filename new_filename 就可以将一个名为 old_filename 的文件转换成为 new_filename
