class Shared::Alert < Bridgetown::Component
  def initialize(variant: :primary, message:)
    @variant, @message = variant, message
  end

  def icon_for_variant
    case @variant
    when :success
      "check2-circle"
    when :primary
      "info-circle"
    when :warning
      "exclamation-triangle"
    when :danger
      "exclamation-octagon"
    else
      "gear"
    end
  end
end
