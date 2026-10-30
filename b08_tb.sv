module b08_tb;
    logic [7:0] mux_in;
    logic [2:0] sel;
    logic demux_in;
    logic mux_out;
    logic [7:0] demux_out;
    logic mux_ref;
    logic [7:0] demux_ref;

    b08_mux_demux dut(
        .mux_in(mux_in), .sel(sel), .demux_in(demux_in),
        .mux_out(mux_out), .demux_out(demux_out)
    );

    b08_reference ref_i(
        .mux_in(mux_in), .sel(sel), .demux_in(demux_in),
        .mux_ref(mux_ref), .demux_ref(demux_ref)
    );

    task automatic check(
        input logic [7:0] m,
        input logic [2:0] s,
        input logic d
    );
        logic [7:0] e_demux;
        begin
            mux_in=m; sel=s; demux_in=d; #1;
            e_demux=8'b0;
            e_demux[s]=d;

            assert(mux_out===m[s])
                else $fatal(1,"B08 MUX mismatch m=%b s=%0d got=%b exp=%b",
                            m,s,mux_out,m[s]);
            assert(demux_out===e_demux)
                else $fatal(1,"B08 DEMUX mismatch d=%b s=%0d got=%b exp=%b",
                            d,s,demux_out,e_demux);
            assert(mux_ref===m[s]);
            assert(demux_ref===e_demux);
        end
    endtask

    initial begin
        // Charter: all 8 select values in both functions.
        for (int unsigned s=0; s<8; s++) begin
            check(8'b10101010,s,0);
            check(8'b01010101,s,1);
            check(8'b11110000,s,0);
            check(8'b00001111,s,1);
        end

        // Exhaustive MUX input patterns, all select values.
        for (int unsigned m=0; m<256; m++)
            for (int unsigned s=0; s<8; s++) begin
                check(m[7:0],s,0);
                check(m[7:0],s,1);
            end

        // Explicit boundaries.
        check(8'h00,0,0);
        check(8'hFF,7,1);
        check(8'h80,7,1);
        check(8'h01,0,1);

        $display("B08 exhaustive MUX/DEMUX validation PASS");
        $finish;
    end
endmodule
