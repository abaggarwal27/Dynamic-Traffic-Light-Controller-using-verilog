

// define prameters
`define red 4'd0
`define  green 4'd1
`define yellow 4'd2

`define s0 4'd0    
`define s1 4'd1   
`define s2 4'd2   
`define s3 4'd3   
`define s4 4'd4   
`define s5 4'd5   
`define s6 4'd6   
`define s7 4'd7   
`define s8 4'd8   
`define s9 4'd9   
`define s10 4'd10   
`define s11 4'd11   

module Dynamic_traffic_light( 
     input clear,clk,
	  input c1,c2,c3,c4,
	  output reg [3:0] Road1,
	  output reg [3:0] Road2,
	  output reg [3:0] Road3,
	  output reg [3:0] Road4
    );

      reg[4:0] curr_state;
		reg[4:0] next_state;
	
		
		
		 initial
		 begin
		 curr_state=0;
		 next_state=0;
		 Road1=`green;
		 Road2=`red;
		 Road3=`red;
		 Road4=`red;
		 end
		 
		   always @(posedge clk)
		  curr_state=next_state;
		  
		  
		 always @(curr_state)
	 begin
		  case(curr_state)
		  `s0:begin
		      Road1=`green;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
		 `s1:begin
		      Road1=`yellow;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
				
		 `s2:begin
		      Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
		
		  `s3:begin
		      Road1=`red;
				Road2=`green;
				Road3=`red;
				Road4=`red;
				end
				
		  `s4:begin
		      Road1=`red;
				Road2=`yellow;
				Road3=`red;
				Road4=`red;
				end
		  `s5:begin
			   Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
		  `s6:begin
			   Road1=`red;
				Road2=`red;
				Road3=`green;
				Road4=`red;
				end
		  `s7:begin
			   Road1=`red;
				Road2=`red;
				Road3=`yellow;
				Road4=`red;
				end
			`s8:begin
			   Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
			`s9:begin
			   Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`green;
				end
		   `s10:begin
			   Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`yellow;
				end
			`s11:begin
			   Road1=`red;
				Road2=`red;
				Road3=`red;
				Road4=`red;
				end
			 
		 endcase
	end
	
	     always @(curr_state or clear or c1 or c2 or c3 or c4 )
		  begin
		  if(clear)
		  begin
		  next_state=`s0;
		  end
		  
		  else
		  begin
		  
		  //ROAD 1
		  case (curr_state)
		  `s0:if(c2 || c3 || c4)
		  begin
		  next_state=`s1;
		  end
		  
		  else
		  begin
		  next_state=`s0;
		  end
		  
		 `s1:if(c2 && ~c3 && ~c4 && ~c1 )
		 begin
		  next_state=`s3;
		  end
		  
		  else if (c3 && ~ c1  && ~c2 && ~c4)
		  begin
		  next_state=`s6;
		  end
		  
		  else if(c4 && ~c1 && ~c2 && ~c3)
		  begin
		  next_state=`s9;
		  end
		  
		  else 
		  begin
		  next_state=`s0;
		  end
		   
			
			//ROAD 2
		   `s3:if(c3 || c4 || c1 )
			begin
		  next_state=`s4;
		  end
		  else
		  begin 
		  next_state=`s3;
		  end

		 `s4:if(c3 && ~ c1  && ~c2 && ~c4 )
		 begin
		  next_state=`s6;
		  end
		   else if(c4 && ~c1 && ~c2 && ~c3)
			begin
		  next_state=`s9;
		  end
		  else if(c1 && ~c2 && ~c3 && ~c4)
		  begin
		  next_state=`s0;
		  end
		 else 
		 begin
		  next_state=`s3;
		  end

		  
		  //ROAD 3
		   `s6:if(c4|| c1 || c2 )
			begin
		  next_state=`s7;
		  end
		  else
		  begin
		  next_state=`s6;
		  end
		 `s7:if(c4)
		 begin
		  next_state=`s9;
		  end
		  else if(c1 && ~c2 && ~c3 && ~c4)
		  begin
		  next_state=`s0;
		  end
		  else if(c2 && ~c3 && ~c4 && ~c1)
		  begin
		  next_state=`s3;
		  end
		  else 
		  begin
		  next_state=`s6;
		  end
        
		  
         //ROAD 4
		  `s9:if(c1 || c2 || c3)
		 begin
		  next_state=`s10;
		  end
		  else
		  begin
		  next_state=`s9;
		  end
		 `s10:if(c1)
		 begin
		  next_state=`s0;
		  end
		  else if(c2 && ~c3 && ~c4 && ~c1)
		  begin
		  next_state=`s3;
		  end
		  else if (c3 && ~ c1  && ~c2 && ~c4)
		  begin
		  next_state=`s6;
		  end
		  else 
		  begin
		  next_state=`s9;
		  end
		  
		   endcase
		end
		 end
endmodule
