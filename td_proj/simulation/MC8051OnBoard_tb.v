¡¤timescale 1ns/1ns

module MC8051OnBoard_tb;

reg   sysclk;
reg  rst;

wire led;

  MC8051OnBoard uut(
.sysclk(sysclk),
.key(rst),  
.led(led)
);

initial 
begin
sysclk=0;
rst = 1; #100
rst = 0;


end

always
#10 sysclk=~sysclk;

endmodule 