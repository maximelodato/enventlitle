class AttendancesController < ApplicationController
    def create
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        UserMailer.participation_email(@attendance.event.user, @attendance).deliver_now
        redirect_to @attendance.event, notice: 'Participation créé avec succès.'
      else
        render :new
      end
    end
  
    private
  
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
  end
  