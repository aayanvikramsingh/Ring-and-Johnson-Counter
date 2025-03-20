module Testbench;
    reg clk;
    reg reset;
    wire [3:0] ring_q;
    
    RingCounter ring_counter(.clk(clk), .reset(reset), .q(ring_q));

initial begin
        clk = 0;
        reset = 1;
        #5 reset = 0;
        #100 $finish;
    end

    always #10 clk = ~clk;

    initial begin
        $monitor("Time: %0d, Ring Counter: %b", $time, ring_q);
    end
initial begin
    $dumpfile("counter_testbench.vcd");
    $dumpvars(0, Testbench);
    #70 $finish;
    end

endmodule