module numeros_com_sinal(
    input signed [7:0] entrada_signed_1,
    input signed [3:0] entrada_signed_2,
    input [7:0] entrada_unsigned_1,
    input [3:0] entrada_unsigned_2,
    input [1:0] codigo,
    output reg [7:0] saida
);

    always @(*) begin
        case (codigo)
            2'b00: // signed_1 + signed_2  
                saida = entrada_signed_1 + $signed(entrada_signed_2);
            2'b01: // unsigned_1 + unsigned_2
                saida = entrada_unsigned_1 + entrada_unsigned_2;
            2'b10: // unsigned_1 + signed_1
                saida = entrada_unsigned_1 + entrada_signed_1;
            2'b11: // unsigned_1 + signed_2
                saida = entrada_unsigned_1 + $signed(entrada_signed_2);
            default:
                saida = 8'b00000000; 
        endcase        
    end

endmodule