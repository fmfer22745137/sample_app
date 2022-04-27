class ApplicationController < ActionController::Base
  def hello
    render html: "Hello, world. I'm fmf-sample-app!"
  end
end
