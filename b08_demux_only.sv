module b08_demux_only (
    input logic demux_in,
    input logic [2:0] sel,
    output logic [7:0] demux_out
);
    always_comb begin
        demux_out = 8'b0;
        demux_out[sel] = demux_in;
    end
endmodule
