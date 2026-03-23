module cla_adder (
    input  [15:0] a, b,
    input  cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] p, g;
    wire [16:0] c;

    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign p[i] = a[i] ^ b[i];
            assign g[i] = a[i] & b[i];
            assign c[i+1] = g[i] | (p[i] & c[i]);
            assign sum[i] = p[i] ^ c[i];
        end
    endgenerate

    assign cout = c[16];

endmodule
