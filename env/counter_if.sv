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
`ifndef _COUNTER_IF_SV
`define _COUNTER_IF_SV
                                                                  
                                                                  
`endif
/*==========================================================================*/
interface counter_if (input logic clk);
    logic       load_valid;
    logic [3:0] load_value;
endinterface
