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

    // Generate waveform
    $dumpfile("sim/alu.vcd");
    $dumpvars(0, alu_tb);

    $display("\n==============================");
    $display("SELF CHECKING TESTBENCH");
    $display("==============================\n");

    //---------------- ADD ----------------

    A = 8'd25;
    B = 8'd17;
    opcode = 3'b000;
    #10;

    if(result == 42)
        $display("ADD Test ........ PASS");
    else
        $display("ADD Test ........ FAIL");

    //---------------- SUB ----------------

    opcode = 3'b001;
    #10;

    if(result == 8)
        $display("SUB Test ........ PASS");
    else
        $display("SUB Test ........ FAIL");

    //---------------- AND ----------------

    A = 8'b11001100;
    B = 8'b10101010;
    opcode = 3'b010;
    #10;

    if(result == 8'b10001000)
        $display("AND Test ........ PASS");
    else
        $display("AND Test ........ FAIL");

    //---------------- OR ----------------

    opcode = 3'b011;
    #10;

    if(result == 8'b11101110)
        $display("OR Test ......... PASS");
    else
        $display("OR Test ......... FAIL");

    //---------------- XOR ----------------

    opcode = 3'b100;
    #10;

    if(result == 8'b01100110)
        $display("XOR Test ........ PASS");
    else
        $display("XOR Test ........ FAIL");

    //---------------- NOT ----------------

    opcode = 3'b101;
    #10;

    if(result == 8'b00110011)
        $display("NOT Test ........ PASS");
    else
        $display("NOT Test ........ FAIL");

    //---------------- SHIFT LEFT ----------------

    A = 8'b00001111;
    opcode = 3'b110;
    #10;

    if(result == 8'b00011110)
        $display("SHL Test ........ PASS");
    else
        $display("SHL Test ........ FAIL");

    //---------------- SHIFT RIGHT ----------------

    A = 8'b11110000;
    opcode = 3'b111;
    #10;

    if(result == 8'b01111000)
        $display("SHR Test ........ PASS");
    else
        $display("SHR Test ........ FAIL");

    //---------------- OVERFLOW ----------------

    A = 8'b01111111;
    B = 8'b00000001;
    opcode = 3'b000;
    #10;

    if(overflow)
        $display("Overflow Test ... PASS");
    else
        $display("Overflow Test ... FAIL");

    $display("\n==============================");
    $display("All tests completed.");
    $display("==============================");

    $finish;

end

endmodule