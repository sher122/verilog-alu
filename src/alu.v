module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] opcode,

    output reg [3:0] result,
    output reg carry,
    output reg zero,
    output reg negative,
    output reg overflow
);

reg [4:0] temp;

always @(*) begin

    result = 4'b0000;
    carry = 0;
    zero = 0;
    negative = 0;
    overflow = 0;
    temp = 5'b00000;

    case(opcode)

        // ADD
        3'b000: begin
            temp = A + B;
            result = temp[3:0];
            carry = temp[4];

            overflow =
                (~A[3] & ~B[3] & result[3]) |
                ( A[3] &  B[3] & ~result[3]);
        end

        // SUB
        3'b001: begin
            temp = A - B;
            result = temp[3:0];
            carry = temp[4];

            overflow =
                (~A[3] & B[3] & result[3]) |
                ( A[3] & ~B[3] & ~result[3]);
        end

        // AND
        3'b010:
            result = A & B;

        // OR
        3'b011:
            result = A | B;

        // XOR
        3'b100:
            result = A ^ B;

        // NOT
        3'b101:
            result = ~A;

        // Shift Left
        3'b110:
            result = A << 1;

        // Shift Right
        3'b111:
            result = A >> 1;

        default:
            result = 4'b0000;

    endcase

    zero = (result == 4'b0000);
    negative = result[3];

end

endmodule