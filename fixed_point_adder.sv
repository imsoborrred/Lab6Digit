//`timescale 1ns / 1ps
//module full_adder #(parameter n = 8)(
//    input logic [n-1:0]a,
//    input logic [n-1:0]b,
//    input logic cin,
//    output logic [n-1:0]sum,
//    output logic cout
//);

//  always @(*) begin
//    sum = a ^ b ^ cin;    
//    cout = (a & b) | (b & cin) | (a & cin);
//  end

//endmodule
//
`timescale 1ns / 1ps

module fixed_point_adder #(parameter n1 = 8, parameter n2 = 8, parameter m1 = 8, parameter m2 = 8)
    (
    input logic [n1+m1-1:0] a,  
    input logic [n2+m2-1:0] b,  
    output logic [maxdecimal+maxfraction:0] sum
  
);
     
    parameter maxfraction = m1 > m2 ? m1 : m2;
    parameter maxdecimal = n1 > n2 ? n1 : n2;
    logic [maxdecimal+maxfraction:0] temp_sum;  
      
    always_comb begin
        temp_sum = a + b;
        sum = temp_sum;
    end

endmodule

