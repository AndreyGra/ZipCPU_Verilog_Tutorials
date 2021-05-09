module pps(i_clk, o_led);
    parameter CLOCK_RATE_HZ = 8_000_000;
    parameter [31:0] INCREMENT = (1 << 30)/(CLOCK_RATE_HZ/4) ;

    input   wire    i_clk;
    output  wire    o_led;

    reg [31:0] counter;

    initial counter = 0;

    always @(posedge i_clk) begin
        counter <= counter + INCREMENT;
    end

    assign o_led = counter[31];

endmodule
