# frozen_string_literal: true

class BooksController < SecuredController
  def index
    books = Book.all
    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    book = Book.create(book_params)
    render json: book, status: :created
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    head :no_content
  end

  private

  def book_params
    params.permit(:name, :description, :progress_percentage, :current_page_number, :total_pages)
  end
end
