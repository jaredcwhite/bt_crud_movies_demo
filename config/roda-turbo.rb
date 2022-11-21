module CustomActions
  def redirect_to(url, delay: nil)
    action "redirect_to", "", { url:, delay: }.to_json
  end

  def toast(message)
    action "toast", "", message
  end
end

Bridgetown.initializer :"roda-turbo" do
  Turbo::Streams::TagBuilder.include CustomActions
end
