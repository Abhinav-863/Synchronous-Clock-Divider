module clock_divider_ckt_tb;

    reg i_clk, i_resetn    ; 
    reg [2:0] i_sel        ;
    wire o_clk             ;
    integer i              ;

    clock_divider_ckt uut(.i_clk(i_clk), .i_resetn(i_resetn), .i_sel(i_sel), .o_clk(o_clk));

    task simulation(input [2:0] select); begin
        i_sel = select     ;
        for (i = 0; i <= 16; i= i+1 ) begin
                #10 i_clk = 1'b0;
                #10 i_clk = 1'b1;
        end
    end endtask

    initial begin
        i_resetn = 1'b0;
        #10 i_resetn = 1'b1   ;
        simulation(3'b000)    ;
        simulation(3'b001)    ;
        simulation(3'b010)    ;
        simulation(3'b011)    ;
        simulation(3'b100)    ;
    end

endmodule