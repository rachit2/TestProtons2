class ClockTiming

 def isNum(x)
  	if(x.to_i !=0)
  		return true
  	else
  		return false
  	end
end

  
def cal
    start_time = Time.now
    r=1
    puts "start =#{start_time.strftime("%H:%M:%S")}"
 
   # end_time=start_time
    enter=gets.chomp
    en=""
    for i in 0..enter.length
  	 if(isNum(enter[i]))
  	   	d=enter[i].to_i
  	
    	elsif(enter[i]=="+" || enter[i]=="-")
  	   	op=enter[i]
  	  elsif(enter[i]!="" && enter[i]!=nil)
  	   	en=en+enter[i]
  	  end
    end

    en=en.delete(" ")
    case op
  	 when "+"
       if(en=="day")
          start_time = start_time +d*60*60*24
        end 
    	 if(en=="hour")
          start_time = start_time +d*60*60
    	 end 
    	 if(en=="min")
    	 start_time =	start_time + d*60
    	 end
    	 if(en=="sec")
    	   	start_time = start_time +d
        end
  	 when "-"
       if(en=="day")
          start_time = start_time - d*60*60*24
        end 
  		  if(en=="hour")
    		  start_time = start_time - d*60*60
    	 end 
    	 if(en=="min")
    	   	start_time = start_time - d*60
    	 end
    	 if(en=="sec")
    	   	start_time =	start_time - d
    	 end
  	 else
      	"Error:  invalid input #{enter}"
    end
    puts "End=#{start_time.strftime("%H:%M:%S")}"
  end
end
c=ClockTiming.new
c.cal 