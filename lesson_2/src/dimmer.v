module dimmer ( i_clk, o_led );
    input   i_clk;
    output  o_led;

    reg     [27:0]  counter;

    always @(posedge i_clk ) begin
        counter <= counter + 1;        
    end

    assign o_led = (counter[7:0] < counter[17:10]);

endmodule
