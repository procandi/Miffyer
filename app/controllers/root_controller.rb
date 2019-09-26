class RootController < ApplicationController
  def home
  	#get customer
  	@customer=get_customer
  end
  def test
    @dbhost = '192.168.0.200'
    @dbid = 'mfr'
    @dbpw = 'mfr168'
    @dbsid = 'DICOMDB'


	client = TinyTds::Client.new username: @dbid, password: @dbpw, host: @dbhost, database: @dbsid

	result = client.execute("select top 1 * from patient1 where ptn_id='00000048';")
	result.each_with_index do |row, i|
		@test=row['ptn_id']
		@test1=row['ptn_name']
		@test2=row['ptn_id_id']
		@test3=row['sex']
		@test4=row['birth_date']	
	end
	result.cancel

  end
end
