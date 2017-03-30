class PaymentsController < ApplicationController
  expose(:students, scope: -> { Student.includes(:payments) })
end
