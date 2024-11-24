`timescale 1ns / 1ps

module tb_fixed_point_multiplication;
    // Parameters
    parameter n1 = 8;
    parameter n2 = 8;
    parameter m1 = 8;
    parameter m2 = 8;

    // Inputs
    logic [n1+m1-1:0] a;
    logic [n2+m2-1:0] b;

    // Outputs
    logic [(n1+n2)+(m1+m2)-1:0] result;

    // Instantiate the Unit Under Test (UUT)
    fixed_point_multiplication #(n1, n2, m1, m2) uut (
        .a(a), 
        .b(b), 
        .result(result)
    );

    initial begin
        // Initialize inputs
        a = 0;
        b = 0;

        // Apply test vectors
        #10;
        a = 16'h0100;  // 1.0 in fixed-point representation
        b = 16'h0200;  // 2.0 in fixed-point representation
        #10;
        
        a = 16'h00A0;  // 0.625 in fixed-point representation
        b = 16'h00C0;  // 0.75 in fixed-point representation
        #10;

        a = 16'hFF00;  // -1.0 in fixed-point representation (2's complement)
        b = 16'h0200;  // 2.0 in fixed-point representation
        #10;

        a = 16'h0100;  // 1.0 in fixed-point representation
        b = 16'hFF00;  // -1.0 in fixed-point representation (2's complement)
        #10;

        a = 16'h8000;  // -0.5 in fixed-point representation
        b = 16'h4000;  // 0.25 in fixed-point representation
        #10;

        // Add more test cases if necessary
        
        // Finish simulation
        #10;
        $stop;
    end

    initial begin
        $monitor("Time = %0t | a = %0h | b = %0h | result = %0h", $time, a, b, result);
    end

endmodule
