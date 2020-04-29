module lfsr_ff(clk,ffin,ffout);

input clk, ffin;
output ffout;

always @(posedge clk)
begin
ffin <= ffout;
end

endmodule
