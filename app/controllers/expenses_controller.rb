class ExpensesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @expense = Expense.new
    @expense.event = @event
    # do we need this ^^^ if we already on the expense index (tasks doesnt have find and guests doesnt have this ^? (assign this event to this expense) -delete comment when done
    @expenses = @event.expenses.order(updated_at: :desc)

    categories = ["Catering", "Bar", "Entertainment", "Decor", "Venue", "Services", "Transport", "Other"]

    @pie_chart_expenses = []
    categories.each do |category|
      @pie_chart_expenses << [ category, @expenses.tagged_with(category).sum(:amount_spent) ] if @expenses.tagged_with(category).sum(:amount_spent).positive?
    end
  end

  # def show
  #   @event = Event.find(params[:event_id])
  #   @expenses = @event.set_expense
  # end

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

  # def edit
  #   set_expense
  # end

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

  # def set_expense
  #   @expense = Expense.find(params[:id])
  # end

  def expense_params
    params.require(:expense).permit(:name, :amount_spent, :status, :category_list)
  end
end
