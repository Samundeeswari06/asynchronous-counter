// Code your testbench here
// or browse Examples
module tb_async_up_counter;
    reg clk = 0;
    reg rst;
    wire [3:0] q;

    async_up_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generator
    always #5 clk = ~clk;  // 10ns period

    initial begin
        $monitor("Time=%0t | rst=%b | q=%b", $time, rst, q);

        rst = 1; #10;
        rst = 0;

        #160;

        // Reset again
        rst = 1; #10;
        rst = 0; #100;

        $finish;
    end
endmodule
