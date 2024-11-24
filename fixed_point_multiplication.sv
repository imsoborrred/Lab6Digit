`timescale 1ns / 1ps

module fixed_point_multiplication #(parameter n1 = 8, parameter n2 = 8, parameter m1 = 8, parameter m2 = 8)(
    input logic [n1+m1-1:0] a,  
    input logic [n2+m2-1:0] b,
    output logic [(n1+n2)+(m1+m2)-1:0] result
);

    always_comb begin
        result = a * b;
    end

endmodule
