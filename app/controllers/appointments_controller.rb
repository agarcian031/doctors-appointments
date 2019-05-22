class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :edit, :update, :destroy] 


  def index
    # @user = current_user.full_name 
    @appointments = @doctors.appointments 
  end

  def show
    @patient = @appointment.patient.find([:id])
    @doctor = @appointment.doctor.find([:doctor_id])
  end

  def new
    # @users = User.all - @doctor.users 
    @appointment = @doctor.appointments.new
  end

  def create 
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save 
      redirect_to doctor_appointments_path(@doctor)
    else 
      render :new 
    end 
  end 

  def edit
  end
  
  
  def update 
    if @appointment.update(appointment_params)
      redirect_to doctor_appointment_path(@appointment)
    else 
      render :edit
    end 
  end 

  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end 

  private 
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end 

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :patient_id)
  end 

  def set_appointment
    @appointment = @doctor.appointment.find(params[:id])
  end 
end
