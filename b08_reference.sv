module b08_reference (
    input  logic [7:0] mux_in,
    input  logic [2:0] sel,
    input  logic       demux_in,
    output logic       mux_ref,
    output logic [7:0] demux_ref
);
    always_comb begin
        mux_ref = mux_in[sel];
        demux_ref = 8'b0;
        demux_ref[sel] = demux_in;
    end
endmodule
