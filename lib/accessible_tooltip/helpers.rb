module AccessibleTooltip
  module Helpers
    def accessible_tooltip(type, *args, &block)
      partial_name = (block_given? ? Time.now.to_i + rand : args.shift)
      raise ArgumentError, "Either a block or a partial name must be specified" if !partial_name or partial_name.is_a?(Hash)
      partial_name = partial_name.to_s

      type = type.to_sym
      types = [:critical, :info, :help, :warning]
      raise ArgumentError, "type must be one of #{types.join(", ")}" unless types.include?(type)

      if args.first.is_a? Hash
        options = args.shift || {}
        element = options.fetch(:element, :span)
      else
        element = args.shift ? args.shift.to_sym : :span
        options = args.shift || {}
      end

      html_options = options.delete(:html) || {}
      link_options = options.delete(:link) || {}
      link_options.reverse_merge!(onclick: "return false")
      title = options.delete(:title)
      label = options.delete(:label)
      position = options.delete(:position)
      container_class = ["accessible_tooltip"]
      container_class << "left" if position == :left

      content_tag(element, html_options.merge(class: container_class.join(" "))) do
        link_to options.fetch(:url, "#"), link_options do

          title = t(title) if title.is_a?(Symbol)
          label = t(label) if label.is_a?(Symbol)
          tooltip = (type == :help and !title.blank?) ? :tooltip_help_for : :"tooltip_#{type}"

          out = ActiveSupport::SafeBuffer.new
          out << content_tag(:span, label, class: "label") unless label.blank?
          out << image_tag("tooltip_#{type}_small.png", alt: t(:tooltip_help), style: 'vertical-align: middle;', class: "small-icon") if options.fetch(:icon, true)
          out << content_tag(:span, class: "custom #{type} tooltip") do
            popup = ActiveSupport::SafeBuffer.new
            popup << image_tag("tooltip_#{type}.png", alt: t(tooltip), class: "tooltip-icon")
            popup << content_tag(:em, title) unless title.blank?

            if block_given?
              popup << capture(&block)
            else
              # Try to find a partial with a _tooltip suffix, or just the given partial name if not found
              popup << (render(:partial => "#{partial_name}_tooltip") rescue render(:partial => partial_name))
            end
          end
        end
      end
    end
  end
end
