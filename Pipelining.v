// Implementation of Pipelining
// Here I am implementing simple 3-stage pipeline 
// This code computes Y = ((A+B)-(C-D))*D
module pipe(clk,A,B,C,D,Y);
	// Considering N-Bit input
	parameter N = 10;
	input clk;
	input [N-1:0] A,B,C,D;
	output [N-1:0] Y;
	// Declaring intermediate latches
	reg [N-1:0] L12_X1,L12_X2,L12_D,L23_X3,L23_D,L34_Y;
	assign Y = L34_Y;
	// Here I used seperate always blocks for each and every stage
	// Stage-01
	always @(posedge clk)
		begin
			L12_X1 <= #4 A+B;
			L12_X2 <= #4 C-D;
			L12_D <= D;
		end
	// Stage-02
	always @(posedge clk)
		begin
			L23_X3 <= #4 L12_X1+L12_X2;
			L23_D <= L12_D;
		end
	// Stage-03
	always @(posedge clk)
		begin
			L34_Y = #6 L23_X3 * L23_D;
		end
endmodule
