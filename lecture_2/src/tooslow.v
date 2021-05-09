module tooslow (i_clk, o_led);
    input   wire    i_clk;
    output  wire    o_led;

    parameter   NBITS = 1024;
    reg [NBITS - 1:0] counter;

    always @(posedge i_clk) begin
        counter <= counter + 1;
    end

    assign o_led = counter[NBITS-1];

endmodule