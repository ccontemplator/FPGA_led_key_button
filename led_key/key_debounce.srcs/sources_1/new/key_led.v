`timescale 1ns / 1ps

module key_led(
    input clk,
    input [2:0] key,
    input rst,
    output reg [2:0] led 
    );

    
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            led <= 3'b000;
        end
        else begin       
            case(key) 
                3'b000: led <= !led;
                3'b001: led <= {!led[2:1],led[0]};
                3'b010: led <= {!led[2],led[1],!led[0]};
                3'b011: led <= {!led[2],led[1:0]};
                3'b100: led <= {led[2],!led[1:0]};
                3'b101: led <= {led[2],!led[1],led[0]};
                3'b110: led <= {led[2:1],!led[0]};
                default: led <= led;                                                                                
            endcase
        end
        
    end
    

endmodule
