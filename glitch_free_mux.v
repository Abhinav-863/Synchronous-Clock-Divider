module glitch_free_mux (
    input clk1, clk2, select,
    output reg out_clk
) ;
    reg enable             ;
    always@(posedge clk1 or clk2) begin
        enable = select    ;      
    end
    always@(*) begin
        if (enable)
            out_clk = clk2 ;
        else
            out_clk = clk1 ;
    end
endmodule