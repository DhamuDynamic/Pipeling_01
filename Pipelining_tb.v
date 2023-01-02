// Testbench for Pipelining
module pipe_tb();
	parameter N = 10;
	reg [N-1:0] A,B,C,D;
	reg clk;
	wire [N-1:0] Y;
	pipe dut(clk,A,B,C,D,Y);
	initial
		begin
			clk = 1'b0;
			forever #10 clk = ~clk;
		end
	initial
		begin
			#5;
			A = 5;
			B = 10;
			C = 15;
			D = 20;
			#20;
			A = 4;
			B = 8;
			C = 12;
			D = 16;
			#20;
			A = 3;
			B = 6;
			C = 9;
			D = 12;
			#20;
			A = 6;
			B = 12;
			C = 18;
			D = 24;
			#20;
			A = 8;
			B = 16;
			C = 24;
			D = 32;
			#20;
			A = 10;
			B = 20;
			C = 30;
			D = 40;
			#20;
			A = 9;
			B = 18;
			C = 27;
			D = 36;
		end
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars(1);
			$monitor ("Time = %d,Y = %d",$time,Y);
			#200 $finish;
		end
endmodule
