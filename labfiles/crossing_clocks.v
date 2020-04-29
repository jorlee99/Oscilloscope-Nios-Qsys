module crossing_clocks (fast,slow,indata,outdata);

input fast,slow; //input clocks

input [11:0] indata;

output [11:0] outdata; //output 

wire [11:0] ff1,ff2;
wire temp,enable;

always @ (posedge fast)
begin
ff1 <= indata; //reg1
end

always @ (posedge fast)
begin
if (enable)
ff2 <= ff1; //reg3
end

always @ (posedge slow)
begin
outdata <= ff2; //reg2
end

always @ (negedge fast)
begin
temp <= slow; //wait for clock cycle
end

always @ (negedge fast)
begin
enable <= temp;
end

endmodule

