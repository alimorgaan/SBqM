module ASYC_Counter_Test ();
    reg upSignal ; 
    reg downSignal ; 
    reg reset ; 
    wire [2:0] stateOutput ;     

    ASYC_Counter counterUT(
        .upSignal(upSignal) , 
        .downSignal(downSignal), 
        .reset(reset) , 
        .stateOutput(stateOutput)
    ); 
    integer i ; 
    initial begin
        reset = 0 ;
        upSignal = 1 ; 
        downSignal = 1 ;  
        #10 ;
        reset = 1 ;


        for (i  = 0 ; i < 9 ; i = i+1 ) begin
            upSignal = 0 ;
            #5 ;
            upSignal = 1 ;
            #5 ;     
        end

        for (i  = 0 ; i < 9 ; i = i+1 ) begin
            downSignal = 0 ; 
            #5 ;
            downSignal = 1 ; 
            #5 ;      
        end
    end

endmodule