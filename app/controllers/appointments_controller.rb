class AppointmentsController < ApplicationController
  def index
    if session[:provider_id]
      @appointments = Appointment.where(
        'provider_id = ? AND date >= ?', current_user.id, Date.today)
    elsif params[:user_id]
      @appointments = Appointment.where(
        'user_id = ? AND date >= ?', current_user.id, Date.today)
    else
      @appointments = Appointment.where('date >= ?', Date.today)
    end
    @appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    @provider = @appointment.provider
    @start = @appointment.start_time.strftime("%I:%M%p")
    @end = @appointment.date.strftime("%a %B %d, %Y")
    define_address
    define_map_link
    if @appointment.booked?
      @booked = "yes"
    else
      @booked = "no"
    end
  end

  def define_address
    @address = ""
    if @provider.work_address && @provider.city && @provider.state && @provider.zip
      @address = "#{@provider.work_address} #{@provider.city}
        #{@provider.state}, #{@provider.zip}"
    elsif @provider.work_address && @provider.city && @provider.zip
      @address = "#{@provider.work_address} #{@provider.city} #{@provider.zip}"
    elsif @provider.work_address && @provider.zip
      @address = "#{@provider.work_address} #{@provider.zip}"
    elsif @provider.work_address
      @address = @provider.work_address
    end
  end

  def define_map_link
    @map_link = ""
    if @provider.work_address && @provider.city && @provider.state && @provider.zip
      @map_link = "https://www.google.com/maps/place/#{@provider.work_address.tr(' ', '+')}+#{@provider.city}+#{@provider.state}+#{@provider.zip}"
    elsif @provider.work_address && @provider.city && @provider.zip
      @map_link = "https://www.google.com/maps/place/#{@provider.work_address.tr(' ', '+')}+#{@provider.city}+#{@provider.zip}"
    elsif @provider.work_address && @provider.zip
      @map_link = "https://www.google.com/maps/place/#{@provider.work_address.tr(' ', '+')}+#{@provider.zip}"
    elsif @provider.work_address
      @map_link = "https://www.google.com/maps/place/#{@provider.work_address.tr(' ', '+')}"
    end
  end

  def new
    if signed_in_provider
      @appointment = Appointment.new
    else
      flash[:notice] = "Sorry, only providers can create new appointments"
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
      flash[:notice] = @appointment.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @provider = @appointment.provider
  end

  def update
    @appointment = Appointment.find(params[:id])
    if signed_in_provider
      change_appt(@appointment)
    elsif params[:option] == "unbook"
      unbook_appt(@appointment)
    elsif params[:option] == "book"
      book_appt(@appointment, current_user)
    end
  end

  def change_appt(appointment)
    @provider = current_user
    if appointment.update(appointment_params)
      flash[:notice] = "Appointment Updated"
      redirect_to @provider
    else
      flash[:notice] = appointment.errors.full_messages.to_sentence
      render :edit
    end
  end

  def book_appt(appointment, user)
    appointment.book!(user)
    if appointment.update!(user_id: user.id, booked?: true)
      flash[:notice] = "Appointment Booked!"
      ProviderMailer.booking_email(appointment).deliver_now
      redirect_to appointment_path(appointment)
    else
      render :show
    end
  end

  def unbook_appt(appointment)
    appointment.unbook!
    if appointment.update!(user_id: nil, booked?: false)
      flash[:notice] = "Appointment Cancelled"
      ProviderMailer.cancellation_email(appointment).deliver_now
      redirect_to appointment_path(appointment)
    else
      render :show
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @provider = current_user
    if @appointment.destroy
      flash[:notice] = "Appointment Removed"
      if @appointment.user_id
        UserMailer.cancellation_email(@appointment).deliver_now
      end
      redirect_to @provider
    else
      flash[:notice] = "Something went wrong"
      render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :date,
      :start_time,
      :end_time,
      :booked?,
      :provider_id,
      :user_id
    )
  end
end
