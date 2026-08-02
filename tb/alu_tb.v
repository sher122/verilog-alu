module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;

    wire [3:0] result;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    initial begin

        // Test ADD
        A = 4'd7;
        B = 4'd5;
        opcode = 3'b000;
        #10;
        $display("ADD: %d + %d = %d", A, B, result);

        // Test SUB
        A = 4'd7;
        B = 4'd5;
        opcode = 3'b001;
        #10;
        $display("SUB: %d - %d = %d", A, B, result);

        // AND
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b010;
        #10;
        $display("AND = %b", result);

        // OR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b011;
        #10;
        $display("OR  = %b", result);

        // XOR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b100;
        #10;
        $display("XOR = %b", result);

        $finish;

    end

endmodule