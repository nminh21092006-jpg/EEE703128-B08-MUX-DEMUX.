module b08_mux_only (
    input logic [7:0] mux_in,
    input logic [2:0] sel,
    output logic mux_out
);
    assign mux_out = mux_in[sel];
endmodule
