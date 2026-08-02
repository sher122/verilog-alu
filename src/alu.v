module alu #(parameter WIDTH = 4)(

    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [2:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg zero,
    output reg negative,
    output reg overflow

);

reg [WIDTH:0] temp;

always @(*) begin

    result = 0;
    carry = 0;
    zero = 0;
    negative = 0;
    overflow = 0;
    temp = 0;

    case(opcode)

        // ADD
        3'b000: begin
            temp = A + B;
            result = temp[WIDTH-1:0];
            carry = temp[WIDTH];

            overflow =
                (~A[WIDTH-1] & ~B[WIDTH-1] & result[WIDTH-1]) |
                ( A[WIDTH-1] &  B[WIDTH-1] & ~result[WIDTH-1]);
        end

        // SUB
        3'b001: begin
            temp = A - B;
            result = temp[WIDTH-1:0];
            carry = temp[WIDTH];

            overflow =
                (~A[WIDTH-1] & B[WIDTH-1] & result[WIDTH-1]) |
                ( A[WIDTH-1] & ~B[WIDTH-1] & ~result[WIDTH-1]);
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

        // SHIFT LEFT
        3'b110:
            result = A << 1;

        // SHIFT RIGHT
        3'b111:
            result = A >> 1;

        default:
            result = 0;

    endcase

    zero = (result == 0);
    negative = result[WIDTH-1];

end

endmodule