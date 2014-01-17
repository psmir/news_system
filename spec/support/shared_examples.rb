  shared_context 'set up the ability' do
    before do
      @ability = Object.new
      @ability.extend CanCan::Ability
      allow(@controller).to receive(:current_ability).and_return(@ability)
    end
  end

  shared_context 'authenticated user' do
    before do
      allow(controller).to receive(:authenticate_user!)
      @current_user = stub_model(User)
      allow(controller).to receive(:current_user).and_return @current_user
      allow(controller).to receive(:user_signed_in?).and_return true
    end
  end
