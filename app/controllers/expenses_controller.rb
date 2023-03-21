class ExpensesController < ApplicationController
  def index
    @expense = Expense.new
    @event = Event.find(params[:event_id])
    @expense.event = @event
    @expenses = @event.expenses
    categories = ["Catering", "Bar", "Entertainment", "Decor", "Venue", "Services", "Transport", "Other"]
    @pie_chart_expenses = []
    categories.each do |category|
      @pie_chart_expenses << [ category, @expenses.tagged_with(category).sum(:amount_spent) ] if @expenses.tagged_with(category).sum(:amount_spent).positive?
    end

    if params[:query].present?
      @expenses = @event.expenses.search_by_name_and_amount_spent_and_status(params[:query]).order(updated_at: :desc)
    else
      @expenses = @event.expenses.order(updated_at: :desc)
    end

  end

  def show
    @event = Event.find(params[:event_id])
    @expenses = @event.set_expense
  end

  def create
    @expense = Expense.new(expense_params)
    # an expense belongs to an event
    @event = Event.find(params[:event_id])
    @expense.event = @event
    if @expense.save
      redirect_to event_expenses_path(@event)
    else
      render :new
    end
  end

  def edit
    set_expense
  end

  def update
    set_expense
    if @expense.update(expense_params)
      redirect_to @expense
    else
      render :edit
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount_spent, :status, :category_list)
  end
end
