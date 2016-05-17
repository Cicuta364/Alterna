class AnswersController < ApplicationController
  before_action :set_answer, only: [:update, :destroy]
  # GET /presentations/new
  def new
    @answer = Answer.new
    @presentations = Presentation.all
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.click = 0
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: 'Presentation was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to root_path, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def click_count
    if params[:answer_id].present?
      @answer = Answer.find(params[:answer_id])
      count = 1
      @answer.click = count + @answer.click
      @answer.save
      redirect_to root_path, notice: "Gracias por tu Respuesta"
    else
      redirect_to root_path, notice: "Error, intentalo nuevamente"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:presentation_id, :question, :click)
    end
end


