module signal_retriever (clk,slow_clk,out_signal,sin,cos,squ,saw,select,out_wave);

input clk,slow_clk;
input [11:0] sin,cos,squ,saw;
input [2:0] select;

output [11:0] out_signal;
output [11:0] out_wave;

parameter sin_s = 2'b00;
parameter cos_s = 2'b01;
parameter saw_s = 2'b10;
parameter squ_s = 2'b11;

always @ (posedge clk)
begin
	
	case(select)
		sin_s:
			out_signal <= sin; //sine wave
			
		cos_s:
			out_signal <= cos; //cos wave
		
		saw_s:
			out_signal <= saw; //saw wave
			
		squ_s:
			out_signal <= squ; //square wave
		
	endcase

end

crossing_clocks(.fast(clk),.slow(slow_clk),.indata(out_signal),.outdata(out_wave));
endmodule
