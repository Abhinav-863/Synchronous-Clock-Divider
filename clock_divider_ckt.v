module clock_divider_ckt (
    input i_clk, i_resetn, [2:0] i_sel,
    output o_clk
)                           ;
    // wire declaration
    wire clk2               ;
    wire clk4 	            ;
    wire clk8  		    ;
    wire clk16 		    ;
    wire o_clk1		    ;
    wire o_clk2	            ;
    wire o_clk3		    ;

    // counter
    reg [3:0] syn_counter   ;

    always@(posedge i_clk or negedge i_resetn) begin
        if (!i_resetn)
            syn_counter = 4'd0            ;
        else
            syn_counter = syn_counter + 1 ;
    end 

    assign clk2 = syn_counter[0]          ;
    assign clk4 = syn_counter[1]          ;
    assign clk8 = syn_counter[2] 	  ;
    assign clk16 = syn_counter[3]	  ;

    // module instantion
    glitch_free_mux u1_glitch_free_mux(.clk1(clk2), .clk2(clk4), .select(i_sel[0]), .out_clk(o_clk1))     ;
    glitch_free_mux u2_glitch_free_mux(.clk1(clk8), .clk2(clk16), .select(i_sel[0]), .out_clk(o_clk2))    ;
    glitch_free_mux u3_glitch_free_mux(.clk1(o_clk1), .clk2(o_clk2), .select(i_sel[1]), .out_clk(o_clk3)) ;
    glitch_free_mux u4_glitch_free_mux(.clk1(o_clk3), .clk2(i_clk), .select(i_sel[2]), .out_clk(o_clk))   ;

endmodule
