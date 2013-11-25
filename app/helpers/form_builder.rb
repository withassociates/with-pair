class FormBuilder < ActionView::Helpers::FormBuilder
  def field(method, options = {}, &block)
    form_group(method) do
      [ label(method),
        input(method, options),
        help(&block)
      ].compact.join("\n").html_safe
    end
  end

  def form_group(method, &block)
    @template.content_tag(:div, class: form_group_classes(method), &block)
  end

  def label(method, text = nil, options = {}, &block)
    options[:class] = "control-label"

    super.tap do |result|
      result[%r{</label>}] = " " + errors_for(method).to_sentence + "</label>"
    end
  end

  def input(method, options = {})
    type = options.fetch(:type) { type_for_method(method) }
    send(type, method, options)
  end

  def text_field(method, options = {})
    options[:class] = "form-control"
    super
  end

  def text_area(method, options = {})
    options[:class] = "form-control"
    super
  end

  def button(value = nil, options = {}, &block)
    options[:class] = "btn btn-primary #{options[:class]}"
    super
  end

  def help(&block)
    if block_given?
      @template.content_tag(:span, class: "help-block", &block)
    end
  end

  private

  def form_group_classes(method)
    %w[form-group].tap do |classes|
      classes << "has-error" if errors_for(method).any?
    end
  end

  def errors_for(method)
    convert_to_model(@object).errors[method]
  end

  def type_for_method(method)
    case convert_to_model(@object).class.columns_hash[method.to_s].type
    when :text
      :text_area
    else
      :text_field
    end
  end
end
