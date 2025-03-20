module RingCounter(
    input clk,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b1000;            // Initialize to the first state
        else
            q <= {q[0], q[3:1]};     // Right shift operation
    end
endmodule

