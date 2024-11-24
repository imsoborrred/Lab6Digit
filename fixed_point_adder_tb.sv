`timescale 1ns / 1ps

module fixed_point_adder_tb;
    parameter n1 = 8;
    parameter n2 = 8;
    parameter m1 = 8;
    parameter m2 = 8;

    logic [n1+m1-1:0] a;
    logic [n2+m2-1:0] b;
    logic [((n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2)):0] sum;

    // Instantiate the fixed_point_adder module
    fixed_point_adder #(n1, n2, m1, m2) uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: Simple addition
        a = 16'b0000001100000011; // 3.3 in fixed-point representation
        b = 16'b0000000100000101; // 1.5 in fixed-point representation
        #10;
        $display("Test 1: a = %b, b = %b, sum = %b", a, b, sum);
        
        // Test case 2: Addition with larger values
        a = 16'b0000111100001111; // 15.15 in fixed-point representation
        b = 16'b0000000100000101; // 1.5 in fixed-point representation
        #10;
        $display("Test 2: a = %b, b = %b, sum = %b", a, b, sum);
        
        // Test case 3: Overflow condition
        a = 16'b1111111111111111; // Maximum value
        b = 16'b0000000000000001; // 1 in fixed-point representation
        #10;
        $display("Test 3: a = %b, b = %b, sum = %b", a, b, sum);
        
        // Test case 4: Both inputs set to maximum
        a = 16'b1111111111111111; // Maximum value
        b = 16'b1111111111111111; // Maximum value
        #10;
        $display("Test 4: a = %b, b = %b, sum = %b", a, b, sum);

        // Test case 5: Mixed input values
        a = 16'b0000000011110000; // 240 in fixed-point representation
        b = 16'b0000000000001111; // 15 in fixed-point representation
        #10;
        $display("Test 5: a = %b, b = %b, sum = %b", a, b, sum);

        // Test case 6: Zero inputs
        a = 16'b0000000000000000; // Zero value
        b = 16'b0000000000000000; // Zero value
        #10;
        $display("Test 6: a = %b, b = %b, sum = %b", a, b, sum);

        // Test case 7: One input is zero
        a = 16'b0000000000000000; // Zero value
        b = 16'b0000000000001111; // 15 in fixed-point representation
        #10;
        $display("Test 7: a = %b, b = %b, sum = %b", a, b, sum);

        // End simulation
        $finish;
    end
endmodule
