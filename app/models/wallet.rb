class Wallet < ActiveRecord::Base
	belongs_to :user
	has_many :wallet_transactions

	after_initialize :set_wallet_defaults

	private

	def set_wallet_defaults
		self.available_funds = 0
	end
end
