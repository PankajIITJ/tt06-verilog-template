/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module evm(
input voting_en,clk; //voting process will start when vote_en is on
input [2:0]voter_switch;
output [6:0]party1; //Max no. of votes = 127
output [6:0]party2;
output [6:0]party3;
output [2:0]vote_indicator; //vote_indicator[0]=party1 led, vote_indicator[1]=party2 led,…
output invalid; //invalid vote indicator led
);  
//counters to count each party votes
reg [6:0]cnt_reg1=0; //party1
reg [6:0]cnt_nxt1=0; //party1
reg [6:0]cnt_reg2=0; //party2
reg [6:0]cnt_nxt2=0; //party2
reg [6:0]cnt_reg3=0; //party3
reg [6:0]cnt_nxt3=0; //party3
reg [2:0]s;
reg t;
 //Final count i.e. total number of votes
assign party1 = cnt_reg1; // votes gain by party 1
assign party2 = cnt_reg2; // votes gain by party 2
assign party3 = cnt_reg3; // votes gain by party 3 
assign vote_indicator = s
assign invalid = t
    //counter for party1 votes
always@(posedge clk)
    if(voter_switch == 3'b001 && voting_en == 1'b1)
begin
cnt_reg1 <= cnt_reg1 +1;
end
//Counter for party2 votes
always@(posedge clk)
    if(voter_switch == 3'b010 && voting_en == 1'b1)
begin
cnt_reg2 <= cnt_reg2 +1;
end
//Counter for party3 votes
always@(posedge clk)
    if(voter_switch == 3'b100 && voting_en == 1'b1)
begin
cnt_reg3 <= cnt_reg3 +1;
end
//relation of &quot;voter_switch&quot; with &quot;vote_indicator&quot; &amp; &quot;invalid&quot;
always@(*)
if(voting_en)
case(voter_switch)
3'b100 : begin
s= 3'b100;
t = 1'b0;
end
3'b010 : begin
s = 3'b010;
t = 1'b0;
end
3'b001 : begin
s = 3'b001;
t = 1'b0;
end
3'b011 : begin
s = 3'b000;
t = 1'b1;
end
3'b110 : begin
s = 3'b000;
t = 1'b1;
end
3'b101 : begin
s = 3'b000;
t = 1'b1;
end
3'b111 : begin
s = 3'b000;
t = 1'b1;
end
3'b000: begin
s = 3'b000;
t = 1'b1;
end
endcase
endmodule

