module strobe(i_clk, o_led);
    input   wire    i_clk;
    output  wire    o_led;

    reg [20:0] counter;

    always @(posedge i_clk) begin
        counter <= counter + 1'b1;
    end

    assign o_led = &counter[20:18];

endmodule
