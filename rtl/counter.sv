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
`ifndef _COUNTER_SV
`define _COUNTER_SV
                                                                  
                                                                  
`endif
/*==========================================================================*/
module counter(input logic resetn,
               input logic clk,
               input logic [3:0] load_value,
               input logic load_valid,
               output logic [3:0] q);

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn)
            q <= 4'd0;
        else if (load_valid)
            q <= load_value;
        else
            q <= q + 1;
    end
endmodule
