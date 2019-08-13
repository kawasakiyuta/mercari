class MypageController < ApplicationController
  def identification
    @addresses = Address.all
  end
end
