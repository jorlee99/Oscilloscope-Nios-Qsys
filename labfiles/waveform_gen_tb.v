module waveform_gen_tb;

reg clk,reset,en;
reg [31:0] phase_inc;

wire [11:0] sin_out,cos_out,squ_out,saw_out;

waveform_gen DUT (clk,reset,en,phase_inc,sin_out,cos_out,squ_out,saw_out);

initial begin
clk = 1'b0;
#5;
	forever begin
		clk = 1'b1;
		#5;
		clk = 1'b0;
		#5;
	end

end

initial begin
reset = 1'b0;
en = 1'b1;
phase_inc = 32'd429496730;
#10;

reset = 1'b1;
#2500;
end

endmodule
