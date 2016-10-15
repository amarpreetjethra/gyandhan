class LoginsController < ApplicationController
  
  # GET /logins/new
  # GET /logins/new.json
  def new
    @login = Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login }
    end
  end

 
  

  # POST /logins
  # POST /logins.json
  def create
    @login = Login.create(login_params)
    login = Login.find_by(login_params)
    first_name = login['first_name'].to_s
    last_name = login['last_name'].to_s
    auth_token = 'da1791b6cfad9b6e800c6f0f0fcbd6ee'
    api_context = 'crmapi'
    xml_data = '<Leads><row no="1"><FL val="Lead Source">Web Download</FL><FL val="Company">Your Company</FL><FL val="First Name">'+first_name+'</FL><FL val="Last Name">'+last_name+'</FL></row></Leads>'
    response = HTTParty.post(
      'https://crm.zoho.com/crm/private/xml/Leads/insertRecords',
      body: {
        newFormat: '1',
        authtoken: auth_token,
        scope: api_context,
        xmlData: xml_data
      }
    )
    render xml: response
    
  end
 def login_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:login).permit(:first_name , :last_name)
  end
 
end
