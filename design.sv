// Code your design here
module async_up_counter (
    input clk,       // master clock
    input rst,       // asynchronous reset
    output [3:0] q   // counter output
);

    wire [3:0] clk_internal;

    // Flip-Flop 0 (LSB) gets system clock
    T_FF tff0 (.clk(clk),          .rst(rst), .q(q[0]));

    // Flip-Flop 1 gets q[0] as clock
    T_FF tff1 (.clk(q[0]),         .rst(rst), .q(q[1]));

    // Flip-Flop 2 gets q[1] as clock
    T_FF tff2 (.clk(q[1]),         .rst(rst), .q(q[2]));

    // Flip-Flop 3 gets q[2] as clock
    T_FF tff3 (.clk(q[2]),         .rst(rst), .q(q[3]));

endmodule

// Toggle Flip-Flop Module
module T_FF (
    input clk,
    input rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= ~q;  // toggle output
    end
endmodule
