class UploadController < ApplicationController
  
  def handler
   
  #@filename = params['qqfile']
   
  #newf = File.open('assets/' + @filename, "wb")
  #str =  request.body.read 
  #newf.write(str)
  #newf.close
   
  render :text => '{"success": true}'
  end

end
