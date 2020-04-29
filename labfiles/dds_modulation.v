module dds_modulation(clk,slow_clk, lfsr_mod, in_mod, cross_out,modulation);

input clk,lfsr_mod,slow_clk;
input [11:0] in_mod;
input [3:0] modulation;

output [11:0] cross_out;

reg [11:0] out_mod;

parameter ook = 4'b0000;
parameter fsk = 4'b0001;
parameter bpsk = 4'b0010;
parameter lfsr = 4'b0011;

always @(posedge clk)

begin

	case(modulation)

	ook:
		begin
			if (lfsr_mod)
				out_mod <= in_mod; //if high on
				
			else 
				out_mod <= 0; // if low off
		end
		
	fsk:
		begin
			out_mod <= in_mod;//output the wave from dds_increment
		end

	bpsk:
		begin
			if (lfsr_mod)
				out_mod <= ~in_mod+1'b1;//if high negative
			else
				out_mod <= in_mod;//if low regular
		end
	
	lfsr:
		begin
			if (lfsr_mod)
				out_mod <= 12'b100000000000;//if high 1
			else
				out_mod <= 12'b0;//if low 0
		end


	endcase
end

crossing_clocks(.fast(clk),.slow(slow_clk),.indata(out_mod),.outdata(cross_out));

endmodule
