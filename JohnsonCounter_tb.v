module Testbench;
    reg clk;
    reg reset;
    wire [3:0] johnson_q;
    JohnsonCounter johnson_counter(.clk(clk), .reset(reset), .q(johnson_q));

    initial begin
        clk = 0;
        reset = 1;
        #5 reset = 0;
        #150 $finish;
    end

    always #10 clk = ~clk;

    initial begin
        $monitor("Time: %0d, Johnson Counter: %b", $time, johnson_q);
    end

    initial begin
    $dumpfile("counter_testbench.vcd");
    $dumpvars(0, Testbench);
    #150 $finish;
    end

endmodule