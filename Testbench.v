`timescale 1s / 1ms

module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_S(light_S)  ,.light_M2(light_M2),.light_MT(light_MT)   );
initial
begin
    clk=1'b0;
    forever #(5) clk=~clk;
end
//    initial
//    $stop;//to add ps
initial
begin
    rst=1'b0;
    
    #(1000000000);
    $finish;
    end
initial
begin
$dumpfile("traffic.vcd");
$dumpvars(0,Traffic_Light_Controller_TB);
$monitor($time," M1 = %3b, M2 = %3b, MT = %3b, S = %3b", light_M1, light_M2, light_MT, light_S );
end
endmodule
