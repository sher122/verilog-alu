module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] SUM;

    alu uut (
        .A(A),
        .B(B),
        .SUM(SUM)
    );

    initial begin
        A = 4'd3;
        B = 4'd5;
        #10;
        $display("%d + %d = %d", A, B, SUM);

        A = 4'd7;
        B = 4'd2;
        #10;
        $display("%d + %d = %d", A, B, SUM);

        $finish;
    end

endmodule