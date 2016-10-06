class LoginsController < ApplicationController
  # GET /logins
  # GET /logins.json
  def index
    @login = Login.all
    
    render json: @login
   
    
      
     

  end

  # GET /logins/1
  # GET /logins/1.json
  def show
    login = Login.find(params[:id])
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

  # GET /logins/new
  # GET /logins/new.json
  def new
    @login = Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login }
    end
  end

  # GET /logins/1/edit
  def edit
    @login = Login.find(params[:id])
  end

  # POST /logins
  # POST /logins.json
  def create
    @login = Login.new(params[:login])
    
    respond_to do |format|
    if @login.save
    
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render json: @login, status: :created, location: @login }

      else
        format.html { render action: "new" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end

    end
  end

  # PUT /logins/1
  # PUT /logins/1.json
  def update
    @login = Login.find(params[:id])

    respond_to do |format|
      if @login.update_attributes(params[:login])
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to logins_url }
      format.json { head :no_content }
    end
  end
end
