class RemindersController < ApplicationController
  def index
    start_date = params[:start_date] ? params[:start_date].to_date : Date.today
    range = (start_date - 1.month)..(start_date + 1.month)
    @reminders = Reminder.where(date: range).order(date: :desc)
  end

  def new
    day = params[:day]
    @day = day.nil? ? DateTime.now : day.to_datetime
    render :partial => "new"
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.valid?
      @reminder.save
      flash[:notice] = "Reminder created successfully"
    else
      flash[:errors] = @reminder.errors.full_messages
    end
    redirect_to reminders_path
  end

  def edit
    @reminder = Reminder.find(params[:id])
    render :partial => "edit"
  end

  def update
    @reminder = Reminder.find(params[:id])
    if @reminder.update(reminder_params)
      flash[:notice] = "Reminder updated successfully"
    else
      flash[:errors] = @reminder.errors.full_messages
    end
    redirect_to reminders_path
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    flash[:notice] = "Reminder deleted successfully"
    redirect_to reminders_path
  end

  private

  def reminder_params
    params.require(:reminder).permit(:name, :observation, :color, :date)
  end
end
