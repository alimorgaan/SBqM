//make sure u run the simulation for 200 ps 
module SBQMTest ();
    reg upSignal ;
    reg downSignal ;
    reg [1:0] Tcount; 
    reg reset ;
    wire [4:0] Wtime ;
    wire [2:0] Pcount ;
    wire fullFlag ;
    wire emptyFlag ; 


SBQM SBQMUT (
.upSignal(upSignal),
.downSignal(downSignal),
.Tcount(Tcount), 
.reset(reset), 
.Wtime(Wtime), 
.Pcount(Pcount), 
.fullFlag(fullFlag),
.emptyFlag(emptyFlag)
); 

integer i ; 
integer j ; 
initial begin
    reset = 0 ; 
    upSignal = 1 ; 
    downSignal = 1 ; 
    Tcount = 0 ; 
    #5;  
    reset = 1 ; 
    #5
    //the start value is zero now we will give 8 upSensor edges to test all cases and the wrapping
    for (i = 0  ; i < 8  ;i = i+1 ) begin 
        if (i < 4) begin //using i for Pcount and j for Tcount
            j = i ; 
        end
        else begin
            j = i - 4 ; 
        end
        upSignal = 0 ; 
        #5 ; 
        upSignal = 1 ; 
        Tcount = j ;
        #5 ; 
    end

    //the start value is 7 now we will give 8 downSensor edges to test all cases and the wrapping
    for (i = 0  ; i < 8  ;i = i+1 ) begin 
        if (i < 4) begin //using i for Pcount and j for Tcount
            j = i ; 
        end
        else begin
            j = i - 4 ; 
        end
        downSignal = 0 ; 
        #5 ; 
        downSignal = 1 ; 
        Tcount = j ;
        #5 ; 
    end
    
end
    
endmodule