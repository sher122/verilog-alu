module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;

    wire [3:0] result;
    wire carry;
    wire zero;
    wire negative;

    alu uut(
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .zero(zero),
        .negative(negative)
    );

    initial begin

        // ---------------- ADD ----------------
        A = 4'd7;
        B = 4'd5;
        opcode = 3'b000;
        #10;
        $display("ADD");
        $display("Result=%d Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ---------------- SUB ----------------
        opcode = 3'b001;
        #10;
        $display("SUB");
        $display("Result=%d Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ---------------- AND ----------------
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b010;
        #10;
        $display("AND");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ---------------- OR -----------------
        opcode = 3'b011;
        #10;
        $display("OR");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ---------------- XOR ----------------
        opcode = 3'b100;
        #10;
        $display("XOR");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ---------------- NOT ----------------
        opcode = 3'b101;
        #10;
        $display("NOT");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ------------ SHIFT LEFT -------------
        A = 4'b0011;
        opcode = 3'b110;
        #10;
        $display("SHIFT LEFT");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ------------ SHIFT RIGHT ------------
        A = 4'b1100;
        opcode = 3'b111;
        #10;
        $display("SHIFT RIGHT");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ------------ ZERO FLAG --------------
        A = 4'd5;
        B = 4'd5;
        opcode = 3'b001;
        #10;
        $display("ZERO FLAG TEST");
        $display("Result=%d Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        // ------------ CARRY FLAG -------------
        A = 4'b1111;
        B = 4'b0001;
        opcode = 3'b000;
        #10;
        $display("CARRY FLAG TEST");
        $display("Result=%b Carry=%b Zero=%b Negative=%b",
                 result, carry, zero, negative);

        $finish;

    end

endmodule