module SBQM(
    input upSignal , //back sensor 
    input downSignal , //front sensor 
    input [1:0] Tcount, //number of tellers [1 , 2 ,3]
    input reset ,  // reset 
    output [4:0] Wtime , //expected waiting time 
    output  [2:0] Pcount ,// number of people in the queue
    output reg fullFlag , // 1 if the queue is full 
    output reg emptyFlag // 1 if the queue is empty  
); 

//making an instance of the counter 
ASYC_Counter myCounter(
    .upSignal(upSignal) , 
    .downSignal(downSignal), 
    .reset(reset) , 
    .stateOutput(Pcount)  
);

ROM myROM(
    .Pcount(Pcount), 
    .Tcount(Tcount),
    .Wtime(Wtime) 
);

//using dataflow to describe fullFlag
always @(Pcount) begin
    fullFlag = Pcount[0] && Pcount[1] && Pcount[2] ; 
end

always @(Tcount) begin
    if (Tcount == 0) begin
         $warning (  "number of tellers can't be 0!!"  ) ; 
    end
end

//emptyFlag is the inverted version of full flag 
always @(Pcount) begin
    emptyFlag = ~(Pcount[0] || Pcount[1] || Pcount[2]) ; 
end

endmodule