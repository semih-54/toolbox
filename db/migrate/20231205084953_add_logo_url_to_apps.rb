class AddLogoUrlToApps < ActiveRecord::Migration[7.1]
  def change
    add_column :apps, :logo_url, :string
  end
end
