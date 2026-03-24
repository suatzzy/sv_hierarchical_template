#!/bin/bash
if [ ! -d "/home/jjt/target/sv_lab/sv_hierarchical_template/" ]; then
    echo "错误：找不到模板目录！"
    exit 1
fi
# 检查是否输入了项目名称
if [ -z "$1" ]; then
    echo "用法: mk_sv_hierarchical_proj.sh <项目名称>"
    exit 1
fi

PROJ_NAME=$1

# 创建顶层项目目录
mkdir -p "$PROJ_NAME"
cd "$PROJ_NAME"

# 创建子目录结构
mkdir env rtl sim 

# 在目录下创建文件
cp /home/jjt/target/sv_lab/sv_hierarchical_template/sim/Makefile sim/Makefile
cp /home/jjt/target/sv_lab/sv_hierarchical_template/sim/dump_fsdb_vcs.tcl sim/dump_fsdb_vcs.tcl
cp /home/jjt/target/sv_lab/sv_hierarchical_template/sim/rtl.f sim/rtl.f
cp /home/jjt/target/sv_lab/sv_hierarchical_template/sim/tb.f sim/tb.f
cp /home/jjt/target/sv_lab/sv_hierarchical_template/sim/novas.rc sim/novas.rc






echo "项目 "$PROJ_NAME" 结构创建完成！"
ls ..
