ActiveAdmin.register Press do
  menu :label => "Press"
  config.sort_order = "published_at_desc"

  # Index
  index do
    selectable_column
    column :title
    column :source
    column :published_at
    default_actions
  end
end
