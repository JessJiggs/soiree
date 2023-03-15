class ExpensesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @expenses = @event.expenses
  end

  def show
    set_expense
  end

  def new
    @expense = Expense.new
    @event = Event.find(params[:event_id])
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
    params.require(:expense).permit(:name, :amount_spent)
  end
end
