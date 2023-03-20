class ExpensesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @expenses = @event.expenses.order(updated_at: :desc)
    @expense = Expense.new
  end

  # def show
  #   @event = Event.find(params[:event_id])
  #   @expense = Expense.find(params[:id])
  #   # @expenses = @event.set_expense
  # end
  # # do we need this  ^ ^ ^ also i dont think you use set_expense anywhere and you would need a before_action: at the top of this file for it to work.

  def create
    @event = Event.find(params[:event_id])
    @expense = Expense.new(expense_params)
    @expense.event = @event
    if @expense.save
      redirect_to event_expenses_path(@event), notice: "Expense was successfully added."
    else
      # render :new
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

  def destroy
    @event = Event.find(params[:event_id])
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to event_expenses_path(@event), notice: "expense was successfully removed"
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount_spent, :category_list)
    # params.require(:expense).permit(:name, :amount_spent, :category_list, :status, :date)
  end
end
