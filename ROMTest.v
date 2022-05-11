module ROM_Test ();
    
reg [1:0] Tcount ; 
reg [2:0] Pcount ; 
wire [4:0] Wtime ; 


ROM ROMUT(
    .Pcount(Pcount), 
    .Tcount(Tcount),
    .Wtime(Wtime)
); 

initial begin
    Tcount = 2'b01 ; 
    Pcount = 3'b111 ;     
end


endmodule