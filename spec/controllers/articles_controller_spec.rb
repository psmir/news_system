require 'spec_helper'

describe ArticlesController do
  include_context 'set up the ability'

  describe '#new' do
    include_context 'authenticated user'

    before do
      @ability.can :new, Article
      get :new
    end

    it { expect render_template :new }
    it { expect(assigns[:article]).to be_instance_of Article }
  end

  describe '#create' do
    include_context 'authenticated user'

    before do
      @ability.can :create, Article
      @current_user.stub_chain(:articles, :build)
      .and_return @article = stub_model(Article)
    end

    context do
      before do
        allow(controller).to receive(:render)
        post :create, article: attributes_for(:article)
      end

      it { expect(assigns[:article]).to eq @article }
    end

    context 'valid params' do
      before do
        expect(@article).to receive(:save).and_return true
        post :create, article: attributes_for(:article)
      end

      it { expect(flash[:notice]).to eq 'The news has been added'}
      it { expect(response).to redirect_to article_path(@article) }
    end

    context 'invalid params' do
      before do
        expect(@article).to receive(:save).and_return false
        post :create, article: attributes_for(:article)
      end

      it { expect(response).to be_success }
      it { expect(response).to render_template('articles/new') }
    end
  end

  describe "#index" do
    before do
      Article.stub_chain(:proper_order, :page).with('1').and_return @articles
      get :index, page: 1
    end

    it { expect(assigns[:articles]).to eq @articles }
  end

  describe "#update" do
    include_context 'authenticated user'

    before do
      @ability.can :update, Article
      Article.stub(:find).with('1').and_return @article = stub_model(Article)
    end

    context 'valid params' do
      before do
        expect(@article).to receive(:update_attributes).and_return true
        put :update, id: 1, article: attributes_for(:article)
      end

      it { expect(flash[:notice]).to eq 'The article has been updated' }
      it { expect(response).to redirect_to article_path(@article) }
    end

    context 'invalid params' do
      before do
        expect(@article).to receive(:update_attributes).and_return false
        put :update, id: 1, article: attributes_for(:article)
      end

      it { expect(assigns[:article]).to eq @article }
      it { expect(response).to render_template 'articles/edit' }
    end

  end

end
