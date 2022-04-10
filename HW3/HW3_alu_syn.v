/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue Mar  8 23:27:41 2022
/////////////////////////////////////////////////////////////


module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [10:0] carry;

  FA1S U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  FA1S U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FA1S U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FA1S U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FA1S U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FA1S U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FA1S U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INV1S U1 ( .I(B[0]), .O(n10) );
  INV1S U2 ( .I(B[1]), .O(n9) );
  INV1S U3 ( .I(A[0]), .O(n2) );
  INV1S U4 ( .I(B[2]), .O(n8) );
  INV1S U5 ( .I(B[3]), .O(n7) );
  INV1S U6 ( .I(B[4]), .O(n6) );
  INV1S U7 ( .I(B[5]), .O(n5) );
  INV1S U8 ( .I(B[6]), .O(n4) );
  INV1S U9 ( .I(B[7]), .O(n3) );
  XNR2HS U10 ( .I1(n10), .I2(A[0]), .O(DIFF[0]) );
  BUF1CK U11 ( .I(DIFF[9]), .O(DIFF[8]) );
  ND2 U12 ( .I1(B[0]), .I2(n2), .O(carry[1]) );
  INV1S U13 ( .I(carry[8]), .O(DIFF[9]) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FA1S U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  FA1S U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  FA1S U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FA1S U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FA1S U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FA1S U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FA1S U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  AN2 U1 ( .I1(B[0]), .I2(A[0]), .O(n1) );
  XOR2HS U2 ( .I1(B[0]), .I2(A[0]), .O(SUM[0]) );
endmodule


module alu_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247;

  FA1S U2 ( .A(n99), .B(n15), .CI(n2), .CO(product[15]), .S(product[14]) );
  FA1S U3 ( .A(n16), .B(n17), .CI(n3), .CO(n2), .S(product[13]) );
  FA1S U4 ( .A(n18), .B(n21), .CI(n4), .CO(n3), .S(product[12]) );
  FA1S U5 ( .A(n27), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  FA1S U6 ( .A(n35), .B(n28), .CI(n6), .CO(n5), .S(product[10]) );
  FA1S U7 ( .A(n45), .B(n36), .CI(n7), .CO(n6), .S(product[9]) );
  FA1S U8 ( .A(n57), .B(n46), .CI(n8), .CO(n7), .S(product[8]) );
  FA1S U9 ( .A(n69), .B(n58), .CI(n9), .CO(n8), .S(product[7]) );
  FA1S U10 ( .A(n79), .B(n70), .CI(n10), .CO(n9), .S(product[6]) );
  FA1S U11 ( .A(n87), .B(n80), .CI(n11), .CO(n10), .S(product[5]) );
  FA1S U12 ( .A(n93), .B(n88), .CI(n12), .CO(n11), .S(product[4]) );
  FA1S U13 ( .A(n96), .B(n13), .CI(n94), .CO(n12), .S(product[3]) );
  FA1S U14 ( .A(n146), .B(n14), .CI(n98), .CO(n13), .S(product[2]) );
  HA1 U15 ( .A(n154), .B(n161), .C(n14), .S(product[1]) );
  FA1S U16 ( .A(n107), .B(n100), .CI(n19), .CO(n15), .S(n16) );
  FA1S U17 ( .A(n25), .B(n20), .CI(n23), .CO(n17), .S(n18) );
  FA1S U18 ( .A(n115), .B(n101), .CI(n108), .CO(n19), .S(n20) );
  FA1S U19 ( .A(n31), .B(n24), .CI(n29), .CO(n21), .S(n22) );
  FA1S U20 ( .A(n116), .B(n33), .CI(n26), .CO(n23), .S(n24) );
  FA1S U21 ( .A(n123), .B(n102), .CI(n109), .CO(n25), .S(n26) );
  FA1S U22 ( .A(n32), .B(n37), .CI(n30), .CO(n27), .S(n28) );
  FA1S U23 ( .A(n41), .B(n34), .CI(n39), .CO(n29), .S(n30) );
  FA1S U24 ( .A(n124), .B(n117), .CI(n43), .CO(n31), .S(n32) );
  FA1S U25 ( .A(n131), .B(n103), .CI(n110), .CO(n33), .S(n34) );
  FA1S U26 ( .A(n40), .B(n47), .CI(n38), .CO(n35), .S(n36) );
  FA1S U27 ( .A(n44), .B(n51), .CI(n49), .CO(n37), .S(n38) );
  FA1S U28 ( .A(n55), .B(n53), .CI(n42), .CO(n39), .S(n40) );
  FA1S U29 ( .A(n118), .B(n125), .CI(n132), .CO(n41), .S(n42) );
  FA1S U30 ( .A(n139), .B(n104), .CI(n111), .CO(n43), .S(n44) );
  FA1S U31 ( .A(n50), .B(n59), .CI(n48), .CO(n45), .S(n46) );
  FA1S U32 ( .A(n54), .B(n52), .CI(n61), .CO(n47), .S(n48) );
  FA1S U33 ( .A(n56), .B(n65), .CI(n63), .CO(n49), .S(n50) );
  FA1S U34 ( .A(n140), .B(n133), .CI(n67), .CO(n51), .S(n52) );
  FA1S U35 ( .A(n126), .B(n119), .CI(n147), .CO(n53), .S(n54) );
  HA1 U36 ( .A(n112), .B(n105), .C(n55), .S(n56) );
  FA1S U37 ( .A(n71), .B(n62), .CI(n60), .CO(n57), .S(n58) );
  FA1S U38 ( .A(n64), .B(n66), .CI(n73), .CO(n59), .S(n60) );
  FA1S U39 ( .A(n77), .B(n68), .CI(n75), .CO(n61), .S(n62) );
  FA1S U40 ( .A(n141), .B(n127), .CI(n134), .CO(n63), .S(n64) );
  FA1S U41 ( .A(n155), .B(n120), .CI(n148), .CO(n65), .S(n66) );
  HA1 U42 ( .A(n113), .B(n106), .C(n67), .S(n68) );
  FA1S U43 ( .A(n81), .B(n74), .CI(n72), .CO(n69), .S(n70) );
  FA1S U44 ( .A(n78), .B(n83), .CI(n76), .CO(n71), .S(n72) );
  FA1S U45 ( .A(n142), .B(n135), .CI(n85), .CO(n73), .S(n74) );
  FA1S U46 ( .A(n156), .B(n128), .CI(n149), .CO(n75), .S(n76) );
  HA1 U47 ( .A(n121), .B(n114), .C(n77), .S(n78) );
  FA1S U48 ( .A(n89), .B(n84), .CI(n82), .CO(n79), .S(n80) );
  FA1S U49 ( .A(n150), .B(n91), .CI(n86), .CO(n81), .S(n82) );
  FA1S U50 ( .A(n157), .B(n136), .CI(n143), .CO(n83), .S(n84) );
  HA1 U51 ( .A(n129), .B(n122), .C(n85), .S(n86) );
  FA1S U52 ( .A(n95), .B(n92), .CI(n90), .CO(n87), .S(n88) );
  FA1S U53 ( .A(n158), .B(n144), .CI(n151), .CO(n89), .S(n90) );
  HA1 U54 ( .A(n137), .B(n130), .C(n91), .S(n92) );
  FA1S U55 ( .A(n159), .B(n152), .CI(n97), .CO(n93), .S(n94) );
  HA1 U56 ( .A(n145), .B(n138), .C(n95), .S(n96) );
  HA1 U57 ( .A(n160), .B(n153), .C(n97), .S(n98) );
  INV1S U140 ( .I(n246), .O(n214) );
  INV1S U141 ( .I(n214), .O(n215) );
  INV1S U142 ( .I(b[2]), .O(n216) );
  INV1S U143 ( .I(b[2]), .O(n217) );
  INV1S U144 ( .I(a[1]), .O(n218) );
  INV1S U145 ( .I(b[1]), .O(n219) );
  INV1S U146 ( .I(b[1]), .O(n220) );
  INV1S U147 ( .I(n247), .O(n221) );
  INV1S U148 ( .I(n221), .O(n222) );
  INV1S U149 ( .I(a[2]), .O(n223) );
  INV1S U150 ( .I(b[4]), .O(n224) );
  INV1S U151 ( .I(b[4]), .O(n225) );
  INV1S U152 ( .I(a[4]), .O(n226) );
  INV1S U153 ( .I(b[3]), .O(n227) );
  INV1S U154 ( .I(b[3]), .O(n228) );
  INV1S U155 ( .I(a[5]), .O(n229) );
  INV1S U156 ( .I(a[3]), .O(n230) );
  INV1S U157 ( .I(b[6]), .O(n231) );
  INV1S U158 ( .I(b[6]), .O(n232) );
  INV1S U159 ( .I(b[5]), .O(n233) );
  INV1S U160 ( .I(b[5]), .O(n234) );
  INV1S U161 ( .I(a[6]), .O(n235) );
  INV1S U162 ( .I(b[7]), .O(n236) );
  INV1S U163 ( .I(b[7]), .O(n237) );
  INV1S U164 ( .I(a[7]), .O(n238) );
  INV1S U165 ( .I(a[0]), .O(n246) );
  INV1S U166 ( .I(a[1]), .O(n245) );
  INV1S U167 ( .I(b[0]), .O(n247) );
  INV1S U168 ( .I(a[2]), .O(n244) );
  INV1S U169 ( .I(a[4]), .O(n242) );
  INV1S U170 ( .I(a[5]), .O(n241) );
  INV1S U171 ( .I(a[3]), .O(n243) );
  INV1S U172 ( .I(a[6]), .O(n240) );
  INV1S U173 ( .I(a[7]), .O(n239) );
  NR2 U174 ( .I1(n215), .I2(n222), .O(product[0]) );
  NR2 U175 ( .I1(n239), .I2(n237), .O(n99) );
  NR2 U176 ( .I1(n246), .I2(n219), .O(n161) );
  NR2 U177 ( .I1(n246), .I2(n216), .O(n160) );
  NR2 U178 ( .I1(n215), .I2(n227), .O(n159) );
  NR2 U179 ( .I1(n215), .I2(n224), .O(n158) );
  NR2 U180 ( .I1(n215), .I2(n233), .O(n157) );
  NR2 U181 ( .I1(n215), .I2(n231), .O(n156) );
  NR2 U182 ( .I1(n215), .I2(n236), .O(n155) );
  NR2 U183 ( .I1(n247), .I2(n245), .O(n154) );
  NR2 U184 ( .I1(n219), .I2(n245), .O(n153) );
  NR2 U185 ( .I1(n217), .I2(n218), .O(n152) );
  NR2 U186 ( .I1(n227), .I2(n218), .O(n151) );
  NR2 U187 ( .I1(n224), .I2(n218), .O(n150) );
  NR2 U188 ( .I1(n233), .I2(n218), .O(n149) );
  NR2 U189 ( .I1(n231), .I2(n218), .O(n148) );
  NR2 U190 ( .I1(n236), .I2(n218), .O(n147) );
  NR2 U191 ( .I1(n247), .I2(n244), .O(n146) );
  NR2 U192 ( .I1(n220), .I2(n223), .O(n145) );
  NR2 U193 ( .I1(n216), .I2(n244), .O(n144) );
  NR2 U194 ( .I1(n228), .I2(n223), .O(n143) );
  NR2 U195 ( .I1(n225), .I2(n223), .O(n142) );
  NR2 U196 ( .I1(n234), .I2(n223), .O(n141) );
  NR2 U197 ( .I1(n232), .I2(n223), .O(n140) );
  NR2 U198 ( .I1(n237), .I2(n223), .O(n139) );
  NR2 U199 ( .I1(n222), .I2(n243), .O(n138) );
  NR2 U200 ( .I1(n220), .I2(n243), .O(n137) );
  NR2 U201 ( .I1(n217), .I2(n230), .O(n136) );
  NR2 U202 ( .I1(n228), .I2(n230), .O(n135) );
  NR2 U203 ( .I1(n225), .I2(n230), .O(n134) );
  NR2 U204 ( .I1(n234), .I2(n230), .O(n133) );
  NR2 U205 ( .I1(n232), .I2(n230), .O(n132) );
  NR2 U206 ( .I1(n237), .I2(n230), .O(n131) );
  NR2 U207 ( .I1(n222), .I2(n242), .O(n130) );
  NR2 U208 ( .I1(n220), .I2(n242), .O(n129) );
  NR2 U209 ( .I1(n217), .I2(n226), .O(n128) );
  NR2 U210 ( .I1(n228), .I2(n226), .O(n127) );
  NR2 U211 ( .I1(n225), .I2(n226), .O(n126) );
  NR2 U212 ( .I1(n234), .I2(n226), .O(n125) );
  NR2 U213 ( .I1(n232), .I2(n226), .O(n124) );
  NR2 U214 ( .I1(n237), .I2(n226), .O(n123) );
  NR2 U215 ( .I1(n222), .I2(n229), .O(n122) );
  NR2 U216 ( .I1(n220), .I2(n229), .O(n121) );
  NR2 U217 ( .I1(n217), .I2(n229), .O(n120) );
  NR2 U218 ( .I1(n228), .I2(n241), .O(n119) );
  NR2 U219 ( .I1(n225), .I2(n241), .O(n118) );
  NR2 U220 ( .I1(n234), .I2(n241), .O(n117) );
  NR2 U221 ( .I1(n232), .I2(n241), .O(n116) );
  NR2 U222 ( .I1(n237), .I2(n241), .O(n115) );
  NR2 U223 ( .I1(n222), .I2(n235), .O(n114) );
  NR2 U224 ( .I1(n220), .I2(n235), .O(n113) );
  NR2 U225 ( .I1(n217), .I2(n235), .O(n112) );
  NR2 U226 ( .I1(n228), .I2(n240), .O(n111) );
  NR2 U227 ( .I1(n225), .I2(n240), .O(n110) );
  NR2 U228 ( .I1(n234), .I2(n240), .O(n109) );
  NR2 U229 ( .I1(n232), .I2(n240), .O(n108) );
  NR2 U230 ( .I1(n237), .I2(n240), .O(n107) );
  NR2 U231 ( .I1(n222), .I2(n238), .O(n106) );
  NR2 U232 ( .I1(n238), .I2(n220), .O(n105) );
  NR2 U233 ( .I1(n238), .I2(n217), .O(n104) );
  NR2 U234 ( .I1(n239), .I2(n228), .O(n103) );
  NR2 U235 ( .I1(n239), .I2(n225), .O(n102) );
  NR2 U236 ( .I1(n239), .I2(n234), .O(n101) );
  NR2 U237 ( .I1(n239), .I2(n232), .O(n100) );
endmodule


module alu ( clk_p_i, reset_n_i, data_a_i, data_b_i, inst_i, data_o );
  input [7:0] data_a_i;
  input [7:0] data_b_i;
  input [2:0] inst_i;
  output [15:0] data_o;
  input clk_p_i, reset_n_i;
  wire   n2, \reg_data_a[0] , out_inst_1_15, N40, N41, N42, N43, N44, N45, N46,
         N47, N54, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17, n18,
         n20, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47, n49, n50, n51,
         n52, n53, n54, n56, n57, n58, n59, n60, n61, n63, n64, n65, n66, n67,
         n68, n70, n71, n72, n73, n74, n75, n77, n78, n79, n80, n81, n82, n83,
         n85, n86, n90, n93, n94, n96, n97, n98, n99, n100, n101, n102, n103,
         n105, n106, n107, n108, n111, n112, n114, n115, n117, n118, n119,
         n120, n121, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         \add_45/A[0] , \add_45/A[1] , \add_45/A[2] , \add_45/A[3] ,
         \add_45/A[4] , \add_45/A[5] , \add_45/A[6] , n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200;
  wire   [7:0] reg_data_b;
  wire   [8:0] out_inst_0;
  wire   [8:0] out_inst_1;
  wire   [15:0] out_inst_2;
  wire   [6:0] out_inst_3;
  wire   [2:0] cur_state;
  wire   [15:2] \add_45/carry ;

  AO112 U3 ( .C1(data_o[8]), .C2(n164), .A1(n6), .B1(n7), .O(n123) );
  AO222 U4 ( .A1(out_inst_0[8]), .A2(n160), .B1(n157), .B2(out_inst_1[8]), 
        .C1(out_inst_2[8]), .C2(n173), .O(n7) );
  ND2 U18 ( .I1(data_o[10]), .I2(n165), .O(n24) );
  ND2 U21 ( .I1(data_o[11]), .I2(n5), .O(n26) );
  ND2 U24 ( .I1(data_o[12]), .I2(n166), .O(n28) );
  ND2 U27 ( .I1(data_o[13]), .I2(n165), .O(n30) );
  ND2 U30 ( .I1(data_o[14]), .I2(n5), .O(n32) );
  ND2 U33 ( .I1(data_o[15]), .I2(n166), .O(n34) );
  ND2 U77 ( .I1(n77), .I2(cur_state[1]), .O(n18) );
  OR3B2 U83 ( .I1(n80), .B1(n81), .B2(n82), .O(n137) );
  AO222 U93 ( .A1(N46), .A2(n162), .B1(n195), .B2(n180), .C1(data_o[7]), .C2(
        n164), .O(n80) );
  ND2 U100 ( .I1(data_o[9]), .I2(n165), .O(n93) );
  ND2 U102 ( .I1(n97), .I2(out_inst_1_15), .O(n96) );
  ND2 U105 ( .I1(n98), .I2(n196), .O(n11) );
  ND2 U108 ( .I1(n105), .I2(n106), .O(n103) );
  ND2 U110 ( .I1(inst_i[0]), .I2(n196), .O(n102) );
  ND2 U112 ( .I1(inst_i[1]), .I2(inst_i[0]), .O(n108) );
  ND2 U113 ( .I1(n196), .I2(n185), .O(n107) );
  ND2 U114 ( .I1(n111), .I2(n112), .O(n140) );
  AO12 U119 ( .B1(n181), .B2(n200), .A1(inst_i[0]), .O(n115) );
  OA112 U138 ( .C1(inst_i[2]), .C2(cur_state[2]), .A1(n118), .B1(inst_i[1]), 
        .O(n119) );
  ND2 U139 ( .I1(n98), .I2(cur_state[0]), .O(n118) );
  alu_DW01_sub_0 sub_40 ( .A({n2, n2, reg_data_b}), .B({n2, n2, out_inst_3, 
        \reg_data_a[0] }), .CI(n2), .DIFF({out_inst_1_15, out_inst_1}) );
  alu_DW01_add_0 add_39 ( .A({n2, out_inst_3, \reg_data_a[0] }), .B({n2, 
        reg_data_b}), .CI(n2), .SUM(out_inst_0) );
  alu_DW_mult_uns_0 mult_41 ( .a({out_inst_3, \reg_data_a[0] }), .b(reg_data_b), .product(out_inst_2) );
  HA1 \add_45/U1_1_1  ( .A(\add_45/A[1] ), .B(\add_45/A[0] ), .C(
        \add_45/carry [2]), .S(N40) );
  HA1 \add_45/U1_1_2  ( .A(\add_45/A[2] ), .B(\add_45/carry [2]), .C(
        \add_45/carry [3]), .S(N41) );
  HA1 \add_45/U1_1_3  ( .A(\add_45/A[3] ), .B(\add_45/carry [3]), .C(
        \add_45/carry [4]), .S(N42) );
  HA1 \add_45/U1_1_4  ( .A(\add_45/A[4] ), .B(\add_45/carry [4]), .C(
        \add_45/carry [5]), .S(N43) );
  HA1 \add_45/U1_1_5  ( .A(\add_45/A[5] ), .B(\add_45/carry [5]), .C(
        \add_45/carry [6]), .S(N44) );
  HA1 \add_45/U1_1_6  ( .A(\add_45/A[6] ), .B(\add_45/carry [6]), .C(
        \add_45/carry [7]), .S(N45) );
  HA1 \add_45/U1_1_7  ( .A(n180), .B(\add_45/carry [7]), .C(\add_45/carry [8]), 
        .S(N46) );
  QDFFRBN \cur_state_reg[0]  ( .D(n141), .CK(clk_p_i), .RB(n176), .Q(
        cur_state[0]) );
  QDFFRBN \cur_state_reg[1]  ( .D(n140), .CK(clk_p_i), .RB(n176), .Q(
        cur_state[1]) );
  QDFFRBN \cur_state_reg[2]  ( .D(n139), .CK(clk_p_i), .RB(n177), .Q(
        cur_state[2]) );
  QDFFRBN \reg_data_a_reg[7]  ( .D(data_a_i[7]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[6]) );
  QDFFRBN \reg_data_b_reg[7]  ( .D(data_b_i[7]), .CK(clk_p_i), .RB(n175), .Q(
        reg_data_b[7]) );
  QDFFRBN \reg_data_a_reg[6]  ( .D(data_a_i[6]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[5]) );
  QDFFRBN \reg_data_b_reg[5]  ( .D(data_b_i[5]), .CK(clk_p_i), .RB(n175), .Q(
        reg_data_b[5]) );
  QDFFRBN \reg_data_b_reg[6]  ( .D(data_b_i[6]), .CK(clk_p_i), .RB(n175), .Q(
        reg_data_b[6]) );
  QDFFRBN \reg_data_a_reg[3]  ( .D(data_a_i[3]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[2]) );
  QDFFRBN \reg_data_a_reg[5]  ( .D(data_a_i[5]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[4]) );
  QDFFRBN \reg_data_b_reg[3]  ( .D(data_b_i[3]), .CK(clk_p_i), .RB(n176), .Q(
        reg_data_b[3]) );
  QDFFRBN \reg_data_a_reg[4]  ( .D(data_a_i[4]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[3]) );
  QDFFRBN \reg_data_b_reg[4]  ( .D(data_b_i[4]), .CK(clk_p_i), .RB(n175), .Q(
        reg_data_b[4]) );
  QDFFRBN \reg_data_a_reg[2]  ( .D(data_a_i[2]), .CK(clk_p_i), .RB(n174), .Q(
        out_inst_3[1]) );
  QDFFRBN \reg_data_b_reg[0]  ( .D(data_b_i[0]), .CK(clk_p_i), .RB(n176), .Q(
        reg_data_b[0]) );
  QDFFRBN \reg_data_b_reg[1]  ( .D(data_b_i[1]), .CK(clk_p_i), .RB(n176), .Q(
        reg_data_b[1]) );
  QDFFRBN \reg_data_a_reg[1]  ( .D(data_a_i[1]), .CK(clk_p_i), .RB(n175), .Q(
        out_inst_3[0]) );
  QDFFRBN \reg_data_b_reg[2]  ( .D(data_b_i[2]), .CK(clk_p_i), .RB(n176), .Q(
        reg_data_b[2]) );
  QDFFRBN \reg_data_a_reg[0]  ( .D(data_a_i[0]), .CK(clk_p_i), .RB(n175), .Q(
        \reg_data_a[0] ) );
  QDFFRBT \ALU_d2_r_reg[0]  ( .D(n124), .CK(clk_p_i), .RB(n178), .Q(data_o[0])
         );
  QDFFRBT \ALU_d2_r_reg[1]  ( .D(n131), .CK(clk_p_i), .RB(n178), .Q(data_o[1])
         );
  QDFFRBT \ALU_d2_r_reg[2]  ( .D(n132), .CK(clk_p_i), .RB(reset_n_i), .Q(
        data_o[2]) );
  QDFFRBT \ALU_d2_r_reg[3]  ( .D(n133), .CK(clk_p_i), .RB(reset_n_i), .Q(
        data_o[3]) );
  QDFFRBT \ALU_d2_r_reg[4]  ( .D(n134), .CK(clk_p_i), .RB(n177), .Q(data_o[4])
         );
  QDFFRBT \ALU_d2_r_reg[5]  ( .D(n135), .CK(clk_p_i), .RB(n177), .Q(data_o[5])
         );
  QDFFRBT \ALU_d2_r_reg[6]  ( .D(n136), .CK(clk_p_i), .RB(n177), .Q(data_o[6])
         );
  QDFFRBT \ALU_d2_r_reg[10]  ( .D(n125), .CK(clk_p_i), .RB(n178), .Q(
        data_o[10]) );
  QDFFRBT \ALU_d2_r_reg[11]  ( .D(n126), .CK(clk_p_i), .RB(n178), .Q(
        data_o[11]) );
  QDFFRBT \ALU_d2_r_reg[12]  ( .D(n127), .CK(clk_p_i), .RB(n178), .Q(
        data_o[12]) );
  QDFFRBT \ALU_d2_r_reg[13]  ( .D(n128), .CK(clk_p_i), .RB(reset_n_i), .Q(
        data_o[13]) );
  QDFFRBT \ALU_d2_r_reg[14]  ( .D(n129), .CK(clk_p_i), .RB(reset_n_i), .Q(
        data_o[14]) );
  QDFFRBT \ALU_d2_r_reg[15]  ( .D(n130), .CK(clk_p_i), .RB(reset_n_i), .Q(
        data_o[15]) );
  QDFFRBT \ALU_d2_r_reg[9]  ( .D(n138), .CK(clk_p_i), .RB(n177), .Q(data_o[9])
         );
  QDFFRBT \ALU_d2_r_reg[8]  ( .D(n123), .CK(clk_p_i), .RB(n178), .Q(data_o[8])
         );
  QDFFRBT \ALU_d2_r_reg[7]  ( .D(n137), .CK(clk_p_i), .RB(n177), .Q(data_o[7])
         );
  ND3 U152 ( .I1(out_inst_1_15), .I2(n171), .I3(n90), .O(n168) );
  AN2 U153 ( .I1(cur_state[0]), .I2(n90), .O(n5) );
  INV1S U154 ( .I(n169), .O(n152) );
  INV1S U155 ( .I(n11), .O(n153) );
  OAI22S U156 ( .A1(out_inst_1_15), .A2(n11), .B1(n194), .B2(n96), .O(n23) );
  INV1S U157 ( .I(n23), .O(n154) );
  INV1S U158 ( .I(n23), .O(n155) );
  ND2 U159 ( .I1(n77), .I2(cur_state[1]), .O(n156) );
  ND2 U160 ( .I1(n86), .I2(n171), .O(n9) );
  INV1S U161 ( .I(n9), .O(n157) );
  INV1S U162 ( .I(n9), .O(n158) );
  NR2 U163 ( .I1(\add_45/carry [8]), .I2(out_inst_1[8]), .O(n159) );
  ND2 U164 ( .I1(n83), .I2(n198), .O(n8) );
  INV1S U165 ( .I(n8), .O(n160) );
  INV1S U166 ( .I(n8), .O(n161) );
  INV1S U167 ( .I(n168), .O(n162) );
  INV1S U168 ( .I(n168), .O(n163) );
  INV1S U169 ( .I(n5), .O(n171) );
  INV1S U170 ( .I(n171), .O(n164) );
  INV1S U171 ( .I(n171), .O(n165) );
  INV1S U172 ( .I(n171), .O(n166) );
  INV1S U173 ( .I(n79), .O(n167) );
  INV1S U174 ( .I(out_inst_1_15), .O(n179) );
  INV1S U175 ( .I(n168), .O(n12) );
  INV1S U176 ( .I(n79), .O(n193) );
  INV1S U177 ( .I(n77), .O(n194) );
  INV1S U178 ( .I(n11), .O(n195) );
  MOAI1S U179 ( .A1(n199), .A2(n196), .B1(n179), .B2(n90), .O(n86) );
  INV1S U180 ( .I(out_inst_1[6]), .O(\add_45/A[6] ) );
  INV1S U181 ( .I(out_inst_1[5]), .O(\add_45/A[5] ) );
  INV1S U182 ( .I(out_inst_1[4]), .O(\add_45/A[4] ) );
  INV1S U183 ( .I(out_inst_1[3]), .O(\add_45/A[3] ) );
  INV1S U184 ( .I(out_inst_1[2]), .O(\add_45/A[2] ) );
  INV1S U185 ( .I(out_inst_1[1]), .O(\add_45/A[1] ) );
  INV1S U186 ( .I(out_inst_1[7]), .O(n180) );
  INV1S U187 ( .I(out_inst_1[0]), .O(\add_45/A[0] ) );
  INV1S U188 ( .I(n101), .O(n182) );
  MOAI1S U189 ( .A1(n18), .A2(n186), .B1(out_inst_0[6]), .B2(n160), .O(n75) );
  NR2 U190 ( .I1(n196), .I2(n164), .O(n77) );
  NR2 U191 ( .I1(n200), .I2(n198), .O(n90) );
  NR2 U192 ( .I1(n194), .I2(n200), .O(n79) );
  INV1S U193 ( .I(n97), .O(n199) );
  NR2 U194 ( .I1(n196), .I2(n198), .O(n105) );
  INV1S U195 ( .I(n169), .O(n173) );
  INV1S U196 ( .I(n169), .O(n172) );
  BUF1CK U197 ( .I(n170), .O(n177) );
  BUF1CK U198 ( .I(n170), .O(n176) );
  BUF1CK U199 ( .I(n170), .O(n175) );
  BUF1CK U200 ( .I(n170), .O(n174) );
  BUF1CK U201 ( .I(n170), .O(n178) );
  ND3 U202 ( .I1(n154), .I2(n32), .I3(n33), .O(n129) );
  AOI22S U203 ( .A1(out_inst_2[14]), .A2(n172), .B1(n159), .B2(n163), .O(n33)
         );
  ND3 U204 ( .I1(n154), .I2(n34), .I3(n35), .O(n130) );
  AOI22S U205 ( .A1(out_inst_2[15]), .A2(n152), .B1(N54), .B2(n162), .O(n35)
         );
  ND3 U206 ( .I1(n154), .I2(n30), .I3(n31), .O(n128) );
  AOI22S U207 ( .A1(out_inst_2[13]), .A2(n173), .B1(n159), .B2(n12), .O(n31)
         );
  ND3 U208 ( .I1(n154), .I2(n28), .I3(n29), .O(n127) );
  AOI22S U209 ( .A1(out_inst_2[12]), .A2(n152), .B1(N54), .B2(n163), .O(n29)
         );
  ND3 U210 ( .I1(n155), .I2(n26), .I3(n27), .O(n126) );
  AOI22S U211 ( .A1(out_inst_2[11]), .A2(n172), .B1(N54), .B2(n162), .O(n27)
         );
  ND3 U212 ( .I1(n155), .I2(n24), .I3(n25), .O(n125) );
  AOI22S U213 ( .A1(out_inst_2[10]), .A2(n152), .B1(n159), .B2(n12), .O(n25)
         );
  ND3 U214 ( .I1(n155), .I2(n93), .I3(n94), .O(n138) );
  AOI22S U215 ( .A1(out_inst_2[9]), .A2(n173), .B1(N54), .B2(n163), .O(n94) );
  MOAI1S U216 ( .A1(out_inst_1[8]), .A2(n11), .B1(N47), .B2(n12), .O(n6) );
  AOI22S U217 ( .A1(out_inst_0[7]), .A2(n161), .B1(out_inst_2[7]), .B2(n172), 
        .O(n82) );
  AOI22S U218 ( .A1(n79), .A2(n85), .B1(n158), .B2(out_inst_1[7]), .O(n81) );
  MOAI1S U219 ( .A1(n20), .A2(n167), .B1(out_inst_1[0]), .B2(n158), .O(n16) );
  XNR2HS U220 ( .I1(reg_data_b[0]), .I2(\reg_data_a[0] ), .O(n20) );
  MOAI1S U221 ( .A1(n42), .A2(n193), .B1(out_inst_1[1]), .B2(n157), .O(n39) );
  XNR2HS U222 ( .I1(out_inst_3[0]), .I2(reg_data_b[1]), .O(n42) );
  MOAI1S U223 ( .A1(n49), .A2(n193), .B1(out_inst_1[2]), .B2(n157), .O(n46) );
  XNR2HS U224 ( .I1(out_inst_3[1]), .I2(reg_data_b[2]), .O(n49) );
  MOAI1S U225 ( .A1(n56), .A2(n193), .B1(out_inst_1[3]), .B2(n158), .O(n53) );
  XNR2HS U226 ( .I1(out_inst_3[2]), .I2(reg_data_b[3]), .O(n56) );
  MOAI1S U227 ( .A1(n63), .A2(n193), .B1(out_inst_1[4]), .B2(n158), .O(n60) );
  XNR2HS U228 ( .I1(out_inst_3[3]), .I2(reg_data_b[4]), .O(n63) );
  MOAI1S U229 ( .A1(n70), .A2(n193), .B1(out_inst_1[5]), .B2(n158), .O(n67) );
  XNR2HS U230 ( .I1(out_inst_3[4]), .I2(reg_data_b[5]), .O(n70) );
  MOAI1S U231 ( .A1(n78), .A2(n193), .B1(out_inst_1[6]), .B2(n158), .O(n74) );
  XNR2HS U232 ( .I1(out_inst_3[5]), .I2(reg_data_b[6]), .O(n78) );
  ND3 U233 ( .I1(n13), .I2(n14), .I3(n15), .O(n124) );
  AOI22S U234 ( .A1(out_inst_2[0]), .A2(n173), .B1(n195), .B2(\add_45/A[0] ), 
        .O(n14) );
  AOI22S U235 ( .A1(out_inst_1[0]), .A2(n12), .B1(data_o[0]), .B2(n166), .O(
        n13) );
  NR2 U236 ( .I1(n16), .I2(n17), .O(n15) );
  ND3 U237 ( .I1(n36), .I2(n37), .I3(n38), .O(n131) );
  AOI22S U238 ( .A1(out_inst_2[1]), .A2(n152), .B1(n195), .B2(\add_45/A[1] ), 
        .O(n37) );
  AOI22S U239 ( .A1(N40), .A2(n163), .B1(data_o[1]), .B2(n165), .O(n36) );
  NR2 U240 ( .I1(n39), .I2(n40), .O(n38) );
  ND3 U241 ( .I1(n43), .I2(n44), .I3(n45), .O(n132) );
  AOI22S U242 ( .A1(out_inst_2[2]), .A2(n172), .B1(n195), .B2(\add_45/A[2] ), 
        .O(n44) );
  AOI22S U243 ( .A1(N41), .A2(n162), .B1(data_o[2]), .B2(n5), .O(n43) );
  NR2 U244 ( .I1(n46), .I2(n47), .O(n45) );
  ND3 U245 ( .I1(n50), .I2(n51), .I3(n52), .O(n133) );
  AOI22S U246 ( .A1(out_inst_2[3]), .A2(n173), .B1(n153), .B2(\add_45/A[3] ), 
        .O(n51) );
  AOI22S U247 ( .A1(N42), .A2(n12), .B1(data_o[3]), .B2(n166), .O(n50) );
  NR2 U248 ( .I1(n53), .I2(n54), .O(n52) );
  ND3 U249 ( .I1(n57), .I2(n58), .I3(n59), .O(n134) );
  AOI22S U250 ( .A1(out_inst_2[4]), .A2(n152), .B1(n195), .B2(\add_45/A[4] ), 
        .O(n58) );
  AOI22S U251 ( .A1(N43), .A2(n163), .B1(data_o[4]), .B2(n165), .O(n57) );
  NR2 U252 ( .I1(n60), .I2(n61), .O(n59) );
  ND3 U253 ( .I1(n64), .I2(n65), .I3(n66), .O(n135) );
  AOI22S U254 ( .A1(out_inst_2[5]), .A2(n172), .B1(n153), .B2(\add_45/A[5] ), 
        .O(n65) );
  AOI22S U255 ( .A1(N44), .A2(n162), .B1(data_o[5]), .B2(n5), .O(n64) );
  NR2 U256 ( .I1(n67), .I2(n68), .O(n66) );
  ND3 U257 ( .I1(n71), .I2(n72), .I3(n73), .O(n136) );
  AOI22S U258 ( .A1(out_inst_2[6]), .A2(n173), .B1(n195), .B2(\add_45/A[6] ), 
        .O(n72) );
  AOI22S U259 ( .A1(N45), .A2(n12), .B1(data_o[6]), .B2(n166), .O(n71) );
  NR2 U260 ( .I1(n74), .I2(n75), .O(n73) );
  AOI13HS U261 ( .B1(inst_i[1]), .B2(inst_i[0]), .B3(inst_i[2]), .A1(n166), 
        .O(n101) );
  AOI13HS U262 ( .B1(inst_i[2]), .B2(n183), .B3(n105), .A1(n182), .O(n117) );
  INV1S U263 ( .I(n106), .O(n183) );
  AOI13HS U264 ( .B1(n115), .B2(n184), .B3(n117), .A1(n198), .O(n114) );
  ND3 U265 ( .I1(inst_i[1]), .I2(n97), .I3(n101), .O(n112) );
  AOI13HS U266 ( .B1(n106), .B2(n181), .B3(n197), .A1(n114), .O(n111) );
  INV1S U267 ( .I(n118), .O(n197) );
  MOAI1S U268 ( .A1(n119), .A2(n185), .B1(cur_state[0]), .B2(n120), .O(n141)
         );
  OAI112HS U269 ( .C1(n181), .C2(n118), .A1(n121), .B1(n117), .O(n120) );
  ND3 U270 ( .I1(inst_i[1]), .I2(n181), .I3(n105), .O(n121) );
  NR2 U271 ( .I1(n184), .I2(inst_i[0]), .O(n106) );
  INV1S U272 ( .I(inst_i[1]), .O(n184) );
  MOAI1S U273 ( .A1(n99), .A2(n200), .B1(n100), .B2(n101), .O(n139) );
  AN4B1S U274 ( .I1(n181), .I2(n107), .I3(n108), .B1(n182), .O(n99) );
  AOI13HS U275 ( .B1(n102), .B2(n199), .B3(n103), .A1(n181), .O(n100) );
  INV1S U276 ( .I(inst_i[2]), .O(n181) );
  INV1S U277 ( .I(inst_i[0]), .O(n185) );
  MOAI1S U278 ( .A1(n156), .A2(n187), .B1(out_inst_0[5]), .B2(n160), .O(n68)
         );
  INV1S U279 ( .I(out_inst_3[5]), .O(n187) );
  INV1S U280 ( .I(cur_state[2]), .O(n200) );
  MOAI1S U281 ( .A1(n18), .A2(n192), .B1(out_inst_0[0]), .B2(n161), .O(n17) );
  INV1S U282 ( .I(out_inst_3[0]), .O(n192) );
  MOAI1S U283 ( .A1(n18), .A2(n191), .B1(out_inst_0[1]), .B2(n161), .O(n40) );
  INV1S U284 ( .I(out_inst_3[1]), .O(n191) );
  MOAI1S U285 ( .A1(n156), .A2(n190), .B1(out_inst_0[2]), .B2(n161), .O(n47)
         );
  INV1S U286 ( .I(out_inst_3[2]), .O(n190) );
  MOAI1S U287 ( .A1(n18), .A2(n189), .B1(out_inst_0[3]), .B2(n161), .O(n54) );
  INV1S U288 ( .I(out_inst_3[3]), .O(n189) );
  MOAI1S U289 ( .A1(n156), .A2(n188), .B1(out_inst_0[4]), .B2(n161), .O(n61)
         );
  INV1S U290 ( .I(out_inst_3[4]), .O(n188) );
  INV1S U291 ( .I(cur_state[1]), .O(n198) );
  INV1S U292 ( .I(cur_state[0]), .O(n196) );
  NR2 U293 ( .I1(n200), .I2(cur_state[1]), .O(n98) );
  NR2 U294 ( .I1(cur_state[1]), .I2(cur_state[2]), .O(n97) );
  NR2 U295 ( .I1(cur_state[0]), .I2(cur_state[2]), .O(n83) );
  ND2 U296 ( .I1(n83), .I2(cur_state[1]), .O(n169) );
  XNR2HS U297 ( .I1(reg_data_b[7]), .I2(n186), .O(n85) );
  INV1S U298 ( .I(out_inst_3[6]), .O(n186) );
  BUF1CK U299 ( .I(reset_n_i), .O(n170) );
  TIE0 U300 ( .O(n2) );
  XOR2HS U301 ( .I1(\add_45/carry [8]), .I2(n179), .O(N47) );
  NR2 U302 ( .I1(\add_45/carry [8]), .I2(out_inst_1[8]), .O(N54) );
endmodule

