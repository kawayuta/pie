class PollsController < ApplicationController

	 def poll_first
		   
	 			@present_id = params[:id]
		    	@user_id = current_user.id
		    	
		    	puts @present
		    	puts @present_id
		    	puts @user_id

				
					 if @test = Poll.find_by(["user_id = ? and present_id = ?", @user_id, @present_id])
					 	@test.poll_id = 1
					 	@test.poll_age = current_user.age
					 	@test.save
    					redirect_to root_path
				        puts "update"
				      else
				        
					 	poll = Poll.create(user_id: @user_id, poll_age: current_user.age, present_id: @present_id, poll_id: 1)
				        
    					redirect_to root_path
				        puts "create"
				      end
		  		
  	 end


	 def poll_second
		   
	 			@present_id = params[:id]
		    	@user_id = current_user.id
				
					 if @test = Poll.find_by(["user_id = ? and present_id = ?", @user_id, @present_id])
					 	@test.poll_id = 2
					 	@test.poll_age = current_user.age
					 	@test.save
				        
    					redirect_to root_path
				        puts "update"
				      else
				        

					 	poll = Poll.create(user_id: @user_id, poll_age: current_user.age, present_id: @present_id, poll_id: 2)
				        
    					redirect_to root_path
				        puts "create"
				      end
		  		
  	 end

  	 def poll_third
		   
	 			@present_id = params[:id]
		    	@user_id = current_user.id
				
					 if @test = Poll.find_by(["user_id = ? and present_id = ?", @user_id, @present_id])
					 	@test.poll_id = 3
					 	@test.poll_age = current_user.age
					 	@test.save
				        
    					redirect_to root_path
				        puts "update"
				      else
				        

					 	poll = Poll.create(user_id: @user_id, poll_age: current_user.age, present_id: @present_id, poll_id: 3)
				        
    					redirect_to root_path
				        puts "create"
				      end
		  		
  	 end

  	 def poll_four
		   
	 			@present_id = params[:id]
		    	@user_id = current_user.id
				
					 if @test = Poll.find_by(["user_id = ? and present_id = ?", @user_id, @present_id])
					 	@test.poll_id = 4
					 	@test.poll_age = current_user.age
					 	@test.save
				        
    					redirect_to root_path
				        puts "update"
				      else
				        

					 	poll = Poll.create(user_id: @user_id, poll_age: current_user.age, present_id: @present_id, poll_id: 4)
				        
    					redirect_to root_path
				        puts "create"
				      end
		  		
  	 end


end
