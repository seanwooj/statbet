class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_bets, :class_name => 'Bet', :foreign_key => 'creator_id'
  has_one :wallet

  after_create :build_wallet!




  private

  def build_wallet!
  	wallet = build_wallet
  	wallet.save!
  end

end
