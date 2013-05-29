class UploadController < ApplicationController
  #before_filter :login_required  

  def handler
   
  #@filename = params['qqfile']
   
  #newf = File.open('assets/' + @filename, "wb")
  #str =  request.body.read 
  #newf.write(str)
  #newf.close
   
  @temp_file = params['qqfile'];

  uri = URI('http://doc-source.herokuapp.com/upload.json')
  params[:path_to_file] = @temp_file.to_json
  params[:id_module] = 9
  params[:id_user] = 34
  params[:title] = params['qqfile'].original_filename
  #logger.info("fisier temporar = " + @temp_file.to_s);
  #logger.info("session=" + session.to_s)
  res = Net::HTTP.post_form(uri, params)

  logger.info(res.body.status)

  #if res.body.status == 'Succes'
  render :text => '{"success": true}'
  #else 
   # render :text => '{"success": false}'
 # end

  end

end
