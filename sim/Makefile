PLATFORM = linux64

TOP = tb_top

export TOP_LEVEL = $(TOP)

##DFILES = $(WORKAREA)/units/020502_00_lab_vcs/rtl/addr4.v \
##          $(WORKAREA)/units/020502_00_lab_vcs/rtl/addr4_test.v
DFILES = -f rtl.f
#DFILES = cat.sv class.sv
SVTB = -f tb.f
#DFILES = busifc.sv dut.sv test.sv top.sv
#SVTB = ../svtb/interface.sv \
#       ../svtb/top.sv \
#       ../run/run.sv
#VOPT = +incdir+../svtb +incdir+../rtl -y ../svtb +libext+.sv+.v

SEED = 1
VCOMP = vlogan -full64 -sverilog -timescale=1ps/1ps -l logs/comp.log -kdb
ELAB = vcs -full64 -sverilog -cm tgl+branch+fsm+line+cond -debug_access+all -l logs/elab.log -sim_res=1ps -kdb \
       -debug_pp \
       -LDFLAGS -rdynamic \
       -P ${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/novas.tab ${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/pli.a \
       +vcs+lic+wait
RUN = $(TOP).simv -cm tgl+branch+fsm+line+cond -cm_log logs/coverage_metrics.log -l logs/runsim.log +ntb_random_seed=$(SEED) \
      -ucli -i dump_fsdb_vcs.tcl \
      +fsdb+autoflush

comp:
	@mkdir -p logs
	$(VCOMP) $(DFILES) $(SVTB)
	#$(VCOMP) $(VOPT) $(DFILES)

elab:
	@mkdir -p logs
	$(ELAB) -top $(TOP) -o $(TOP).simv

elabg:
	@mkdir -p logs
	$(ELAB) $(DFILES) -top $(TOP) -o $(TOP).simv

run:
	@mkdir -p logs
	./$(RUN)
	-@mv novas_dump.log ./logs/ 2>/dev/null

rung:
	@mkdir -p logs
	./$(RUN) -gui
	-@mv novas_dump.log ./logs/ 2>/dev/null

verdi:
	verdi -dbdir $(TOP).simv.daidir -ssf $(TOP).fsdb &

clean:
	\rm -rf logs
	\rm -rf AN.DB
	\rm -rf *simv*
	\rm -rf DVEfiles
	\rm -rf csrc
	\rm -rf *vpd
	\rm -rf ucli.key
	\rm -f	*.fsdb
	\rm -rf work.lib++
	\rm	-f	verdi_config_file

all: clean comp elab run

# -debug_pp                         # 使能UCLI命令
# -LDFLAGS                          # 传递参数给VCS的linker，与以下三行配合使用
# -rdynamic                         # 指示需加载的动态库，如libsscore_vcs201209.so
# -P ${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/novas.tab
# ${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/pli.a      # 加载静态库

# -ucli -i dump_fsdb_vcs.tcl        # ucli的输入文件（-i）为tcl脚本
# +fsdb+autoflush                   # 命令行参数autoflush，一边仿真一边dump波形，如果没有该参数，那么不会dump波形，需要在ucli命令run 1ns后键入fsdbDumpFlush才会dump波形

#dump_fsdb_vcs.tcl :
#  global_env                       # tcl脚本引用环境变量，Makefile中通过export定义
#  fsdbDumpfile "$env(TOP_LEVEL).fsdb"   # 设置波形文件名，受环境变量env(TOP_LEVEL)控制  # TOP_LEVEL在makefile中使用export TOP_LEVEL=xxx
#  fsdbDumpvars 0 "$env(TOP_LEVEL)"    # 设置波形的顶层和层次，表示将tb_top作为顶层，Dump所有层次
#  run
