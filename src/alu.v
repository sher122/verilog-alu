module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] opcode,

    output reg [3:0] result,
    output reg carry,
    output reg zero,
    output reg negative
);

reg [4:0] temp;

always @(*) begin

    // Default values
    result = 4'b0000;
    carry = 1'b0;
    zero = 1'b0;
    negative = 1'b0;
    temp = 5'b00000;

    case(opcode)

        // ADD
        3'b000: begin
            temp = A + B;
            result = temp[3:0];
            carry = temp[4];
        end

        // SUB
        3'b001: begin
            temp = A - B;
            result = temp[3:0];
            carry = temp[4];
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

    // Status Flags
    zero = (result == 4'b0000);
    negative = result[3];

end

endmodule