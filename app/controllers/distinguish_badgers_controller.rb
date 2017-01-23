class DistinguishBadgersController < ApplicationController
	expose(:distinguish_people) { DistinguishBadger.all.order('date DESC').decorate }

	def index ;end

	def show; end
	
end