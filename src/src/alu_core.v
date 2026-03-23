module alu_core (
    input  [15:0] a, b,
    input  [2:0] op,
    output reg [15:0] result
);

    wire [15:0] add_out;

    // CLA Adder instance
    cla_adder cla (
        .a(a),
        .b(b),
        .cin(0),
        .sum(add_out),
        .cout()
    );

    always @(*) begin
        case (op)
            3'b000: result = add_out;      // ADD
            3'b001: result = a - b;        // SUB
            3'b010: result = a & b;        // AND
            3'b011: result = a | b;        // OR
            3'b100: result = a ^ b;        // XOR
            3'b101: result = a << 1;       // SHIFT LEFT
            3'b110: result = a >> 1;       // SHIFT RIGHT
            default: result = 16'b0;
        endcase
    end

endmodule
