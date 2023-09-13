# -*- coding: utf-8 -*-
import sys
origin = sys.stdout
f = open('t3x_chip_test.v', 'w')
sys.stdout = f

import xlrd
import datetime

wb = xlrd.open_workbook('t3x-Test-Pin-Muxing.xls')
s_names = wb.sheet_names()

all_sheet = wb.sheets()
test_pin_mux_s = wb.sheet_by_name('test pin mux')
scan_mode_s = wb.sheet_by_name('scan')

#start code
print("module chip_test (")
#interface
print("input             oscin_alwayson               ,")
print("output            cts_scan_clk                 ,")
print("input             reset_n_i_fron_pad           ,")
print("input             pwd_detecting                ,")
print("input             prod_tmode                   ,")
print("input             prod_mode_sel_sample_en      ,")
print("input             efuse_bit_no_scan            ,")
print("input             sectop_scan_dis              ,")
print("input    [5:0]    prod_mode_sel                ,")
print("input    [15:0]   poc_sig_i                    ,")
print("output   [15:0]   poc_sig_store                ,")
print("output            poc_vld                      ,")
print("output            poc_pins_are_input           ,")
print("input             prod_pwd_i                   ,")
print("output   [127:0]  prod_pwd_value               ,")
print("output            prod_pwd_valid               ,")
print("input    [59:0]   frpad_prod_i                 ,")
print("output   [59:0]   topad_prod_o                 ,")
print("output   [59:0]   topad_prod_oen               ,")
print("output   [59:0]   topad_prod_mask              ,")
print("output            tmode_scan                   ,")
print("input             cts_msr_clk_b0               ,")
print("input             cts_msr_clk_b1               ,")
print("\n")

#nonscan
for x in range(0,16):
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]

    print("//------------------mode",end = "")
    print(x,end = "")
    print("-----------------------")
    if(tmode_name.startswith("null")):
        print("//----------------------------------------------")
    elif(tmode_name.startswith("hiz")):
        print("//",end = "")
        print(tmode_name)
        print("output            ",end = "")
        print("tmode_",end = "")
        print(tmode_name,end = "")
        print(",")
    elif(tmode_name.startswith("mbist")):
        print("//",end = "")
        print(tmode_name)
        print("output            ",end = "")
        print("tmode_mbist,")
        print("output            ",end = "")
        print("tmode_mbist_clk,")
        print("input    [1699:0] ",end = "")
        print("tmode_mbist_btc_do,")
        print("output            ",end = "")
        print("tmode_mbist_btc_clk,")
        print("output            ",end = "")
        print("tmode_mbist_btc_mode,")
        print("output   [1699:0] ",end = "")
        print("tmode_mbist_btc_di,")
        print("output   [1699:0] ",end = "")
        print("tmode_mbist_btc_di,")
        print("output     [11:0] ",end = "")
        print("cpu_ram_bist_i,")
    else:
        input_message=test_pin_mux_s.cell(78,x+3).value
        tmode_i_num=int(input_message.split(":")[1])
        output_message=test_pin_mux_s.cell(77,x+3).value
        tmode_o_num=int(output_message.split(":")[1])
        print("//",end = "")
        print(tmode_name)
        print("output            ",end = "")
        print("tmode_",end = "")
        print(tmode_name,end = "")
        print(",")
        if(tmode_i_num == 0):
            print("",end = "")
        else:
            print("output      ",end = "")
            print("[",end = "")
            print(tmode_i_num-1,end = "")
            print(":0] ",end = "")
            print("tmode_",end = "")
            print(tmode_name,end = "")
            print("_i",end = "")
            print(",")

        if(tmode_o_num == 0):
            print("",end = "")
        else:
            print("input       ",end = "")
            print("[",end = "")
            print(tmode_o_num-1,end = "")
            print(":0] ",end = "")
            print("tmode_",end = "")
            print(tmode_name,end = "")
            print("_o",end = "")
            print(",")

#scan
for x in range(0,scan_mode_s.nrows-2):
    print("//------------------mode",end = "")
    scan_mode_number=int(scan_mode_s.cell(x+1,1).value)
    print(scan_mode_number,end = "")
    print("-----------------------")
    print("//",end = "")
    print(scan_mode_s.cell(x+1,2).value)
    scan_mode=scan_mode_s.cell(x+1,0).value
    scan_chain_number=int(scan_mode_s.cell(x+1,4).value)-1
    if(scan_mode.startswith("Common")):
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print(",")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_reset_n,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_se,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_cmp,")
        print("output     [",end = "")
        if(scan_chain_number < 10):
            print(" ",end = "")
            print(scan_chain_number,end = "")
        else:
            print(scan_chain_number,end = "")
        print(":0] ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_i,")
        print("input      [",end = "")
        if(scan_chain_number < 10):
            print(" ",end = "")
            print(scan_chain_number,end = "")
        else:
            print(scan_chain_number,end = "")
        print(":0] ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_o,")
        print("//-----------------------------------------------")
        
    else:
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print(",")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_reset_n,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_se,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_cmp,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_disable,")
        print("output            ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_in,")
        print("output     [",end = "")
        if(scan_chain_number < 10):
            print(" ",end = "")
            print(scan_chain_number,end = "")
        else:
            print(scan_chain_number,end = "")
        print(":0] ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_i,")
        print("input      [",end = "")
        if(scan_chain_number < 10):
            print(" ",end = "")
            print(scan_chain_number,end = "")
        else:
            print(scan_chain_number,end = "")
        print(":0] ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_o,")
        print("input             ",end = "")
        print("tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_out,")
        print("//-----------------------------------------------")
        
print("output     [13:0]   tmode_debug_out,")
print("output              tmp")
print(");")

print("")

print("//add this for timing loop design: pad -> i -> prod_sel -> tmode -> pad")
print("reg [5:0] prod_mode_sel_r;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    prod_mode_sel_r <= 6'h3F; //the last mode is reserved, please don't use it.")
print("  else if(prod_tmode)")
print("    prod_mode_sel_r <= prod_mode_sel;")
print("//for avoiding tmode* glitch")
print("reg [2:0] prod_tmode_d;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    prod_tmode_d[2:0] <= 3'h0;")
print("  else")
print("    prod_tmode_d[2:0] <= {prod_tmode_d[1:0], prod_tmode};")
print("")
print("wire  [63:0] prod_tmode_nc;")

print("")

for x in range(0, 16):
    print("  scanmux u_prod_tmode",end = "")
    print(x,end = "")
    print("  ( .Z(",end = "")
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null")):
        print("prod_tmode_nc[",end = "")
        print(x,end = "")
        print("]),",end = "")
    else:
        print("tmode_",end = "")
        print(tmode_name,end = "")
        print("),",end = "")
    print(" .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd",end = "")
    print(x,end = "")
    print(") );")

print("")

for x in range(16, 45):
    print("  scanmux u_prod_tmode",end = "")
    print(x,end = "")
    print("  ( .Z(",end = "")
    tmode=test_pin_mux_s.cell(9,x+4).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null")):
        print("prod_tmode_nc[",end = "")
        print(x,end = "")
        print("]),",end = "")
    else:
        print("tmode_scan_",end = "")
        print(tmode_name,end = "")
        print("),",end = "")
    print(" .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd",end = "")
    print(x,end = "")
    print(" & ~efuse_bit_no_scan",end = "")
    if(tmode_name.startswith("secure_top")):
        print(" & ~sectop_scan_dis) );")
    else:
        print(") );")

print("")

for x in range(45, 64):
    print("  scanmux u_prod_tmode",end = "")
    print(x,end = "")
    print("  ( .Z(",end = "")
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null")):
        print("prod_tmode_nc[",end = "")
        print(x,end = "")
        print("]),",end = "")
    else:
        print("tmode_scan_",end = "")
        print(tmode_name,end = "")
        print("),",end = "")
    print(" .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd",end = "")
    print(x,end = "")
    print(") );")

print("//at scanmux for backend define")
print("wire  tmode_scan_atspeed_pre = ")

print("")

for x in range(0,scan_mode_s.nrows-2):
    scan_mode=scan_mode_s.cell(x+1,0).value
    if(scan_mode.startswith("AT SPEED")):
        print("                               tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        if(x == scan_mode_s.nrows-3):
            print(";")
        else:
            print(" ||")

print("  scanmux u_tmode_scan_atspeed( .Z(tmode_scan_atspeed), .S(1'b0), .A(tmode_scan_atspeed_pre), .B(1'd0) );")
print("//add one cycle delay to avoid glitch when atspeed enable")
print("//reset_core = atspeed_dly1 ? (atspeed_dly2 ? 1'b1: reset_core_resetn) : other")
print("//if dly1 is earlier than dly2, then reset_core will has a glitch which is 0")
print("reg  tmode_scan_atspeed_d;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    tmode_scan_atspeed_d <= 0;")
print("  else")
print("    tmode_scan_atspeed_d <= tmode_scan_atspeed;")

print("wire  tmode_scan_pre = ")

print("")

for x in range(0,scan_mode_s.nrows-2):
    scan_mode=scan_mode_s.cell(x+1,0).value
    if(scan_mode.startswith("Common")):
        print("                       tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print(" ||")
print("                               tmode_scan_atspeed_d;")
print("  scanmux u_tmode_scan ( .Z(tmode_scan), .S(1'b0), .A(tmode_scan_pre), .B(1'd0) );")

print("")

print("//to pad_ctrl debug_bus_out for debug only")
print("assign tmode_debug_out = {")
for x in range(0,16):
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null")):
        print("",end = "")
    else:
        print("                          tmode_",end = "")
        print(tmode_name,end = "")
        print(",")
print("                          prod_tmode};")

print("")

print("//-----------------------------------------------")
print("//power on config for boot flow")
print("reg  [9:0]  reset_n_dly;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    reset_n_dly <= 0;")
print("  else")
print("    reset_n_dly <= {reset_n_dly[8:0],1'b1};")
print("wire  capture_poc_en = reset_n_dly[3] && (reset_n_dly[9:4]==0);")
print("wire  capture_poc_v = reset_n_dly[8] && (reset_n_dly[9]==0);")
print("reg  capture_poc_en_d;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    capture_poc_en_d <= 0;")
print("  else if(capture_poc_v)")
print("    capture_poc_en_d <= 0;")
print("  else if(capture_poc_en)")
print("    capture_poc_en_d <= 1;")
print("assign poc_pins_are_input = capture_poc_en_d;")
print("reg  capture_poc_v_d;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    capture_poc_v_d <= 0;")
print("  else")
print("    capture_poc_v_d <= capture_poc_v;")
print("reg  [15:0]  poc_sig_i_sync;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    poc_sig_i_sync <= 0;")
print("  else if (capture_poc_v_d)")
print("    poc_sig_i_sync <= poc_sig_i;")
print("reg  poc_sig_done;")
print("always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)")
print("  if(!reset_n_i_from_pad)")
print("    poc_sig_done <= 0;")
print("  else if (capture_poc_v_d)")
print("    poc_sig_done <= 1;")
print("assign poc_sig_store = poc_sig_i_sync;")
print("assign poc_vld = poc_sig_done;")
print("//-----------------------------------------------")
print("")
print("wire  [19:0] tmode_mbist_in;")
print("wire  [3:0] tmode_mbist_out;")
print("assign tmode_mbist_btc_clk = tmode_mbist_in[2];")
print("assign tmode_mbist_btc_mode = tmode_mbist_in[1];")
print("assign cpu_ram_bist_i = tmode_mbist_in[19:8];")
print("wire  tmode_mbsit_btc_do_and;")
print("wire  tmode_mbsit_btc_do_or;")
print("crt_ram_bist")
print("    #(.DO_BITS(1700))")
print("    u_crt_ram_bist(")
print("        .clk                        ( oscin_alwayson            ),")
print("        .reset_n                    ( reset_n_i_from_pad        ),")
print("        .tst_ram_tmode              ( tmode_mbist               ),")
print("        .test_mode                  ( tmode_scan                ),")
print("        .clk_en                     ( tmode_mbist_in[7]         ),")
print("        .bist_shift_reset           ( tmode_mbist_in[5]         ),")
print("        .bist_shift_din_en          ( tmode_mbist_in[3]         ),")
print("        .bist_shift_din             ( tmode_mbist_in[4]         ),")
print("        .bist_shift_dout_en         ( tmode_mbist_in[6]         ),")
print("        .bist_shift_dout            ( tmode_mbist_out[2]        ),")
print("        .bist_shift_dout_valid      ( tmode_mbist_out[3]        ),")
print("        .btc_di_i                   ( tmode_mbist_in[0]         ),")
print("        .btc_di_o                   ( tmode_mbist_btc_di        ),")
print("        .btc_do_i                   ( tmode_mbist_btc_do        ),")
print("        .btc_do_and                 ( tmode_mbist_out[0]        ),")
print("        .btc_do_or                  ( tmode_mbist_out[1]        ));")
print("")
print("//-----------------------------------------------")
print("")
print("crt_tmode_password u_crt_tmode_password(")
print("        .clk                ( oscin_alwayson            ),")
print("        .reset_n            ( reset_n_i_from_pad        ),")
print("        .enable             ( pwd_detecting             ),")
print("        .shift_in           ( prod_pwd_i                ),")
print("        .password_out       ( prod_pwd_value            ),")
print("        .password_valid     ( prod_pwd_valid            ));")
print("//-----------------------------------------------")
print("scanmuxN #(1) u_tmode_mbist_clk( .Z(tmode_mbist_clk), .S(!tmode_mbist), .A(oscin_alwayson), .B(1'd0) );")
print("scanmuxN #(20) u_tmode_mbist_in( .Z(tmode_mbist_in), .S(!tmode_mbist), .A(frpad_prod_i[6+:20]), .B(20'h24) );")
print("scanclkmux u_mbist_clk( .Z(cts_mbist_clk), .S(tmode_mbist), .A(1'b0), .B(oscin_alwayson) );")

print("")

for x in range(0,16):
    print("//-----------------------------------------------")
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null") or tmode_name.startswith("mbist")):
        print("",end = "")
    else:
        input_message=test_pin_mux_s.cell(78,x+3).value
        tmode_i_num=int(input_message.split(":")[1])
        if(tmode_i_num == 0):
            print("",end = "")
        else:
            print("scanmuxN #(",end = "")
            print(tmode_i_num,end = "")
            print(") u_tmode_",end = "")
            print(tmode_name,end = "")
            print("_i( .Z(tmode_",end = "")
            print(tmode_name,end = "")
            print("_i) .S(!tmode_",end = "")
            print(tmode_name,end = "")
            print("), .A(frpad_prod_i[6+:",end = "")
            print(tmode_i_num,end = "")
            print("), .B(",end = "")
            print(tmode_i_num,end = "")
            print("'d0) );")

print("")

for x in range(0,scan_mode_s.nrows-2):
    print("//-----------------------------------------------")
    scan_mode_number=int(scan_mode_s.cell(x+1,1).value)
    scan_mode=scan_mode_s.cell(x+1,0).value
    scan_chain_number=int(scan_mode_s.cell(x+1,4).value)
    if(scan_mode.startswith("Common")):
        if(scan_chain_number == 8):
            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_reset_n ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_reset_n), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[26]), .B(1'b0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_se ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_se), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[25]), .B(1'd0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_cmp ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_cmp), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[24]), .B(1'd0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_scan_clk ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_scan_clk), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );")

            print("scanmuxN #(",end = "")
            print(scan_chain_number,end = "")
            print(") u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("i ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_i), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[6+:",end = "")
            print(scan_chain_number,end = "")
            print("]), .B(8'd0) );")
        else:
            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_spc_disable ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_spc_disable), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[27]), .B(1'd0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_reset_n ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_reset_n), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[26]), .B(1'b0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_se ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_se), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[25]), .B(1'd0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_cmp ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_cmp), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[24]), .B(1'd0) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_scan_clk ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_scan_clk), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );")

            print("scanmuxN #(1) u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_spc_in ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_spc_in), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[22]), .B(1'd0) );")

            print("scanmuxN #(",end = "")
            print(scan_chain_number,end = "")
            print(") u_tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("i ( .Z(tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("_i), .S(!tmode_scan_",end = "")
            print(scan_mode_s.cell(x+1,2).value,end = "")
            print("), .A(frpad_prod_i[6+:",end = "")
            print(scan_chain_number,end = "")
            print("]), .B(16'd0) );")
    else:
        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_reset ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_reset), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[31]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_bypass ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_bypass), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[30]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_sclk ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_sclk), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[29]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_mode ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_occ_mode), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[28]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_disable ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_disable), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[27]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_reset_n ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_reset_n), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[26]), .B(1'b0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_se ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_se), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[25]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_cmp ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_cmp), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[24]), .B(1'd0) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_scan_clk ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_scan_clk), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );")

        print("scanmuxN #(1) u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_in ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_spc_in), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[22]), .B(1'd0) );")

        print("scanmuxN #(",end = "")
        print(scan_chain_number,end = "")
        print(") u_tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("i ( .Z(tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("_i), .S(!tmode_scan_",end = "")
        print(scan_mode_s.cell(x+1,2).value,end = "")
        print("), .A(frpad_prod_i[6+:",end = "")
        print(scan_chain_number,end = "")
        print("]), .B(16'd0) );")
print("")
print("//-----------------------------------------------")
print("assign cts_scan_clk = tmode_scan_core_scan_clk;")

print("")

print("wire  isin = 1'b1;")
print("wire  isout = 1'b0;")
print("parameter P_TESTPIN_NUM = 60;")
print("//bit5:0 is fixed as input for mode_sel")
print("assign topad_prod_mask[5:0] = prod_tmode ? 6'h3F : 6'h0;")
print("assign topad_prod_oen[5:0] = 6'h3F;")
print("assign topad_prod_o[5:0] = 6'd0;")

print("")

print("parameter P_TESTPIN_NUM2 = P_TESTPIN_NUM-6;")
print("crt_tmode_topad_sel #(P_TESTPIN_NUM2)")
print("u_crt_tmode_topad_sel(")

for x in range(0, 16):
    print("// (",end = "")
    print(x,end = "")
    print("):")
    tmode=test_pin_mux_s.cell(9,x+3).value
    tmode_name=tmode.split("(")[0]
    if((tmode_name.startswith("null")) or (tmode_name.startswith("normal")) or (tmode_name.startswith("hiz"))):
        print(".sel",end = "")
        print(x,end = "")
        print("           (1'b0),")
        print(".sel",end = "")
        print(x,end = "")
        print("_mask      ({{P_TESTPIN_NUM2{1'b1}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_oen       ({{P_TESTPIN_NUM2{isin}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_o         ({{P_TESTPIN_NUM2{1'b0}}}),")
    else:
        input_message=test_pin_mux_s.cell(78,x+3).value
        tmode_i_num=int(input_message.split(":")[1])
        output_message=test_pin_mux_s.cell(77,x+3).value
        tmode_o_num=int(output_message.split(":")[1])
        print(".sel",end = "")
        print(x,end = "")
        print("           (tmode_",end = "")
        print(tmode_name,end = "")
        print("),")
        
        print(".sel",end = "")
        print(x,end = "")
        print("_mask      ({{P_TESTPIN_NUM2-",end = "")
        print(tmode_i_num+tmode_o_num,end = "")
        if(tmode_o_num == 0):
            print("){1'b0}}",end = "")
        else:
            print("){1'b0},        {",end = "")
            print(tmode_o_num,end = "")
            print("{1'b1}}",end = "")
        if(tmode_i_num == 0):
            print("}),")
        else:
            print(",         {",end = "")
            print(tmode_i_num,end = "")
            print("{1'b1}}}),")

        print(".sel",end = "")
        print(x,end = "")
        print("_oen       ({{P_TESTPIN_NUM2-",end = "")
        print(tmode_i_num+tmode_o_num,end = "")
        if(tmode_o_num == 0):
            print("){isin}}",end = "")
        else:
            print("){isin},        {",end = "")
            print(tmode_o_num,end = "")
            print("{isout}}",end = "")
        if(tmode_i_num == 0):
            print("}),")
        else:
            print(",        {",end = "")
            print(tmode_i_num,end = "")
            print("{isout}}}),")

        print(".sel",end = "")
        print(x,end = "")
        print("_o         ({{P_TESTPIN_NUM2-",end = "")
        print(tmode_i_num+tmode_o_num,end = "")
        print("){1'b0'}",end = "")
        if(tmode_o_num == 0):
            print("",end = "")
        else:
            print(", tmode_",end = "")
            print(tmode_name,end = "")
            print("_o[",end = "")
            print(tmode_o_num-1,end = "")
            print(":0]",end = "")
        if(tmode_i_num == 0):
            print("}),")
        else:
            print(", {",end = "")
            print(tmode_i_num,end = "")
            print("{1'b0}}}),")

for x in range(16, 64):
    print("// (",end = "")
    print(x,end = "")
    print("):")
    tmode=test_pin_mux_s.cell(9,x+4).value
    tmode_name=tmode.split("(")[0]
    if(tmode_name.startswith("null")):
        print(".sel",end = "")
        print(x,end = "")
        print("           (1'b0),")
        print(".sel",end = "")
        print(x,end = "")
        print("_mask      ({{P_TESTPIN_NUM2{1'b1}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_oen       ({{P_TESTPIN_NUM2{isin}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_o         ({{P_TESTPIN_NUM2{1'b0}}}),")
    else:
        print(".sel",end = "")
        print(x,end = "")
        print("           (tmode_scan_",end = "")
        print(tmode_name,end = "")
        print("),")
        print(".sel",end = "")
        print(x,end = "")
        print("_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),")
        print(".sel",end = "")
        print(x,end = "")
        print("_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_",end = "")
        print(tmode_name,end = "")
        print("_spc_out, tmode_scan_",end = "")
        print(tmode_name,end = "")
        print("_o[15:0], {28{1'b0}}}),")

print("//poc:6(in)")
print(".poc             (1'b0 ),")
print(".poc_mask        ({(P_TESTPIN_NUM2){1'b0}}    ), //add poc pin control in the last mux")
print(".poc_oen         ({(P_TESTPIN_NUM2){isin}}    ),")
print(".poc_o           ({(P_TESTPIN_NUM2){1'b0}}    ),")
print("//output")
print(".topad_prod_mask (topad_prod_mask[P_TESTPIN_NUM-1:6]      ),")
print(".topad_prod_oen  (topad_prod_oen[P_TESTPIN_NUM-1:6]       ),")
print(".topad_prod_o    (topad_prod_o[P_TESTPIN_NUM-1:6]         )")
print(");")

print("")

print("endmodule")

# ===================================
sys.stdout = origin
f.close()



