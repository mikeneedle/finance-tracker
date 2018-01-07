class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker]) #first look and see if it's already in the table
    if stock.blank? #if the stock isn't already in the stock table
      stock = Stock.new_from_lookup(params[:stock_ticker]) #lookup the stock info
      stock.save #save the new stock in the stock table
    end
    @user_stock = UserStock.create(user: current_user, stock: stock) #now that we have the stock_id from the above create new entry
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
    redirect_to my_portfolio_path
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Stock was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
  
end
