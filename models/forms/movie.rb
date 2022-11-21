class Forms::Movie < Lifeform::Form
  MODEL_PATH_HELPER = :url_for

  field :title,
        label: "Title (required)",
        required: true,
        autofocus: true
  field :year,
        label: "Year (required)",
        required: true
  field :director,
        label: "Director"

  field :submit, type: :submit_button, label: "Save Me", variant: "primary", library: :shoelace
  field :submit_undefined, type: :submit_button, label: "Save Me", class: "js-undefined"
end
