lock '3.3.5'
# Название приложения
set :application, 'fitohoney'
set :user, 'deploy'
set :use_sudo, true
# Путь к git репозиторию
set :repo_url, 'git@github.com:vened/fitohoney.git'
# Ветка по-умолчанию
set :branch, 'master'
# Директория для деплоя
set :deploy_to, '/home/deploy/www/fitohoney'
set :shared_path, '/home/deploy/www/fitohoney/shared'

set :log_level, :info
# Копирующиеся файлы и директории (между деплоями)
# set :linked_files, %w{config/database.yml config/settings.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# Ruby свистелки
set :rbenv_type, :user
set :rbenv_ruby, '2.1.5'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all


set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_init_active_record, true


namespace :data do
  # Add this in config/deploy.rb
  # and run 'cap production deploy:seed' to seed your database
  desc 'Runs rake db:seed'
  task :seed => ['production'] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # execute :rake, "db:seed"
          # execute :rake, "db:drop"
          # execute :rake, "db:create"
          # execute :rake, "db:migrate"
          execute :rake, "db:migrate:down VERSION=20150303064951"
          execute :rake, "db:migrate:up VERSION=20150303064951"
          execute :rake, "db:migrate:down VERSION=20150311115255"
          execute :rake, "db:migrate:up VERSION=20150311115255"
          execute :rake, "db:seed"
        end
      end
    end
  end
end
# after 'deploy:migrate', 'data:seed'