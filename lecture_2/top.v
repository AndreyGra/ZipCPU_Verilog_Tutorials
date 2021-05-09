module top(i_clk, o_led);
    input wire  i_clk;
    output wire o_led;

    dimmer dim1 (.i_clk(i_clk), .o_led(o_led));

endmodule 
