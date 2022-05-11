module ASYC_Counter #(
    parameter numberOfBits = 3 
) (
    input upSignal , 
    input downSignal , 
    input reset , 
    output reg [numberOfBits-1:0] stateOutput
);
    
    always @(posedge upSignal) begin
        case (stateOutput)
           3'b000 : stateOutput = 3'b001 ;  
           3'b001 : stateOutput = 3'b010 ; 
           3'b010 : stateOutput = 3'b011 ; 
           3'b011 : stateOutput = 3'b100 ; 
           3'b100 : stateOutput = 3'b101 ; 
           3'b101 : stateOutput = 3'b110 ; 
           3'b110 : stateOutput = 3'b111 ; 
           3'b111 : 
           begin 
                stateOutput = 3'b111 ;
                $warning(  "the queue is full !!!"  )  ;  
           end 
            default: stateOutput = 3'b000;  
        endcase
    end
    
    always @(posedge downSignal) begin
        case (stateOutput)
           3'b000 : 
           begin
               stateOutput = 3'b000 ;
               $warning (  "the queue is empty !!!"  ) ; 
           end  
           3'b001 : stateOutput = 3'b000 ; 
           3'b010 : stateOutput = 3'b001 ; 
           3'b011 : stateOutput = 3'b010 ; 
           3'b100 : stateOutput = 3'b011 ; 
           3'b101 : stateOutput = 3'b100 ; 
           3'b110 : stateOutput = 3'b101 ; 
           3'b111 : stateOutput = 3'b110 ; 
            default: stateOutput = 3'b000; 
        endcase
    end
    

    always @(negedge reset) begin
        stateOutput = 0 ; 
    end
endmodule