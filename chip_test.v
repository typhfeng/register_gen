module chip_test (
input             oscin_alwayson               ,
output            cts_scan_clk                 ,
input             reset_n_i_fron_pad           ,
input             pwd_detecting                ,
input             prod_tmode                   ,
input             prod_mode_sel_sample_en      ,
input             efuse_bit_no_scan            ,
input             sectop_scan_dis              ,
input    [5:0]    prod_mode_sel                ,
input    [15:0]   poc_sig_i                    ,
output   [15:0]   poc_sig_store                ,
output            poc_vld                      ,
output            poc_pins_are_input           ,
input             prod_pwd_i                   ,
output   [127:0]  prod_pwd_value               ,
output            prod_pwd_valid               ,
input    [59:0]   frpad_prod_i                 ,
output   [59:0]   topad_prod_o                 ,
output   [59:0]   topad_prod_oen               ,
output   [59:0]   topad_prod_mask              ,
output            tmode_scan                   ,
input             cts_msr_clk_b0               ,
input             cts_msr_clk_b1               ,


//------------------mode0-----------------------
//normal
output            tmode_normal,
//------------------mode1-----------------------
//hiz
output            tmode_hiz,
//------------------mode2-----------------------
//mbist
output            tmode_mbist,
output            tmode_mbist_clk,
input    [1699:0] tmode_mbist_btc_do,
output            tmode_mbist_btc_clk,
output            tmode_mbist_btc_mode,
output   [1699:0] tmode_mbist_btc_di,
output   [1699:0] tmode_mbist_btc_di,
output     [11:0] cpu_ram_bist_i,
//------------------mode3-----------------------
//acodec
output            tmode_acodec,
output      [3:0] tmode_acodec_i,
input       [3:0] tmode_acodec_o,
//------------------mode4-----------------------
//saradc
output            tmode_saradc,
output      [21:0] tmode_saradc_i,
input       [13:0] tmode_saradc_o,
//------------------mode5-----------------------
//ethphy
output            tmode_ethphy,
output      [16:0] tmode_ethphy_i,
input       [20:0] tmode_ethphy_o,
//------------------mode6-----------------------
//tvfe
output            tmode_tvfe,
output      [17:0] tmode_tvfe_i,
input       [35:0] tmode_tvfe_o,
//------------------mode7-----------------------
//vdac
output            tmode_vdac,
output      [17:0] tmode_vdac_i,
//------------------mode8-----------------------
//lvds
output            tmode_lvds,
input       [49:0] tmode_lvds_o,
//------------------mode9-----------------------
//----------------------------------------------
//------------------mode10-----------------------
//vgd
output            tmode_vgd,
output      [4:0] tmode_vgd_i,
input       [2:0] tmode_vgd_o,
//------------------mode11-----------------------
//earctx
output            tmode_earctx,
output      [23:0] tmode_earctx_i,
input       [2:0] tmode_earctx_o,
//------------------mode12-----------------------
//hdmirx
output            tmode_hdmirx,
input       [39:0] tmode_hdmirx_o,
//------------------mode13-----------------------
//----------------------------------------------
//------------------mode14-----------------------
//----------------------------------------------
//------------------mode15-----------------------
//----------------------------------------------
//------------------mode16-----------------------
//chip_top
output            tmode_scan_chip_top,
output            tmode_scan_chip_top_reset_n,
output            tmode_scan_chip_top_se,
output            tmode_scan_chip_top_cmp,
output     [15:0] tmode_scan_chip_top_i,
input      [15:0] tmode_scan_chip_top_o,
//-----------------------------------------------
//------------------mode17-----------------------
//dsp
output            tmode_scan_dsp,
output            tmode_scan_dsp_reset_n,
output            tmode_scan_dsp_se,
output            tmode_scan_dsp_cmp,
output            tmode_scan_dsp_spc_disable,
output            tmode_scan_dsp_spc_in,
output     [15:0] tmode_scan_dsp_i,
input      [15:0] tmode_scan_dsp_o,
input             tmode_scan_dsp_spc_out,
//-----------------------------------------------
//------------------mode18-----------------------
//secure_top
output            tmode_scan_secure_top,
output            tmode_scan_secure_top_reset_n,
output            tmode_scan_secure_top_se,
output            tmode_scan_secure_top_cmp,
output     [15:0] tmode_scan_secure_top_i,
input      [15:0] tmode_scan_secure_top_o,
//-----------------------------------------------
//------------------mode21-----------------------
//cpu
output            tmode_scan_cpu,
output            tmode_scan_cpu_reset_n,
output            tmode_scan_cpu_se,
output            tmode_scan_cpu_cmp,
output            tmode_scan_cpu_spc_disable,
output            tmode_scan_cpu_spc_in,
output     [15:0] tmode_scan_cpu_i,
input      [15:0] tmode_scan_cpu_o,
input             tmode_scan_cpu_spc_out,
//-----------------------------------------------
//------------------mode22-----------------------
//sys_wrapper
output            tmode_scan_sys_wrapper,
output            tmode_scan_sys_wrapper_reset_n,
output            tmode_scan_sys_wrapper_se,
output            tmode_scan_sys_wrapper_cmp,
output     [15:0] tmode_scan_sys_wrapper_i,
input      [15:0] tmode_scan_sys_wrapper_o,
//-----------------------------------------------
//------------------mode23-----------------------
//mali
output            tmode_scan_mali,
output            tmode_scan_mali_reset_n,
output            tmode_scan_mali_se,
output            tmode_scan_mali_cmp,
output            tmode_scan_mali_spc_disable,
output            tmode_scan_mali_spc_in,
output     [15:0] tmode_scan_mali_i,
input      [15:0] tmode_scan_mali_o,
input             tmode_scan_mali_spc_out,
//-----------------------------------------------
//------------------mode25-----------------------
//usb_pcie_comb0
output            tmode_scan_usb_pcie_comb0,
output            tmode_scan_usb_pcie_comb0_reset_n,
output            tmode_scan_usb_pcie_comb0_se,
output            tmode_scan_usb_pcie_comb0_cmp,
output     [15:0] tmode_scan_usb_pcie_comb0_i,
input      [15:0] tmode_scan_usb_pcie_comb0_o,
//-----------------------------------------------
//------------------mode26-----------------------
//usb30a_dig_phy
output            tmode_scan_usb30a_dig_phy,
output            tmode_scan_usb30a_dig_phy_reset_n,
output            tmode_scan_usb30a_dig_phy_se,
output            tmode_scan_usb30a_dig_phy_cmp,
output     [ 7:0] tmode_scan_usb30a_dig_phy_i,
input      [ 7:0] tmode_scan_usb30a_dig_phy_o,
//-----------------------------------------------
//------------------mode27-----------------------
//usb30b_dig_phy
output            tmode_scan_usb30b_dig_phy,
output            tmode_scan_usb30b_dig_phy_reset_n,
output            tmode_scan_usb30b_dig_phy_se,
output            tmode_scan_usb30b_dig_phy_cmp,
output     [ 7:0] tmode_scan_usb30b_dig_phy_i,
input      [ 7:0] tmode_scan_usb30b_dig_phy_o,
//-----------------------------------------------
//------------------mode28-----------------------
//usb_pcie_comb1
output            tmode_scan_usb_pcie_comb1,
output            tmode_scan_usb_pcie_comb1_reset_n,
output            tmode_scan_usb_pcie_comb1_se,
output            tmode_scan_usb_pcie_comb1_cmp,
output     [15:0] tmode_scan_usb_pcie_comb1_i,
input      [15:0] tmode_scan_usb_pcie_comb1_o,
//-----------------------------------------------
//------------------mode29-----------------------
//noc_dmc
output            tmode_scan_noc_dmc,
output            tmode_scan_noc_dmc_reset_n,
output            tmode_scan_noc_dmc_se,
output            tmode_scan_noc_dmc_cmp,
output            tmode_scan_noc_dmc_spc_disable,
output            tmode_scan_noc_dmc_spc_in,
output     [15:0] tmode_scan_noc_dmc_i,
input      [15:0] tmode_scan_noc_dmc_o,
input             tmode_scan_noc_dmc_spc_out,
//-----------------------------------------------
//------------------mode33-----------------------
//vge_top
output            tmode_scan_vge_top,
output            tmode_scan_vge_top_reset_n,
output            tmode_scan_vge_top_se,
output            tmode_scan_vge_top_cmp,
output            tmode_scan_vge_top_spc_disable,
output            tmode_scan_vge_top_spc_in,
output     [15:0] tmode_scan_vge_top_i,
input      [15:0] tmode_scan_vge_top_o,
input             tmode_scan_vge_top_spc_out,
//-----------------------------------------------
//------------------mode36-----------------------
//nna
output            tmode_scan_nna,
output            tmode_scan_nna_reset_n,
output            tmode_scan_nna_se,
output            tmode_scan_nna_cmp,
output            tmode_scan_nna_spc_disable,
output            tmode_scan_nna_spc_in,
output     [15:0] tmode_scan_nna_i,
input      [15:0] tmode_scan_nna_o,
input             tmode_scan_nna_spc_out,
//-----------------------------------------------
//------------------mode38-----------------------
//dos_top
output            tmode_scan_dos_top,
output            tmode_scan_dos_top_reset_n,
output            tmode_scan_dos_top_se,
output            tmode_scan_dos_top_cmp,
output            tmode_scan_dos_top_spc_disable,
output            tmode_scan_dos_top_spc_in,
output     [15:0] tmode_scan_dos_top_i,
input      [15:0] tmode_scan_dos_top_o,
input             tmode_scan_dos_top_spc_out,
//-----------------------------------------------
//------------------mode39-----------------------
//hevc
output            tmode_scan_hevc,
output            tmode_scan_hevc_reset_n,
output            tmode_scan_hevc_se,
output            tmode_scan_hevc_cmp,
output            tmode_scan_hevc_spc_disable,
output            tmode_scan_hevc_spc_in,
output     [15:0] tmode_scan_hevc_i,
input      [15:0] tmode_scan_hevc_o,
input             tmode_scan_hevc_spc_out,
//-----------------------------------------------
//------------------mode40-----------------------
//vpu_hdmi
output            tmode_scan_vpu_hdmi,
output            tmode_scan_vpu_hdmi_reset_n,
output            tmode_scan_vpu_hdmi_se,
output            tmode_scan_vpu_hdmi_cmp,
output            tmode_scan_vpu_hdmi_spc_disable,
output            tmode_scan_vpu_hdmi_spc_in,
output     [15:0] tmode_scan_vpu_hdmi_i,
input      [15:0] tmode_scan_vpu_hdmi_o,
input             tmode_scan_vpu_hdmi_spc_out,
//-----------------------------------------------
//------------------mode41-----------------------
//dolby
output            tmode_scan_dolby,
output            tmode_scan_dolby_reset_n,
output            tmode_scan_dolby_se,
output            tmode_scan_dolby_cmp,
output            tmode_scan_dolby_spc_disable,
output            tmode_scan_dolby_spc_in,
output     [15:0] tmode_scan_dolby_i,
input      [15:0] tmode_scan_dolby_o,
input             tmode_scan_dolby_spc_out,
//-----------------------------------------------
//------------------mode42-----------------------
//vi_top_clk1
output            tmode_scan_vi_top_clk1,
output            tmode_scan_vi_top_clk1_reset_n,
output            tmode_scan_vi_top_clk1_se,
output            tmode_scan_vi_top_clk1_cmp,
output            tmode_scan_vi_top_clk1_spc_disable,
output            tmode_scan_vi_top_clk1_spc_in,
output     [15:0] tmode_scan_vi_top_clk1_i,
input      [15:0] tmode_scan_vi_top_clk1_o,
input             tmode_scan_vi_top_clk1_spc_out,
//-----------------------------------------------
//------------------mode43-----------------------
//vi_top_clk2
output            tmode_scan_vi_top_clk2,
output            tmode_scan_vi_top_clk2_reset_n,
output            tmode_scan_vi_top_clk2_se,
output            tmode_scan_vi_top_clk2_cmp,
output            tmode_scan_vi_top_clk2_spc_disable,
output            tmode_scan_vi_top_clk2_spc_in,
output     [15:0] tmode_scan_vi_top_clk2_i,
input      [15:0] tmode_scan_vi_top_clk2_o,
input             tmode_scan_vi_top_clk2_spc_out,
//-----------------------------------------------
//------------------mode44-----------------------
//hdmirx
output            tmode_scan_hdmirx,
output            tmode_scan_hdmirx_reset_n,
output            tmode_scan_hdmirx_se,
output            tmode_scan_hdmirx_cmp,
output     [15:0] tmode_scan_hdmirx_i,
input      [15:0] tmode_scan_hdmirx_o,
//-----------------------------------------------
//------------------mode47-----------------------
//tcon
output            tmode_scan_tcon,
output            tmode_scan_tcon_reset_n,
output            tmode_scan_tcon_se,
output            tmode_scan_tcon_cmp,
output            tmode_scan_tcon_spc_disable,
output            tmode_scan_tcon_spc_in,
output     [15:0] tmode_scan_tcon_i,
input      [15:0] tmode_scan_tcon_o,
input             tmode_scan_tcon_spc_out,
//-----------------------------------------------
//------------------mode48-----------------------
//demod
output            tmode_scan_demod,
output            tmode_scan_demod_reset_n,
output            tmode_scan_demod_se,
output            tmode_scan_demod_cmp,
output     [15:0] tmode_scan_demod_i,
input      [15:0] tmode_scan_demod_o,
//-----------------------------------------------
//------------------mode49-----------------------
//frc_top
output            tmode_scan_frc_top,
output            tmode_scan_frc_top_reset_n,
output            tmode_scan_frc_top_se,
output            tmode_scan_frc_top_cmp,
output            tmode_scan_frc_top_spc_disable,
output            tmode_scan_frc_top_spc_in,
output     [15:0] tmode_scan_frc_top_i,
input      [15:0] tmode_scan_frc_top_o,
input             tmode_scan_frc_top_spc_out,
//-----------------------------------------------
output     [13:0]   tmode_debug_out,
output              tmp
);

//add this for timing loop design: pad -> i -> prod_sel -> tmode -> pad
reg [5:0] prod_mode_sel_r;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    prod_mode_sel_r <= 6'h3F; //the last mode is reserved, please don't use it.
  else if(prod_tmode)
    prod_mode_sel_r <= prod_mode_sel;
//for avoiding tmode* glitch
reg [2:0] prod_tmode_d;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    prod_tmode_d[2:0] <= 3'h0;
  else
    prod_tmode_d[2:0] <= {prod_tmode_d[1:0], prod_tmode};

wire  [63:0] prod_tmode_nc;

  scanmux u_prod_tmode0  ( .Z(tmode_normal), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd0) );
  scanmux u_prod_tmode1  ( .Z(tmode_hiz), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd1) );
  scanmux u_prod_tmode2  ( .Z(tmode_mbist), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd2) );
  scanmux u_prod_tmode3  ( .Z(tmode_acodec), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd3) );
  scanmux u_prod_tmode4  ( .Z(tmode_saradc), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd4) );
  scanmux u_prod_tmode5  ( .Z(tmode_ethphy), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd5) );
  scanmux u_prod_tmode6  ( .Z(tmode_tvfe), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd6) );
  scanmux u_prod_tmode7  ( .Z(tmode_vdac), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd7) );
  scanmux u_prod_tmode8  ( .Z(tmode_lvds), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd8) );
  scanmux u_prod_tmode9  ( .Z(prod_tmode_nc[9]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd9) );
  scanmux u_prod_tmode10  ( .Z(tmode_vgd), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd10) );
  scanmux u_prod_tmode11  ( .Z(tmode_earctx), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd11) );
  scanmux u_prod_tmode12  ( .Z(tmode_hdmirx), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd12) );
  scanmux u_prod_tmode13  ( .Z(prod_tmode_nc[13]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd13) );
  scanmux u_prod_tmode14  ( .Z(prod_tmode_nc[14]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd14) );
  scanmux u_prod_tmode15  ( .Z(prod_tmode_nc[15]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd15) );

  scanmux u_prod_tmode16  ( .Z(tmode_scan_chip_top), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd16 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode17  ( .Z(tmode_scan_dsp), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd17 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode18  ( .Z(tmode_scan_secure_top), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd18 & ~efuse_bit_no_scan & ~sectop_scan_dis) );
  scanmux u_prod_tmode19  ( .Z(prod_tmode_nc[19]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd19 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode20  ( .Z(prod_tmode_nc[20]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd20 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode21  ( .Z(tmode_scan_cpu), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd21 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode22  ( .Z(tmode_scan_sys_wrapper), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd22 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode23  ( .Z(tmode_scan_mali), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd23 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode24  ( .Z(prod_tmode_nc[24]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd24 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode25  ( .Z(tmode_scan_ usb_ pcie_comb0), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd25 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode26  ( .Z(tmode_scan_usb30a_dig_phy), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd26 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode27  ( .Z(tmode_scan_usb30b_dig_phy), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd27 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode28  ( .Z(tmode_scan_usb_pcie_comb1), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd28 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode29  ( .Z(tmode_scan_noc_dmc), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd29 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode30  ( .Z(prod_tmode_nc[30]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd30 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode31  ( .Z(prod_tmode_nc[31]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd31 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode32  ( .Z(prod_tmode_nc[32]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd32 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode33  ( .Z(tmode_scan_vge_top), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd33 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode34  ( .Z(prod_tmode_nc[34]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd34 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode35  ( .Z(prod_tmode_nc[35]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd35 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode36  ( .Z(tmode_scan_nna), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd36 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode37  ( .Z(prod_tmode_nc[37]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd37 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode38  ( .Z(tmode_scan_dos_top), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd38 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode39  ( .Z(tmode_scan_hevc), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd39 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode40  ( .Z(tmode_scan_vpu_hdmi), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd40 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode41  ( .Z(tmode_scan_dolby), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd41 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode42  ( .Z(tmode_scan_vi_top_clk1), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd42 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode43  ( .Z(tmode_scan_vi_top_clk2), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd43 & ~efuse_bit_no_scan) );
  scanmux u_prod_tmode44  ( .Z(tmode_scan_hdmirx), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd44 & ~efuse_bit_no_scan) );

  scanmux u_prod_tmode45  ( .Z(tmode_scan_hdmirx), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd45) );
  scanmux u_prod_tmode46  ( .Z(prod_tmode_nc[46]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd46) );
  scanmux u_prod_tmode47  ( .Z(prod_tmode_nc[47]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd47) );
  scanmux u_prod_tmode48  ( .Z(tmode_scan_tcon), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd48) );
  scanmux u_prod_tmode49  ( .Z(tmode_scan_demod), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd49) );
  scanmux u_prod_tmode50  ( .Z(tmode_scan_frc_top), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd50) );
  scanmux u_prod_tmode51  ( .Z(prod_tmode_nc[51]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd51) );
  scanmux u_prod_tmode52  ( .Z(prod_tmode_nc[52]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd52) );
  scanmux u_prod_tmode53  ( .Z(prod_tmode_nc[53]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd53) );
  scanmux u_prod_tmode54  ( .Z(prod_tmode_nc[54]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd54) );
  scanmux u_prod_tmode55  ( .Z(prod_tmode_nc[55]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd55) );
  scanmux u_prod_tmode56  ( .Z(prod_tmode_nc[56]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd56) );
  scanmux u_prod_tmode57  ( .Z(prod_tmode_nc[57]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd57) );
  scanmux u_prod_tmode58  ( .Z(prod_tmode_nc[58]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd58) );
  scanmux u_prod_tmode59  ( .Z(prod_tmode_nc[59]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd59) );
  scanmux u_prod_tmode60  ( .Z(prod_tmode_nc[60]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd60) );
  scanmux u_prod_tmode61  ( .Z(prod_tmode_nc[61]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd61) );
  scanmux u_prod_tmode62  ( .Z(prod_tmode_nc[62]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd62) );
  scanmux u_prod_tmode63  ( .Z(prod_tmode_nc[63]), .S(prod_tmode_d[2]), .A(1'b0), .B(prod_mode_sel_r[5:0] == 6'd63) );
//at scanmux for backend define
wire  tmode_scan_atspeed_pre = 

                               tmode_scan_dsp ||
                               tmode_scan_cpu ||
                               tmode_scan_mali ||
                               tmode_scan_noc_dmc ||
                               tmode_scan_vge_top ||
                               tmode_scan_nna ||
                               tmode_scan_dos_top ||
                               tmode_scan_hevc ||
                               tmode_scan_vpu_hdmi ||
                               tmode_scan_dolby ||
                               tmode_scan_vi_top_clk1 ||
                               tmode_scan_vi_top_clk2 ||
                               tmode_scan_tcon ||
                               tmode_scan_frc_top;
  scanmux u_tmode_scan_atspeed( .Z(tmode_scan_atspeed), .S(1'b0), .A(tmode_scan_atspeed_pre), .B(1'd0) );
//add one cycle delay to avoid glitch when atspeed enable
//reset_core = atspeed_dly1 ? (atspeed_dly2 ? 1'b1: reset_core_resetn) : other
//if dly1 is earlier than dly2, then reset_core will has a glitch which is 0
reg  tmode_scan_atspeed_d;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    tmode_scan_atspeed_d <= 0;
  else
    tmode_scan_atspeed_d <= tmode_scan_atspeed;
wire  tmode_scan_pre = 

                       tmode_scan_chip_top ||
                       tmode_scan_secure_top ||
                       tmode_scan_sys_wrapper ||
                       tmode_scan_usb_pcie_comb0 ||
                       tmode_scan_usb30a_dig_phy ||
                       tmode_scan_usb30b_dig_phy ||
                       tmode_scan_usb_pcie_comb1 ||
                       tmode_scan_hdmirx ||
                       tmode_scan_demod ||
                               tmode_scan_atspeed_d;
  scanmux u_tmode_scan ( .Z(tmode_scan), .S(1'b0), .A(tmode_scan_pre), .B(1'd0) );

//to pad_ctrl debug_bus_out for debug only
assign tmode_debug_out = {
                          tmode_normal,
                          tmode_hiz,
                          tmode_mbist,
                          tmode_acodec,
                          tmode_saradc,
                          tmode_ethphy,
                          tmode_tvfe,
                          tmode_vdac,
                          tmode_lvds,
                          tmode_vgd,
                          tmode_earctx,
                          tmode_hdmirx,
                          prod_tmode};

//-----------------------------------------------
//power on config for boot flow
reg  [9:0]  reset_n_dly;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    reset_n_dly <= 0;
  else
    reset_n_dly <= {reset_n_dly[8:0],1'b1};
wire  capture_poc_en = reset_n_dly[3] && (reset_n_dly[9:4]==0);
wire  capture_poc_v = reset_n_dly[8] && (reset_n_dly[9]==0);
reg  capture_poc_en_d;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    capture_poc_en_d <= 0;
  else if(capture_poc_v)
    capture_poc_en_d <= 0;
  else if(capture_poc_en)
    capture_poc_en_d <= 1;
assign poc_pins_are_input = capture_poc_en_d;
reg  capture_poc_v_d;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    capture_poc_v_d <= 0;
  else
    capture_poc_v_d <= capture_poc_v;
reg  [15:0]  poc_sig_i_sync;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    poc_sig_i_sync <= 0;
  else if (capture_poc_v_d)
    poc_sig_i_sync <= poc_sig_i;
reg  poc_sig_done;
always @ (posedge oscin_alwayson or negedge reset_n_i_from_pad)
  if(!reset_n_i_from_pad)
    poc_sig_done <= 0;
  else if (capture_poc_v_d)
    poc_sig_done <= 1;
assign poc_sig_store = poc_sig_i_sync;
assign poc_vld = poc_sig_done;
//-----------------------------------------------

wire  [19:0] tmode_mbist_in;
wire  [3:0] tmode_mbist_out;
assign tmode_mbist_btc_clk = tmode_mbist_in[2];
assign tmode_mbist_btc_mode = tmode_mbist_in[1];
assign cpu_ram_bist_i = tmode_mbist_in[19:8];
wire  tmode_mbsit_btc_do_and;
wire  tmode_mbsit_btc_do_or;
crt_ram_bist
    #(.DO_BITS(1700))
    u_crt_ram_bist(
        .clk                        ( oscin_alwayson            ),
        .reset_n                    ( reset_n_i_from_pad        ),
        .tst_ram_tmode              ( tmode_mbist               ),
        .test_mode                  ( tmode_scan                ),
        .clk_en                     ( tmode_mbist_in[7]         ),
        .bist_shift_reset           ( tmode_mbist_in[5]         ),
        .bist_shift_din_en          ( tmode_mbist_in[3]         ),
        .bist_shift_din             ( tmode_mbist_in[4]         ),
        .bist_shift_dout_en         ( tmode_mbist_in[6]         ),
        .bist_shift_dout            ( tmode_mbist_out[2]        ),
        .bist_shift_dout_valid      ( tmode_mbist_out[3]        ),
        .btc_di_i                   ( tmode_mbist_in[0]         ),
        .btc_di_o                   ( tmode_mbist_btc_di        ),
        .btc_do_i                   ( tmode_mbist_btc_do        ),
        .btc_do_and                 ( tmode_mbist_out[0]        ),
        .btc_do_or                  ( tmode_mbist_out[1]        ));

//-----------------------------------------------

crt_tmode_password u_crt_tmode_password(
        .clk                ( oscin_alwayson            ),
        .reset_n            ( reset_n_i_from_pad        ),
        .enable             ( pwd_detecting             ),
        .shift_in           ( prod_pwd_i                ),
        .password_out       ( prod_pwd_value            ),
        .password_valid     ( prod_pwd_valid            ));
//-----------------------------------------------
scanmuxN #(1) u_tmode_mbist_clk( .Z(tmode_mbist_clk), .S(!tmode_mbist), .A(oscin_alwayson), .B(1'd0) );
scanmuxN #(20) u_tmode_mbist_in( .Z(tmode_mbist_in), .S(!tmode_mbist), .A(frpad_prod_i[6+:20]), .B(20'h24) );
scanclkmux u_mbist_clk( .Z(cts_mbist_clk), .S(tmode_mbist), .A(1'b0), .B(oscin_alwayson) );

//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
scanmuxN #(4) u_tmode_acodec_i( .Z(tmode_acodec_i) .S(!tmode_acodec), .A(frpad_prod_i[6+:4), .B(4'd0) );
//-----------------------------------------------
scanmuxN #(22) u_tmode_saradc_i( .Z(tmode_saradc_i) .S(!tmode_saradc), .A(frpad_prod_i[6+:22), .B(22'd0) );
//-----------------------------------------------
scanmuxN #(17) u_tmode_ethphy_i( .Z(tmode_ethphy_i) .S(!tmode_ethphy), .A(frpad_prod_i[6+:17), .B(17'd0) );
//-----------------------------------------------
scanmuxN #(18) u_tmode_tvfe_i( .Z(tmode_tvfe_i) .S(!tmode_tvfe), .A(frpad_prod_i[6+:18), .B(18'd0) );
//-----------------------------------------------
scanmuxN #(18) u_tmode_vdac_i( .Z(tmode_vdac_i) .S(!tmode_vdac), .A(frpad_prod_i[6+:18), .B(18'd0) );
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
scanmuxN #(5) u_tmode_vgd_i( .Z(tmode_vgd_i) .S(!tmode_vgd), .A(frpad_prod_i[6+:5), .B(5'd0) );
//-----------------------------------------------
scanmuxN #(24) u_tmode_earctx_i( .Z(tmode_earctx_i) .S(!tmode_earctx), .A(frpad_prod_i[6+:24), .B(24'd0) );
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------

//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_chip_top_spc_disable ( .Z(tmode_scan_chip_top_spc_disable), .S(!tmode_scan_chip_top), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_chip_top_reset_n ( .Z(tmode_scan_chip_top_reset_n), .S(!tmode_scan_chip_top), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_chip_top_se ( .Z(tmode_scan_chip_top_se), .S(!tmode_scan_chip_top), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_chip_top_cmp ( .Z(tmode_scan_chip_top_cmp), .S(!tmode_scan_chip_top), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_chip_top_scan_clk ( .Z(tmode_scan_chip_top_scan_clk), .S(!tmode_scan_chip_top), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_chip_top_spc_in ( .Z(tmode_scan_chip_top_spc_in), .S(!tmode_scan_chip_top), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_chip_topi ( .Z(tmode_scan_chip_top_i), .S(!tmode_scan_chip_top), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_dsp_occ_reset ( .Z(tmode_scan_dsp_occ_reset), .S(!tmode_scan_dsp), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_occ_bypass ( .Z(tmode_scan_dsp_occ_bypass), .S(!tmode_scan_dsp), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_occ_sclk ( .Z(tmode_scan_dsp_occ_sclk), .S(!tmode_scan_dsp), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_occ_mode ( .Z(tmode_scan_dsp_occ_mode), .S(!tmode_scan_dsp), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_spc_disable ( .Z(tmode_scan_dsp_spc_disable), .S(!tmode_scan_dsp), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_reset_n ( .Z(tmode_scan_dsp_reset_n), .S(!tmode_scan_dsp), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_dsp_se ( .Z(tmode_scan_dsp_se), .S(!tmode_scan_dsp), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_cmp ( .Z(tmode_scan_dsp_cmp), .S(!tmode_scan_dsp), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dsp_scan_clk ( .Z(tmode_scan_dsp_scan_clk), .S(!tmode_scan_dsp), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_dsp_spc_in ( .Z(tmode_scan_dsp_spc_in), .S(!tmode_scan_dsp), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_dspi ( .Z(tmode_scan_dsp_i), .S(!tmode_scan_dsp), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_secure_top_spc_disable ( .Z(tmode_scan_secure_top_spc_disable), .S(!tmode_scan_secure_top), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_secure_top_reset_n ( .Z(tmode_scan_secure_top_reset_n), .S(!tmode_scan_secure_top), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_secure_top_se ( .Z(tmode_scan_secure_top_se), .S(!tmode_scan_secure_top), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_secure_top_cmp ( .Z(tmode_scan_secure_top_cmp), .S(!tmode_scan_secure_top), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_secure_top_scan_clk ( .Z(tmode_scan_secure_top_scan_clk), .S(!tmode_scan_secure_top), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_secure_top_spc_in ( .Z(tmode_scan_secure_top_spc_in), .S(!tmode_scan_secure_top), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_secure_topi ( .Z(tmode_scan_secure_top_i), .S(!tmode_scan_secure_top), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_cpu_occ_reset ( .Z(tmode_scan_cpu_occ_reset), .S(!tmode_scan_cpu), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_occ_bypass ( .Z(tmode_scan_cpu_occ_bypass), .S(!tmode_scan_cpu), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_occ_sclk ( .Z(tmode_scan_cpu_occ_sclk), .S(!tmode_scan_cpu), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_occ_mode ( .Z(tmode_scan_cpu_occ_mode), .S(!tmode_scan_cpu), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_spc_disable ( .Z(tmode_scan_cpu_spc_disable), .S(!tmode_scan_cpu), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_reset_n ( .Z(tmode_scan_cpu_reset_n), .S(!tmode_scan_cpu), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_cpu_se ( .Z(tmode_scan_cpu_se), .S(!tmode_scan_cpu), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_cmp ( .Z(tmode_scan_cpu_cmp), .S(!tmode_scan_cpu), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_cpu_scan_clk ( .Z(tmode_scan_cpu_scan_clk), .S(!tmode_scan_cpu), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_cpu_spc_in ( .Z(tmode_scan_cpu_spc_in), .S(!tmode_scan_cpu), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_cpui ( .Z(tmode_scan_cpu_i), .S(!tmode_scan_cpu), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_sys_wrapper_spc_disable ( .Z(tmode_scan_sys_wrapper_spc_disable), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_sys_wrapper_reset_n ( .Z(tmode_scan_sys_wrapper_reset_n), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_sys_wrapper_se ( .Z(tmode_scan_sys_wrapper_se), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_sys_wrapper_cmp ( .Z(tmode_scan_sys_wrapper_cmp), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_sys_wrapper_scan_clk ( .Z(tmode_scan_sys_wrapper_scan_clk), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_sys_wrapper_spc_in ( .Z(tmode_scan_sys_wrapper_spc_in), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_sys_wrapperi ( .Z(tmode_scan_sys_wrapper_i), .S(!tmode_scan_sys_wrapper), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_mali_occ_reset ( .Z(tmode_scan_mali_occ_reset), .S(!tmode_scan_mali), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_occ_bypass ( .Z(tmode_scan_mali_occ_bypass), .S(!tmode_scan_mali), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_occ_sclk ( .Z(tmode_scan_mali_occ_sclk), .S(!tmode_scan_mali), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_occ_mode ( .Z(tmode_scan_mali_occ_mode), .S(!tmode_scan_mali), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_spc_disable ( .Z(tmode_scan_mali_spc_disable), .S(!tmode_scan_mali), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_reset_n ( .Z(tmode_scan_mali_reset_n), .S(!tmode_scan_mali), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_mali_se ( .Z(tmode_scan_mali_se), .S(!tmode_scan_mali), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_cmp ( .Z(tmode_scan_mali_cmp), .S(!tmode_scan_mali), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_mali_scan_clk ( .Z(tmode_scan_mali_scan_clk), .S(!tmode_scan_mali), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_mali_spc_in ( .Z(tmode_scan_mali_spc_in), .S(!tmode_scan_mali), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_malii ( .Z(tmode_scan_mali_i), .S(!tmode_scan_mali), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_spc_disable ( .Z(tmode_scan_usb_pcie_comb0_spc_disable), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_reset_n ( .Z(tmode_scan_usb_pcie_comb0_reset_n), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_se ( .Z(tmode_scan_usb_pcie_comb0_se), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_cmp ( .Z(tmode_scan_usb_pcie_comb0_cmp), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_scan_clk ( .Z(tmode_scan_usb_pcie_comb0_scan_clk), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb0_spc_in ( .Z(tmode_scan_usb_pcie_comb0_spc_in), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_usb_pcie_comb0i ( .Z(tmode_scan_usb_pcie_comb0_i), .S(!tmode_scan_usb_pcie_comb0), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_usb30a_dig_phy_reset_n ( .Z(tmode_scan_usb30a_dig_phy_reset_n), .S(!tmode_scan_usb30a_dig_phy), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_usb30a_dig_phy_se ( .Z(tmode_scan_usb30a_dig_phy_se), .S(!tmode_scan_usb30a_dig_phy), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb30a_dig_phy_cmp ( .Z(tmode_scan_usb30a_dig_phy_cmp), .S(!tmode_scan_usb30a_dig_phy), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb30a_dig_phy_scan_clk ( .Z(tmode_scan_usb30a_dig_phy_scan_clk), .S(!tmode_scan_usb30a_dig_phy), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(8) u_tmode_scan_usb30a_dig_phyi ( .Z(tmode_scan_usb30a_dig_phy_i), .S(!tmode_scan_usb30a_dig_phy), .A(frpad_prod_i[6+:8]), .B(8'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_usb30b_dig_phy_reset_n ( .Z(tmode_scan_usb30b_dig_phy_reset_n), .S(!tmode_scan_usb30b_dig_phy), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_usb30b_dig_phy_se ( .Z(tmode_scan_usb30b_dig_phy_se), .S(!tmode_scan_usb30b_dig_phy), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb30b_dig_phy_cmp ( .Z(tmode_scan_usb30b_dig_phy_cmp), .S(!tmode_scan_usb30b_dig_phy), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb30b_dig_phy_scan_clk ( .Z(tmode_scan_usb30b_dig_phy_scan_clk), .S(!tmode_scan_usb30b_dig_phy), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(8) u_tmode_scan_usb30b_dig_phyi ( .Z(tmode_scan_usb30b_dig_phy_i), .S(!tmode_scan_usb30b_dig_phy), .A(frpad_prod_i[6+:8]), .B(8'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_spc_disable ( .Z(tmode_scan_usb_pcie_comb1_spc_disable), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_reset_n ( .Z(tmode_scan_usb_pcie_comb1_reset_n), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_se ( .Z(tmode_scan_usb_pcie_comb1_se), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_cmp ( .Z(tmode_scan_usb_pcie_comb1_cmp), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_scan_clk ( .Z(tmode_scan_usb_pcie_comb1_scan_clk), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_usb_pcie_comb1_spc_in ( .Z(tmode_scan_usb_pcie_comb1_spc_in), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_usb_pcie_comb1i ( .Z(tmode_scan_usb_pcie_comb1_i), .S(!tmode_scan_usb_pcie_comb1), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_noc_dmc_occ_reset ( .Z(tmode_scan_noc_dmc_occ_reset), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_occ_bypass ( .Z(tmode_scan_noc_dmc_occ_bypass), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_occ_sclk ( .Z(tmode_scan_noc_dmc_occ_sclk), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_occ_mode ( .Z(tmode_scan_noc_dmc_occ_mode), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_spc_disable ( .Z(tmode_scan_noc_dmc_spc_disable), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_reset_n ( .Z(tmode_scan_noc_dmc_reset_n), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_se ( .Z(tmode_scan_noc_dmc_se), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_cmp ( .Z(tmode_scan_noc_dmc_cmp), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_noc_dmc_scan_clk ( .Z(tmode_scan_noc_dmc_scan_clk), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_noc_dmc_spc_in ( .Z(tmode_scan_noc_dmc_spc_in), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_noc_dmci ( .Z(tmode_scan_noc_dmc_i), .S(!tmode_scan_noc_dmc), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_vge_top_occ_reset ( .Z(tmode_scan_vge_top_occ_reset), .S(!tmode_scan_vge_top), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_occ_bypass ( .Z(tmode_scan_vge_top_occ_bypass), .S(!tmode_scan_vge_top), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_occ_sclk ( .Z(tmode_scan_vge_top_occ_sclk), .S(!tmode_scan_vge_top), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_occ_mode ( .Z(tmode_scan_vge_top_occ_mode), .S(!tmode_scan_vge_top), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_spc_disable ( .Z(tmode_scan_vge_top_spc_disable), .S(!tmode_scan_vge_top), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_reset_n ( .Z(tmode_scan_vge_top_reset_n), .S(!tmode_scan_vge_top), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_vge_top_se ( .Z(tmode_scan_vge_top_se), .S(!tmode_scan_vge_top), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_cmp ( .Z(tmode_scan_vge_top_cmp), .S(!tmode_scan_vge_top), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vge_top_scan_clk ( .Z(tmode_scan_vge_top_scan_clk), .S(!tmode_scan_vge_top), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_vge_top_spc_in ( .Z(tmode_scan_vge_top_spc_in), .S(!tmode_scan_vge_top), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_vge_topi ( .Z(tmode_scan_vge_top_i), .S(!tmode_scan_vge_top), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_nna_occ_reset ( .Z(tmode_scan_nna_occ_reset), .S(!tmode_scan_nna), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_occ_bypass ( .Z(tmode_scan_nna_occ_bypass), .S(!tmode_scan_nna), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_occ_sclk ( .Z(tmode_scan_nna_occ_sclk), .S(!tmode_scan_nna), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_occ_mode ( .Z(tmode_scan_nna_occ_mode), .S(!tmode_scan_nna), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_spc_disable ( .Z(tmode_scan_nna_spc_disable), .S(!tmode_scan_nna), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_reset_n ( .Z(tmode_scan_nna_reset_n), .S(!tmode_scan_nna), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_nna_se ( .Z(tmode_scan_nna_se), .S(!tmode_scan_nna), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_cmp ( .Z(tmode_scan_nna_cmp), .S(!tmode_scan_nna), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_nna_scan_clk ( .Z(tmode_scan_nna_scan_clk), .S(!tmode_scan_nna), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_nna_spc_in ( .Z(tmode_scan_nna_spc_in), .S(!tmode_scan_nna), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_nnai ( .Z(tmode_scan_nna_i), .S(!tmode_scan_nna), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_dos_top_occ_reset ( .Z(tmode_scan_dos_top_occ_reset), .S(!tmode_scan_dos_top), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_occ_bypass ( .Z(tmode_scan_dos_top_occ_bypass), .S(!tmode_scan_dos_top), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_occ_sclk ( .Z(tmode_scan_dos_top_occ_sclk), .S(!tmode_scan_dos_top), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_occ_mode ( .Z(tmode_scan_dos_top_occ_mode), .S(!tmode_scan_dos_top), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_spc_disable ( .Z(tmode_scan_dos_top_spc_disable), .S(!tmode_scan_dos_top), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_reset_n ( .Z(tmode_scan_dos_top_reset_n), .S(!tmode_scan_dos_top), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_dos_top_se ( .Z(tmode_scan_dos_top_se), .S(!tmode_scan_dos_top), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_cmp ( .Z(tmode_scan_dos_top_cmp), .S(!tmode_scan_dos_top), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dos_top_scan_clk ( .Z(tmode_scan_dos_top_scan_clk), .S(!tmode_scan_dos_top), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_dos_top_spc_in ( .Z(tmode_scan_dos_top_spc_in), .S(!tmode_scan_dos_top), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_dos_topi ( .Z(tmode_scan_dos_top_i), .S(!tmode_scan_dos_top), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_hevc_occ_reset ( .Z(tmode_scan_hevc_occ_reset), .S(!tmode_scan_hevc), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_occ_bypass ( .Z(tmode_scan_hevc_occ_bypass), .S(!tmode_scan_hevc), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_occ_sclk ( .Z(tmode_scan_hevc_occ_sclk), .S(!tmode_scan_hevc), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_occ_mode ( .Z(tmode_scan_hevc_occ_mode), .S(!tmode_scan_hevc), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_spc_disable ( .Z(tmode_scan_hevc_spc_disable), .S(!tmode_scan_hevc), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_reset_n ( .Z(tmode_scan_hevc_reset_n), .S(!tmode_scan_hevc), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_hevc_se ( .Z(tmode_scan_hevc_se), .S(!tmode_scan_hevc), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_cmp ( .Z(tmode_scan_hevc_cmp), .S(!tmode_scan_hevc), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hevc_scan_clk ( .Z(tmode_scan_hevc_scan_clk), .S(!tmode_scan_hevc), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_hevc_spc_in ( .Z(tmode_scan_hevc_spc_in), .S(!tmode_scan_hevc), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_hevci ( .Z(tmode_scan_hevc_i), .S(!tmode_scan_hevc), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_vpu_hdmi_occ_reset ( .Z(tmode_scan_vpu_hdmi_occ_reset), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_occ_bypass ( .Z(tmode_scan_vpu_hdmi_occ_bypass), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_occ_sclk ( .Z(tmode_scan_vpu_hdmi_occ_sclk), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_occ_mode ( .Z(tmode_scan_vpu_hdmi_occ_mode), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_spc_disable ( .Z(tmode_scan_vpu_hdmi_spc_disable), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_reset_n ( .Z(tmode_scan_vpu_hdmi_reset_n), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_se ( .Z(tmode_scan_vpu_hdmi_se), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_cmp ( .Z(tmode_scan_vpu_hdmi_cmp), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_scan_clk ( .Z(tmode_scan_vpu_hdmi_scan_clk), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_vpu_hdmi_spc_in ( .Z(tmode_scan_vpu_hdmi_spc_in), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_vpu_hdmii ( .Z(tmode_scan_vpu_hdmi_i), .S(!tmode_scan_vpu_hdmi), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_dolby_occ_reset ( .Z(tmode_scan_dolby_occ_reset), .S(!tmode_scan_dolby), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_occ_bypass ( .Z(tmode_scan_dolby_occ_bypass), .S(!tmode_scan_dolby), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_occ_sclk ( .Z(tmode_scan_dolby_occ_sclk), .S(!tmode_scan_dolby), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_occ_mode ( .Z(tmode_scan_dolby_occ_mode), .S(!tmode_scan_dolby), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_spc_disable ( .Z(tmode_scan_dolby_spc_disable), .S(!tmode_scan_dolby), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_reset_n ( .Z(tmode_scan_dolby_reset_n), .S(!tmode_scan_dolby), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_dolby_se ( .Z(tmode_scan_dolby_se), .S(!tmode_scan_dolby), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_cmp ( .Z(tmode_scan_dolby_cmp), .S(!tmode_scan_dolby), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_dolby_scan_clk ( .Z(tmode_scan_dolby_scan_clk), .S(!tmode_scan_dolby), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_dolby_spc_in ( .Z(tmode_scan_dolby_spc_in), .S(!tmode_scan_dolby), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_dolbyi ( .Z(tmode_scan_dolby_i), .S(!tmode_scan_dolby), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_vi_top_clk1_occ_reset ( .Z(tmode_scan_vi_top_clk1_occ_reset), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_occ_bypass ( .Z(tmode_scan_vi_top_clk1_occ_bypass), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_occ_sclk ( .Z(tmode_scan_vi_top_clk1_occ_sclk), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_occ_mode ( .Z(tmode_scan_vi_top_clk1_occ_mode), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_spc_disable ( .Z(tmode_scan_vi_top_clk1_spc_disable), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_reset_n ( .Z(tmode_scan_vi_top_clk1_reset_n), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_se ( .Z(tmode_scan_vi_top_clk1_se), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_cmp ( .Z(tmode_scan_vi_top_clk1_cmp), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_scan_clk ( .Z(tmode_scan_vi_top_clk1_scan_clk), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_vi_top_clk1_spc_in ( .Z(tmode_scan_vi_top_clk1_spc_in), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_vi_top_clk1i ( .Z(tmode_scan_vi_top_clk1_i), .S(!tmode_scan_vi_top_clk1), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_vi_top_clk2_occ_reset ( .Z(tmode_scan_vi_top_clk2_occ_reset), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_occ_bypass ( .Z(tmode_scan_vi_top_clk2_occ_bypass), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_occ_sclk ( .Z(tmode_scan_vi_top_clk2_occ_sclk), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_occ_mode ( .Z(tmode_scan_vi_top_clk2_occ_mode), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_spc_disable ( .Z(tmode_scan_vi_top_clk2_spc_disable), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_reset_n ( .Z(tmode_scan_vi_top_clk2_reset_n), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_se ( .Z(tmode_scan_vi_top_clk2_se), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_cmp ( .Z(tmode_scan_vi_top_clk2_cmp), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_scan_clk ( .Z(tmode_scan_vi_top_clk2_scan_clk), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_vi_top_clk2_spc_in ( .Z(tmode_scan_vi_top_clk2_spc_in), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_vi_top_clk2i ( .Z(tmode_scan_vi_top_clk2_i), .S(!tmode_scan_vi_top_clk2), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_hdmirx_spc_disable ( .Z(tmode_scan_hdmirx_spc_disable), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hdmirx_reset_n ( .Z(tmode_scan_hdmirx_reset_n), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_hdmirx_se ( .Z(tmode_scan_hdmirx_se), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hdmirx_cmp ( .Z(tmode_scan_hdmirx_cmp), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_hdmirx_scan_clk ( .Z(tmode_scan_hdmirx_scan_clk), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_hdmirx_spc_in ( .Z(tmode_scan_hdmirx_spc_in), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_hdmirxi ( .Z(tmode_scan_hdmirx_i), .S(!tmode_scan_hdmirx), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_tcon_occ_reset ( .Z(tmode_scan_tcon_occ_reset), .S(!tmode_scan_tcon), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_occ_bypass ( .Z(tmode_scan_tcon_occ_bypass), .S(!tmode_scan_tcon), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_occ_sclk ( .Z(tmode_scan_tcon_occ_sclk), .S(!tmode_scan_tcon), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_occ_mode ( .Z(tmode_scan_tcon_occ_mode), .S(!tmode_scan_tcon), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_spc_disable ( .Z(tmode_scan_tcon_spc_disable), .S(!tmode_scan_tcon), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_reset_n ( .Z(tmode_scan_tcon_reset_n), .S(!tmode_scan_tcon), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_tcon_se ( .Z(tmode_scan_tcon_se), .S(!tmode_scan_tcon), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_cmp ( .Z(tmode_scan_tcon_cmp), .S(!tmode_scan_tcon), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_tcon_scan_clk ( .Z(tmode_scan_tcon_scan_clk), .S(!tmode_scan_tcon), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_tcon_spc_in ( .Z(tmode_scan_tcon_spc_in), .S(!tmode_scan_tcon), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_tconi ( .Z(tmode_scan_tcon_i), .S(!tmode_scan_tcon), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_demod_spc_disable ( .Z(tmode_scan_demod_spc_disable), .S(!tmode_scan_demod), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_demod_reset_n ( .Z(tmode_scan_demod_reset_n), .S(!tmode_scan_demod), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_demod_se ( .Z(tmode_scan_demod_se), .S(!tmode_scan_demod), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_demod_cmp ( .Z(tmode_scan_demod_cmp), .S(!tmode_scan_demod), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_demod_scan_clk ( .Z(tmode_scan_demod_scan_clk), .S(!tmode_scan_demod), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_demod_spc_in ( .Z(tmode_scan_demod_spc_in), .S(!tmode_scan_demod), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_demodi ( .Z(tmode_scan_demod_i), .S(!tmode_scan_demod), .A(frpad_prod_i[6+:16]), .B(16'd0) );
//-----------------------------------------------
scanmuxN #(1) u_tmode_scan_frc_top_occ_reset ( .Z(tmode_scan_frc_top_occ_reset), .S(!tmode_scan_frc_top), .A(frpad_prod_i[31]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_occ_bypass ( .Z(tmode_scan_frc_top_occ_bypass), .S(!tmode_scan_frc_top), .A(frpad_prod_i[30]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_occ_sclk ( .Z(tmode_scan_frc_top_occ_sclk), .S(!tmode_scan_frc_top), .A(frpad_prod_i[29]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_occ_mode ( .Z(tmode_scan_frc_top_occ_mode), .S(!tmode_scan_frc_top), .A(frpad_prod_i[28]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_spc_disable ( .Z(tmode_scan_frc_top_spc_disable), .S(!tmode_scan_frc_top), .A(frpad_prod_i[27]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_reset_n ( .Z(tmode_scan_frc_top_reset_n), .S(!tmode_scan_frc_top), .A(frpad_prod_i[26]), .B(1'b0) );
scanmuxN #(1) u_tmode_scan_frc_top_se ( .Z(tmode_scan_frc_top_se), .S(!tmode_scan_frc_top), .A(frpad_prod_i[25]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_cmp ( .Z(tmode_scan_frc_top_cmp), .S(!tmode_scan_frc_top), .A(frpad_prod_i[24]), .B(1'd0) );
scanmuxN #(1) u_tmode_scan_frc_top_scan_clk ( .Z(tmode_scan_frc_top_scan_clk), .S(!tmode_scan_frc_top), .A(frpad_prod_i[23]), .B(cts_mbist_clk) );
scanmuxN #(1) u_tmode_scan_frc_top_spc_in ( .Z(tmode_scan_frc_top_spc_in), .S(!tmode_scan_frc_top), .A(frpad_prod_i[22]), .B(1'd0) );
scanmuxN #(16) u_tmode_scan_frc_topi ( .Z(tmode_scan_frc_top_i), .S(!tmode_scan_frc_top), .A(frpad_prod_i[6+:16]), .B(16'd0) );

//-----------------------------------------------
assign cts_scan_clk = tmode_scan_core_scan_clk;

wire  isin = 1'b1;
wire  isout = 1'b0;
parameter P_TESTPIN_NUM = 60;
//bit5:0 is fixed as input for mode_sel
assign topad_prod_mask[5:0] = prod_tmode ? 6'h3F : 6'h0;
assign topad_prod_oen[5:0] = 6'h3F;
assign topad_prod_o[5:0] = 6'd0;

parameter P_TESTPIN_NUM2 = P_TESTPIN_NUM-6;
crt_tmode_topad_sel #(P_TESTPIN_NUM2)
u_crt_tmode_topad_sel(
// (0):
.sel0           (1'b0),
.sel0_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel0_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel0_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (1):
.sel1           (1'b0),
.sel1_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel1_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel1_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (2):
.sel2           (tmode_mbist),
.sel2_mask      ({{P_TESTPIN_NUM2-24){1'b0},        {4{1'b1}},         {20{1'b1}}}),
.sel2_oen       ({{P_TESTPIN_NUM2-24){isin},        {4{isout}},        {20{isout}}}),
.sel2_o         ({{P_TESTPIN_NUM2-24){1'b0'}, tmode_mbist_o[3:0], {20{1'b0}}}),
// (3):
.sel3           (tmode_acodec),
.sel3_mask      ({{P_TESTPIN_NUM2-8){1'b0},        {4{1'b1}},         {4{1'b1}}}),
.sel3_oen       ({{P_TESTPIN_NUM2-8){isin},        {4{isout}},        {4{isout}}}),
.sel3_o         ({{P_TESTPIN_NUM2-8){1'b0'}, tmode_acodec_o[3:0], {4{1'b0}}}),
// (4):
.sel4           (tmode_saradc),
.sel4_mask      ({{P_TESTPIN_NUM2-36){1'b0},        {14{1'b1}},         {22{1'b1}}}),
.sel4_oen       ({{P_TESTPIN_NUM2-36){isin},        {14{isout}},        {22{isout}}}),
.sel4_o         ({{P_TESTPIN_NUM2-36){1'b0'}, tmode_saradc_o[13:0], {22{1'b0}}}),
// (5):
.sel5           (tmode_ethphy),
.sel5_mask      ({{P_TESTPIN_NUM2-38){1'b0},        {21{1'b1}},         {17{1'b1}}}),
.sel5_oen       ({{P_TESTPIN_NUM2-38){isin},        {21{isout}},        {17{isout}}}),
.sel5_o         ({{P_TESTPIN_NUM2-38){1'b0'}, tmode_ethphy_o[20:0], {17{1'b0}}}),
// (6):
.sel6           (tmode_tvfe),
.sel6_mask      ({{P_TESTPIN_NUM2-54){1'b0},        {36{1'b1}},         {18{1'b1}}}),
.sel6_oen       ({{P_TESTPIN_NUM2-54){isin},        {36{isout}},        {18{isout}}}),
.sel6_o         ({{P_TESTPIN_NUM2-54){1'b0'}, tmode_tvfe_o[35:0], {18{1'b0}}}),
// (7):
.sel7           (tmode_vdac),
.sel7_mask      ({{P_TESTPIN_NUM2-18){1'b0}},         {18{1'b1}}}),
.sel7_oen       ({{P_TESTPIN_NUM2-18){isin}},        {18{isout}}}),
.sel7_o         ({{P_TESTPIN_NUM2-18){1'b0'}, {18{1'b0}}}),
// (8):
.sel8           (tmode_lvds),
.sel8_mask      ({{P_TESTPIN_NUM2-50){1'b0},        {50{1'b1}}}),
.sel8_oen       ({{P_TESTPIN_NUM2-50){isin},        {50{isout}}}),
.sel8_o         ({{P_TESTPIN_NUM2-50){1'b0'}, tmode_lvds_o[49:0]}),
// (9):
.sel9           (1'b0),
.sel9_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel9_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel9_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (10):
.sel10           (tmode_vgd),
.sel10_mask      ({{P_TESTPIN_NUM2-8){1'b0},        {3{1'b1}},         {5{1'b1}}}),
.sel10_oen       ({{P_TESTPIN_NUM2-8){isin},        {3{isout}},        {5{isout}}}),
.sel10_o         ({{P_TESTPIN_NUM2-8){1'b0'}, tmode_vgd_o[2:0], {5{1'b0}}}),
// (11):
.sel11           (tmode_earctx),
.sel11_mask      ({{P_TESTPIN_NUM2-27){1'b0},        {3{1'b1}},         {24{1'b1}}}),
.sel11_oen       ({{P_TESTPIN_NUM2-27){isin},        {3{isout}},        {24{isout}}}),
.sel11_o         ({{P_TESTPIN_NUM2-27){1'b0'}, tmode_earctx_o[2:0], {24{1'b0}}}),
// (12):
.sel12           (tmode_hdmirx),
.sel12_mask      ({{P_TESTPIN_NUM2-40){1'b0},        {40{1'b1}}}),
.sel12_oen       ({{P_TESTPIN_NUM2-40){isin},        {40{isout}}}),
.sel12_o         ({{P_TESTPIN_NUM2-40){1'b0'}, tmode_hdmirx_o[39:0]}),
// (13):
.sel13           (1'b0),
.sel13_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel13_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel13_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (14):
.sel14           (1'b0),
.sel14_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel14_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel14_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (15):
.sel15           (1'b0),
.sel15_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel15_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel15_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (16):
.sel16           (tmode_scan_chip_top),
.sel16_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel16_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel16_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_chip_top_spc_out, tmode_scan_chip_top_o[15:0], {28{1'b0}}}),
// (17):
.sel17           (tmode_scan_dsp),
.sel17_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel17_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel17_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_dsp_spc_out, tmode_scan_dsp_o[15:0], {28{1'b0}}}),
// (18):
.sel18           (tmode_scan_secure_top),
.sel18_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel18_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel18_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_secure_top_spc_out, tmode_scan_secure_top_o[15:0], {28{1'b0}}}),
// (19):
.sel19           (1'b0),
.sel19_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel19_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel19_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (20):
.sel20           (1'b0),
.sel20_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel20_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel20_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (21):
.sel21           (tmode_scan_cpu),
.sel21_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel21_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel21_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_cpu_spc_out, tmode_scan_cpu_o[15:0], {28{1'b0}}}),
// (22):
.sel22           (tmode_scan_sys_wrapper),
.sel22_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel22_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel22_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_sys_wrapper_spc_out, tmode_scan_sys_wrapper_o[15:0], {28{1'b0}}}),
// (23):
.sel23           (tmode_scan_mali),
.sel23_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel23_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel23_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_mali_spc_out, tmode_scan_mali_o[15:0], {28{1'b0}}}),
// (24):
.sel24           (1'b0),
.sel24_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel24_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel24_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (25):
.sel25           (tmode_scan_ usb_ pcie_comb0),
.sel25_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel25_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel25_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_ usb_ pcie_comb0_spc_out, tmode_scan_ usb_ pcie_comb0_o[15:0], {28{1'b0}}}),
// (26):
.sel26           (tmode_scan_usb30a_dig_phy),
.sel26_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel26_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel26_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_usb30a_dig_phy_spc_out, tmode_scan_usb30a_dig_phy_o[15:0], {28{1'b0}}}),
// (27):
.sel27           (tmode_scan_usb30b_dig_phy),
.sel27_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel27_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel27_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_usb30b_dig_phy_spc_out, tmode_scan_usb30b_dig_phy_o[15:0], {28{1'b0}}}),
// (28):
.sel28           (tmode_scan_usb_pcie_comb1),
.sel28_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel28_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel28_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_usb_pcie_comb1_spc_out, tmode_scan_usb_pcie_comb1_o[15:0], {28{1'b0}}}),
// (29):
.sel29           (tmode_scan_noc_dmc),
.sel29_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel29_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel29_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_noc_dmc_spc_out, tmode_scan_noc_dmc_o[15:0], {28{1'b0}}}),
// (30):
.sel30           (1'b0),
.sel30_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel30_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel30_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (31):
.sel31           (1'b0),
.sel31_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel31_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel31_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (32):
.sel32           (1'b0),
.sel32_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel32_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel32_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (33):
.sel33           (tmode_scan_vge_top),
.sel33_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel33_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel33_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_vge_top_spc_out, tmode_scan_vge_top_o[15:0], {28{1'b0}}}),
// (34):
.sel34           (1'b0),
.sel34_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel34_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel34_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (35):
.sel35           (1'b0),
.sel35_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel35_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel35_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (36):
.sel36           (tmode_scan_nna),
.sel36_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel36_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel36_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_nna_spc_out, tmode_scan_nna_o[15:0], {28{1'b0}}}),
// (37):
.sel37           (1'b0),
.sel37_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel37_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel37_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (38):
.sel38           (tmode_scan_dos_top),
.sel38_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel38_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel38_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_dos_top_spc_out, tmode_scan_dos_top_o[15:0], {28{1'b0}}}),
// (39):
.sel39           (tmode_scan_hevc),
.sel39_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel39_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel39_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_hevc_spc_out, tmode_scan_hevc_o[15:0], {28{1'b0}}}),
// (40):
.sel40           (tmode_scan_vpu_hdmi),
.sel40_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel40_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel40_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_vpu_hdmi_spc_out, tmode_scan_vpu_hdmi_o[15:0], {28{1'b0}}}),
// (41):
.sel41           (tmode_scan_dolby),
.sel41_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel41_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel41_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_dolby_spc_out, tmode_scan_dolby_o[15:0], {28{1'b0}}}),
// (42):
.sel42           (tmode_scan_vi_top_clk1),
.sel42_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel42_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel42_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_vi_top_clk1_spc_out, tmode_scan_vi_top_clk1_o[15:0], {28{1'b0}}}),
// (43):
.sel43           (tmode_scan_vi_top_clk2),
.sel43_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel43_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel43_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_vi_top_clk2_spc_out, tmode_scan_vi_top_clk2_o[15:0], {28{1'b0}}}),
// (44):
.sel44           (tmode_scan_hdmirx),
.sel44_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel44_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel44_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_hdmirx_spc_out, tmode_scan_hdmirx_o[15:0], {28{1'b0}}}),
// (45):
.sel45           (1'b0),
.sel45_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel45_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel45_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (46):
.sel46           (1'b0),
.sel46_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel46_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel46_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (47):
.sel47           (tmode_scan_tcon),
.sel47_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel47_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel47_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_tcon_spc_out, tmode_scan_tcon_o[15:0], {28{1'b0}}}),
// (48):
.sel48           (tmode_scan_demod),
.sel48_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel48_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel48_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_demod_spc_out, tmode_scan_demod_o[15:0], {28{1'b0}}}),
// (49):
.sel49           (tmode_scan_frc_top),
.sel49_mask      ({{2{1'b1}}, {(P_TESTPIN_NUM2-47){1'b0}}, {17{1'b1}},{28{1'b1}}}),
.sel49_oen       ({{2{isout}}, {(P_TESTPIN_NUM2-47){isin}}, {17{isout}}, {28{isin}}}),
.sel49_o         ({cts_msr_clk_b1,cts_msr_clk_b0,{(P_TESTPIN_NUM2-47){1'b0}}, tmode_scan_frc_top_spc_out, tmode_scan_frc_top_o[15:0], {28{1'b0}}}),
// (50):
.sel50           (1'b0),
.sel50_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel50_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel50_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (51):
.sel51           (1'b0),
.sel51_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel51_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel51_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (52):
.sel52           (1'b0),
.sel52_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel52_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel52_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (53):
.sel53           (1'b0),
.sel53_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel53_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel53_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (54):
.sel54           (1'b0),
.sel54_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel54_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel54_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (55):
.sel55           (1'b0),
.sel55_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel55_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel55_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (56):
.sel56           (1'b0),
.sel56_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel56_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel56_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (57):
.sel57           (1'b0),
.sel57_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel57_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel57_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (58):
.sel58           (1'b0),
.sel58_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel58_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel58_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (59):
.sel59           (1'b0),
.sel59_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel59_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel59_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (60):
.sel60           (1'b0),
.sel60_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel60_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel60_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (61):
.sel61           (1'b0),
.sel61_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel61_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel61_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (62):
.sel62           (1'b0),
.sel62_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel62_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel62_o         ({{P_TESTPIN_NUM2{1'b0}}}),
// (63):
.sel63           (1'b0),
.sel63_mask      ({{P_TESTPIN_NUM2{1'b1}}}),
.sel63_oen       ({{P_TESTPIN_NUM2{isin}}}),
.sel63_o         ({{P_TESTPIN_NUM2{1'b0}}}),
//poc:6(in)
.poc             (1'b0 ),
.poc_mask        ({(P_TESTPIN_NUM2){1'b0}}    ), //add poc pin control in the last mux
.poc_oen         ({(P_TESTPIN_NUM2){isin}}    ),
.poc_o           ({(P_TESTPIN_NUM2){1'b0}}    ),
//output
.topad_prod_mask (topad_prod_mask[P_TESTPIN_NUM-1:6]      ),
.topad_prod_oen  (topad_prod_oen[P_TESTPIN_NUM-1:6]       ),
.topad_prod_o    (topad_prod_o[P_TESTPIN_NUM-1:6]         )
);

endmodule
