class TestPapersController < ApplicationController
  before_action :set_test_paper, only: [:show, :edit, :update, :destroy]

  def index
    @test_papers = TestPaper.all
  end

  def show
  end

  def new
    @test_paper = TestPaper.new
  end

  def edit
  end

  def create
    @test_paper = TestPaper.new(test_paper_params)

    respond_to do |format|
      if @test_paper.save
        format.html { redirect_to @test_paper, notice: 'Test paper was successfully created.' }
        format.json { render :show, status: :created, location: @test_paper }
      else
        format.html { render :new }
        format.json { render json: @test_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test_paper.update(test_paper_params)
        format.html { redirect_to @test_paper, notice: 'Test paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_paper }
      else
        format.html { render :edit }
        format.json { render json: @test_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test_paper.destroy
    respond_to do |format|
      format.html { redirect_to test_papers_url, notice: 'Test paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview_test
    @test_paper = TestPaper.find(params[:id])
  end

  private
    
    def set_test_paper
      @test_paper = TestPaper.find(params[:id])
    end

    def test_paper_params
      params.require(:test_paper).permit!
    end

end
