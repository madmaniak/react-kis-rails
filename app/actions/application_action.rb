class ApplicationAction

  attr_reader :params, :session

  def initialize(params, session)
    @params = params
    @session = session
  end

end
