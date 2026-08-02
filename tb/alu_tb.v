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

      // ---------------- ADD ----------------
    A = 4'd7;
    B = 4'd5;
    opcode = 3'b000;
    #10;
    $display("ADD : %d + %d = %d", A, B, result);

    // ---------------- SUB ----------------
    opcode = 3'b001;
    #10;
    $display("SUB : %d - %d = %d", A, B, result);

    // ---------------- AND ----------------
    A = 4'b1100;
    B = 4'b1010;
    opcode = 3'b010;
    #10;
    $display("AND : %b", result);

    // ---------------- OR -----------------
    opcode = 3'b011;
    #10;
    $display("OR  : %b", result);

    // ---------------- XOR ----------------
    opcode = 3'b100;
    #10;
    $display("XOR : %b", result);

    // ---------------- NOT ----------------
    opcode = 3'b101;
    #10;
    $display("NOT : %b", result);

    // ------------ SHIFT LEFT -------------
    A = 4'b0011;
    opcode = 3'b110;
    #10;
    $display("SHL : %b", result);

    // ------------ SHIFT RIGHT ------------
    A = 4'b1100;
    opcode = 3'b111;
    #10;
    $display("SHR : %b", result);

    $finish;
    end

endmodule