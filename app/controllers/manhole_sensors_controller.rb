class ManholeSensorsController < ApplicationController

 def update
    if request.put? then
	#inputPath=params[:file].path
	CSV.parse(request.raw_post()) do |row|
	  @manhole_sensor=ManholeSensor.find(row[0].to_i)
	  @manhole_sensor.update(alert: true) if(row[1].to_i>@manhole_sensor.limit)
	  render text: "OK"
	 end
    else render text: "Nothing !#{request.raw_post()}"
	
    end
 end
end
