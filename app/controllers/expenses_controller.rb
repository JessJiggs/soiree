class ExpensesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @expense = Expense.new
    @expense.event = @event
    @expenses = @event.expenses.order(updated_at: :desc)

    categories = ["Catering", "Bar", "Entertainment", "Decor", "Venue", "Services", "Transport", "Other"]

    @pie_chart_expenses = []
    categories.each do |category|
      @pie_chart_expenses << [ category, @expenses.tagged_with(category).sum(:amount_spent) ] if @expenses.tagged_with(category).sum(:amount_spent).positive?
    end
  end


  def create
    @event = Event.find(params[:event_id])
    @expense = Expense.new(expense_params)
    @expense.event = @event
    if @expense.save
      redirect_to event_expenses_path(@event), notice: "Expense was successfully added."
    else
      redirect_to event_expenses_path(@event), status: :unprocessable_entity, notice: "Expense was not successfully added."
    end
  end

  def update
    @event = Event.find(params[:event_id])
    expense = Expense.find(params[:id])
    expense.update!(expense_params)
    if expense.save
      redirect_to event_expenses_path(@event), notice: "Expense was successfully updated."
    else
      redirect_to event_expenses_path(@event), status: :unprocessable_entity, notice: "Expense was not successfully updated."
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount_spent, :status, :category_list)
  end
end
