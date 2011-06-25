module Haml::Filters
  module Blockcode
    include Base

    def render(str)
      "<pre class='blockcode'><code>#{Haml::Helpers.html_escape(str.strip)}</code></pre>"
    end
  end
end

