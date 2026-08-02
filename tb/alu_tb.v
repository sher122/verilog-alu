module alu_tb;

parameter WIDTH = 8;

reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [2:0] opcode;

wire [WIDTH-1:0] result;
wire carry;
wire zero;
wire negative;
wire overflow;

alu #(WIDTH) uut (

    .A(A),
    .B(B),
    .opcode(opcode),

    .result(result),
    .carry(carry),
    .zero(zero),
    .negative(negative),
    .overflow(overflow)

);

initial begin
$dumpfile("sim/alu.vcd");
$dumpvars(0, alu_tb);
$display("===== 8-BIT ALU TEST =====");

// ADD
A=8'd25;
B=8'd17;
opcode=3'b000;
#10;

$display("ADD Result=%d",result);

// SUB
opcode=3'b001;
#10;

$display("SUB Result=%d",result);

// AND
A=8'b11001100;
B=8'b10101010;
opcode=3'b010;
#10;

$display("AND Result=%b",result);

// OR
opcode=3'b011;
#10;

$display("OR Result=%b",result);

// XOR
opcode=3'b100;
#10;

$display("XOR Result=%b",result);

// NOT
opcode=3'b101;
#10;

$display("NOT Result=%b",result);

// SHL
A=8'b00001111;
opcode=3'b110;
#10;

$display("SHL Result=%b",result);

// SHR
A=8'b11110000;
opcode=3'b111;
#10;

$display("SHR Result=%b",result);

// Overflow Test

A=8'b01111111;
B=8'b00000001;
opcode=3'b000;
#10;

$display("Overflow=%b",overflow);

$finish;

end

endmodule