/*=======================================================================================
Copyright (c): School of Computational Microelectronics,SUAT.ALL rights reserved. 
                                                                        
  Create by:Zhenyan ZHU
      Email:suat25060340@stu.suat-sz.edu.cn
       Date:
   Filename:
Description:
    Version:
Last Change:
   
=============================================================================*/
//Global Parameter Configuration                                   
`ifndef _DRIVER_SV
`define _DRIVER_SV
                                                                  
                                                                  
`endif
/*==========================================================================*/
class driver;
    virtual counter_if vif;
    transaction tr;

    function new(input virtual counter_if vif);
        this.vif = vif;
    endfunction

    task run(int n = 10);
        for (int i = 0; i < n; i++) begin
            tr = new();
            assert(tr.randomize());
            $display("tr.load_valid=%d,tr.load_value=%d", tr.load_valid, tr.load_value);
            @(posedge vif.clk) begin
                vif.load_valid <= tr.load_valid;
                vif.load_value <= tr.load_value;
            end
        end
    endtask
endclass
