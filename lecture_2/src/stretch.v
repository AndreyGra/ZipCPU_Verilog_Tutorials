module stretch(i_clk, i_event, o_led);

    reg [26:0] counter;
    always @(posedge i_clk) begin

        if(i_event) counter <= 0;
        else if (!counter[26]) counter <= counter + 1;

    end

    assign o_led = !counter[26];
    
endmodule