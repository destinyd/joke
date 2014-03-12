class LayoutsCell < Cell::Rails
  def login(args)
    @user = args[:user]
    render
  end
end
