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
`ifndef _TB_TOP_SV
`define _TB_TOP_SV
                                                                  
                                                                  
`endif
/*==========================================================================*/
 module tb_top;
    import test_pkg::*;

    logic       clk, rstn;
    logic [3:0] out;

    counter_if dutif(clk);
    driver     my_driver;

    initial begin
        my_driver = new(dutif);
        repeat (2) @(posedge clk);
        @(posedge rstn);
        repeat (5) @(posedge clk);
        my_driver.run(20);
    end

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rstn = 1;
        repeat (2) @(posedge clk);
        rstn = 0;
        repeat (5) @(posedge clk);
        rstn = 1; repeat (50) @(posedge clk);
        $finish;
    end

    counter u_counter (
        .resetn    (rstn),
        .clk       (clk),
        .load_valid(dutif.load_valid),
        .load_value(dutif.load_value),
        .q         (out)
    );
endmodule                                                                             
                                                                              
                                                                              
