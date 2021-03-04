require 'csv'
class StocksController < ApplicationController

  def index
  end

  def upload
    uploaded_io = params[:stock_data]
    csv_text = File.read(uploaded_io)
    csv = CSV.parse(csv_text, :headers => true,  :col_sep => "\t" )
    csv.each do |row|
      stock_time = DateTime.strptime(row["timestamp"],"%s")
      Stock.create!(symbol: row["symbol"], timestamp: stock_time, price: row["price"])
    end
    redirect_to stocks_path
  end

  def search
    interval = params['stocks_interval'] == 'HOURLY' ? 'hour' : 'day'
    @stock_datas = Stock.where(symbol: params["stocks_symbol"]).group("date_part('#{interval}', timestamp)").average(:price)
    render :index
  end

end
