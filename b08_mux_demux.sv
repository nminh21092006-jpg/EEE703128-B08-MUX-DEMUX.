module b08_mux_demux (
    input  logic [7:0] mux_in,
    input  logic [2:0] sel,
    input  logic       demux_in,
    output logic       mux_out,
    output logic [7:0] demux_out
);
    logic [7:0] onehot;

    always_comb begin
        onehot = 8'b0;
        onehot[sel] = 1'b1;

        mux_out = |(mux_in & onehot);
        demux_out = {8{demux_in}} & onehot;
    end
endmodule
