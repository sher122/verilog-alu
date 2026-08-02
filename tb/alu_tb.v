module alu_tb;

reg [3:0] A;
reg [3:0] B;
reg [2:0] opcode;

wire [3:0] result;
wire carry;
wire zero;
wire negative;
wire overflow;

alu uut(

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

//--------------------------------------------------
$display("\n===== ADD =====");

A=7;
B=5;
opcode=3'b000;
#10;

$display("Result=%d Carry=%b Zero=%b Neg=%b Ovf=%b",
result,carry,zero,negative,overflow);

//--------------------------------------------------
$display("\n===== SUB =====");

A=7;
B=5;
opcode=3'b001;
#10;

$display("Result=%d Carry=%b Zero=%b Neg=%b Ovf=%b",
result,carry,zero,negative,overflow);

//--------------------------------------------------
$display("\n===== AND =====");

A=4'b1100;
B=4'b1010;
opcode=3'b010;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== OR =====");

opcode=3'b011;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== XOR =====");

opcode=3'b100;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== NOT =====");

opcode=3'b101;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== SHIFT LEFT =====");

A=4'b0011;
opcode=3'b110;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== SHIFT RIGHT =====");

A=4'b1100;
opcode=3'b111;
#10;

$display("Result=%b",result);

//--------------------------------------------------
$display("\n===== OVERFLOW TEST =====");

A=4'b0111;
B=4'b0001;
opcode=3'b000;
#10;

$display("Result=%b Carry=%b Zero=%b Neg=%b Ovf=%b",
result,carry,zero,negative,overflow);

//--------------------------------------------------

$finish;

end

endmodule