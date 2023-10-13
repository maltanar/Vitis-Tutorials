// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module polar_clip_polar_clip_Pipeline_VITIS_LOOP_71_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sext_ln41_3,
        sext_ln41_2,
        rotation_index_V_out,
        rotation_index_V_out_ap_vld,
        X_step_V_1_out,
        X_step_V_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] sext_ln41_3;
input  [17:0] sext_ln41_2;
output  [5:0] rotation_index_V_out;
output   rotation_index_V_out_ap_vld;
output  [24:0] X_step_V_1_out;
output   X_step_V_1_out_ap_vld;

reg ap_idle;
reg rotation_index_V_out_ap_vld;
reg X_step_V_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln1073_fu_131_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [31:0] X_step_V_1_reg_279;
wire    ap_block_pp0_stage1_11001;
reg   [2:0] i_V_1_reg_285;
reg   [31:0] Y_step_V_load_reg_293;
wire   [31:0] i_V_2_i_cast3_fu_140_p1;
reg   [31:0] i_V_2_i_cast3_reg_301;
wire   [0:0] tmp_fu_148_p3;
reg   [0:0] tmp_reg_307;
wire   [31:0] r_V_1_fu_156_p2;
reg   [31:0] r_V_1_reg_313;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
reg   [31:0] X_step_V_fu_42;
wire   [31:0] next_X_step_fu_222_p3;
wire  signed [31:0] sext_ln41_2_cast_fu_84_p1;
wire    ap_block_pp0_stage0_11001;
wire    ap_loop_init;
wire    ap_block_pp0_stage1;
reg   [31:0] Y_step_V_fu_46;
wire   [31:0] next_Y_step_fu_229_p3;
wire  signed [31:0] sext_ln41_3_cast_fu_88_p1;
reg   [31:0] rotation_index_V_fu_50;
wire   [31:0] rotation_index_V_5_fu_178_p3;
reg   [2:0] sh_V_fu_54;
wire   [2:0] i_V_fu_191_p2;
wire    ap_block_pp0_stage1_01001;
wire    ap_block_pp0_stage0;
wire   [5:0] i_V_2_i_cast_fu_144_p1;
wire   [5:0] shl_ln73_fu_162_p2;
wire   [31:0] zext_ln1679_fu_168_p1;
wire   [31:0] rotation_index_V_4_fu_172_p2;
wire   [31:0] r_V_fu_196_p2;
wire   [31:0] r_V_2_fu_209_p2;
wire   [31:0] sub_ln75_1_fu_213_p2;
wire   [31:0] add_ln75_fu_200_p2;
wire   [31:0] add_ln75_1_fu_218_p2;
wire   [31:0] sub_ln75_fu_205_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

polar_clip_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_exit_pp0_iter0_stage1) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            X_step_V_fu_42 <= sext_ln41_2_cast_fu_84_p1;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            X_step_V_fu_42 <= next_X_step_fu_222_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            Y_step_V_fu_46 <= sext_ln41_3_cast_fu_88_p1;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            Y_step_V_fu_46 <= next_Y_step_fu_229_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rotation_index_V_fu_50 <= 32'd1;
    end else if (((icmp_ln1073_fu_131_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        rotation_index_V_fu_50 <= rotation_index_V_5_fu_178_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            sh_V_fu_54 <= 3'd1;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            sh_V_fu_54 <= i_V_fu_191_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        X_step_V_1_reg_279 <= X_step_V_fu_42;
        i_V_1_reg_285 <= sh_V_fu_54;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1073_fu_131_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        Y_step_V_load_reg_293 <= Y_step_V_fu_46;
        i_V_2_i_cast3_reg_301[2 : 0] <= i_V_2_i_cast3_fu_140_p1[2 : 0];
        r_V_1_reg_313 <= r_V_1_fu_156_p2;
        tmp_reg_307 <= Y_step_V_fu_46[32'd31];
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_131_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        X_step_V_1_out_ap_vld = 1'b1;
    end else begin
        X_step_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_131_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_131_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        rotation_index_V_out_ap_vld = 1'b1;
    end else begin
        rotation_index_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign X_step_V_1_out = X_step_V_fu_42[24:0];

assign add_ln75_1_fu_218_p2 = (r_V_1_reg_313 + Y_step_V_load_reg_293);

assign add_ln75_fu_200_p2 = (X_step_V_1_reg_279 + r_V_fu_196_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign i_V_2_i_cast3_fu_140_p1 = sh_V_fu_54;

assign i_V_2_i_cast_fu_144_p1 = sh_V_fu_54;

assign i_V_fu_191_p2 = (i_V_1_reg_285 + 3'd1);

assign icmp_ln1073_fu_131_p2 = ((sh_V_fu_54 == 3'd6) ? 1'b1 : 1'b0);

assign next_X_step_fu_222_p3 = ((tmp_reg_307[0:0] == 1'b1) ? sub_ln75_1_fu_213_p2 : add_ln75_fu_200_p2);

assign next_Y_step_fu_229_p3 = ((tmp_reg_307[0:0] == 1'b1) ? add_ln75_1_fu_218_p2 : sub_ln75_fu_205_p2);

assign r_V_1_fu_156_p2 = $signed(X_step_V_fu_42) >>> i_V_2_i_cast3_fu_140_p1;

assign r_V_2_fu_209_p2 = $signed(Y_step_V_load_reg_293) >>> i_V_2_i_cast3_reg_301;

assign r_V_fu_196_p2 = Y_step_V_load_reg_293 >> i_V_2_i_cast3_reg_301;

assign rotation_index_V_4_fu_172_p2 = (rotation_index_V_fu_50 + zext_ln1679_fu_168_p1);

assign rotation_index_V_5_fu_178_p3 = ((tmp_fu_148_p3[0:0] == 1'b1) ? rotation_index_V_fu_50 : rotation_index_V_4_fu_172_p2);

assign rotation_index_V_out = rotation_index_V_fu_50[5:0];

assign sext_ln41_2_cast_fu_84_p1 = $signed(sext_ln41_2);

assign sext_ln41_3_cast_fu_88_p1 = $signed(sext_ln41_3);

assign shl_ln73_fu_162_p2 = 6'd1 << i_V_2_i_cast_fu_144_p1;

assign sub_ln75_1_fu_213_p2 = (X_step_V_1_reg_279 - r_V_2_fu_209_p2);

assign sub_ln75_fu_205_p2 = (Y_step_V_load_reg_293 - r_V_1_reg_313);

assign tmp_fu_148_p3 = Y_step_V_fu_46[32'd31];

assign zext_ln1679_fu_168_p1 = shl_ln73_fu_162_p2;

always @ (posedge ap_clk) begin
    i_V_2_i_cast3_reg_301[31:3] <= 29'b00000000000000000000000000000;
end

endmodule //polar_clip_polar_clip_Pipeline_VITIS_LOOP_71_1