Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

# usage: bundle exec rake db:migrate RAILS_ENV=api SRCDIR=db/migrate_sqlite
namespace :db do
  remove_task 'db:migrate'
  desc "Migrate the database (options: VERSION=x, SRCDIR=path, VERBOSE=false)."
  task :migrate => :environment do
    srcdir = (ENV["SRCDIR"] || "db/migrate/")
    ActiveRecord::Migrator.migrate(srcdir, ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    Rake::Task["db:schema:dump"].invoke if (ActiveRecord::Base.schema_format == :ruby && ENV['SRCDIR'].nil?)
  end
end
