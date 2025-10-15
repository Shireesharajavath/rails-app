# app/controllers/api/todos_controller.rb
module Api
  class TodosController < ApplicationController
    # before_action :authenticate_user # already in ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /api/todos
    def index
      todos = current_user.todos
                          .order(created_at: :asc)
                          .page(params[:page] || 1)
                          .per(params[:per_page] || 10)

      render json: {
        success: true,
        todos: todos.as_json(only: [:id, :title, :description, :completed, :scheduled_time, :expected_completion, :priority, :status, :created_at, :updated_at]),
        pagination: {
          current_page: todos.current_page,
          next_page: todos.next_page,
          prev_page: todos.prev_page,
          total_pages: todos.total_pages,
          total_count: todos.total_count
        }
      }, status: :ok
    end

    # POST /api/todos
    def create
      todo = current_user.todos.new(todo_params)
      if todo.save
        render json: { success: true, todo: todo }, status: :created
      else
        render json: { success: false, errors: todo.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # GET /api/todos/:id
    def show
      render json: { success: true, todo: @todo }, status: :ok
    end

    # PUT/PATCH /api/todos/:id
    def update
      if @todo.update(todo_params)
        render json: { success: true, todo: @todo }, status: :ok
      else
        render json: { success: false, errors: @todo.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /api/todos/:id
    def destroy
      @todo.destroy
      render json: { success: true, message: "Todo deleted successfully" }, status: :ok
    end

    # POST /api/todos/search_todos
    def search_todos
      q = params[:query].to_s.strip.downcase

      todos = if q.blank?
                current_user.todos.order(created_at: :desc).limit(200)
              else
                pattern = "%#{q}%"
                current_user.todos.where(
                  "LOWER(title) LIKE :p OR LOWER(description) LIKE :p OR LOWER(priority) LIKE :p OR LOWER(status) LIKE :p OR CAST(created_at AS CHAR) LIKE :p OR CAST(scheduled_time AS CHAR) LIKE :p OR CAST(expected_completion AS CHAR) LIKE :p",
                  p: pattern
                ).order(created_at: :desc).limit(500)
              end

      render json: {
        success: true,
        todos: todos.as_json(only: [:id, :title, :description, :scheduled_time, :expected_completion, :priority, :status, :created_at, :updated_at])
      }, status: :ok
    end

    private

    def set_todo
      @todo = current_user.todos.find_by(id: params[:id])
      render json: { error: "Todo not found or unauthorized" }, status: :not_found unless @todo
    end

    def todo_params
      params.require(:todo).permit(
        :title,
        :description,
        :scheduled_time,
        :expected_completion,
        :priority,
        :status
      )
    end
  end
end
