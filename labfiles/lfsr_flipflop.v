module lfsr_flipflop (lfsrdata,lfsr0, lfsr1, lfsr2, lfsr3, lfsr4, clk);

input clk;

output reg [4:0] lfsrdata = 5'd01;
output reg lfsr0, lfsr1, lfsr2, lfsr3, lfsr4;

always @ (posedge clk)

begin
lfsr3 = lfsrdata[4];
lfsr2 = lfsrdata[3];
lfsr1 = lfsrdata[2];
lfsr0 = lfsrdata[1];

lfsr4 = (lfsrdata[0]^lfsrdata[2]);

lfsrdata = ({lfsr4, lfsr3, lfsr2, lfsr1, lfsr0});

end

endmodule
