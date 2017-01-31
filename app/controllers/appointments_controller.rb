class AppointmentsController < ApplicationController

  def index
    if signed_in_provider
      @appointments = Appointments.where(provider: current_user)
    else
      @appointments = Appointment.all
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    if signed_in_provider
      @appointment = Appointment.new
    else
      flash[:notice] = "Sorry, you can't create new appointments"
      redirect_to appointments_path
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @provider = current_user
    @appointment.provider = @provider
    if @appointment.save
      flash[:notice] = "Appointment Created"
      redirect_to @provider
    else
      flash[:notice] = appointments.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @provider = current_provider
  end

  def update
    @appointment = Appointment.find(params[:id])
    @provider = current_user
    if @appointment.update
      flash[:notice] = "Appointment Updated"
      redirect_to @provider
    else
      flash[:notice] = appointments.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @provider = current_user
    if @appointment.destroy
      flash[:notice] = "Appointment Removed"
      redirect_to @provider
    else
      flash[:notice] = "Something went wrong"
      render :index
    end
  end

  private

  def appointment_params
    params.require[:appointment].permit[:date, :start_time, :end_time].merge[:provider]
  end
end
