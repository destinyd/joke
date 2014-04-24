#https://github.com/gregbell/active_admin/issues/2703#issuecomment-38140864
inputs = %w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
]

inputs.each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}"
  hack = %|
    module SimpleForm
      module Inputs
        class #{superclass}
          def input_html_classes
            super.push('form-control')
          end
        end
      end
    end
  |
  eval(hack)
end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.boolean_style = :nested

  # For vertical, default form
  config.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error',
                  defaults:         { input_html: { class: 'default_class' } } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label_input
    b.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
  end

  config.wrappers :prepend, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |prepend|
        prepend.use :label, class: 'input-group-addon' ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
        prepend.use :input
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :append, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |prepend|
        prepend.use :input
        prepend.use :label, class: 'input-group-addon' ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end


  config.wrappers :bootstrap3_horizontal,
                  tag:         'div',
                  class:       'form-group',
                  error_class: 'has-error',
                  defaults:    { input_html:   { class: 'default-class ' },
                                 label_html:   { class: 'control-label' },
                                 wrapper_html: { class: "col-lg-10 col-md-10" } } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label
    b.wrapper :right_column, tag: :div do |component|
      component.use :input
      component.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      component.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
    #b.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
    #b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }a
  end

  config.wrappers :group, tag: 'div', class: "form-group", error_class: 'has-error',
                  defaults:    { input_html: { class: 'default-class ' } } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label
    b.use :input, wrap_with: { class: "input-group" }
    b.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
  end

  config.default_wrapper = :bootstrap3

  config.wrappers :append_more, tag: 'div', class: 'form-group', error_class: 'has-error',
    defaults:         { input_html: { class: 'default_class' } } do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.use :label
      input.wrapper tag: 'div', class: 'input-group add-on' do |prepend|
        prepend.use :input
        prepend.wrapper tag: 'div', class: 'input-group-btn' do |prepend_div| ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
          prepend_div.wrapper tag: 'button', class: 'btn btn-default', click: 'javascript:void(0)' do |prepend_btn| ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
            prepend_btn.wrapper tag: 'i', class: 'glyphicon glyphicon-align-justify' do
            end
          end
        end
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

end
