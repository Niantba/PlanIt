class DocumentsController < ApplicationController

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.save
    authorize @document
  end

  def delete
  end

  private

  def document_params
    params.require(:document).permit(:name, :file)
  end
end
