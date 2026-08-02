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

        $finish;

    end

endmodule